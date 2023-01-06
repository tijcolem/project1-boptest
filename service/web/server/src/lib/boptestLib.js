import Path from 'path';
import { promises as fs } from "fs";
import { v4 as uuidv4 } from 'uuid';
import { commandOptions } from 'redis';
import s3 from '../s3';
import {addJobToQueue} from './job';
import messaging from './messaging';

const bucket = process.env.BOPTEST_S3_BUCKET

// Keys to track test cases
// These are used as keys for object storage (e.g. S3)
// See docs/file_storage.md

export function getPrefixForTestcase(testcaseNamespace) {
  return `testcases/${testcaseNamespace}`
}

export function getPrefixForUserTestcase(userSub) {
  return `users/${userSub}/testcases`
}

export function getKeyForTestcase(testcaseNamespace, testcaseID) {
  return `${getPrefixForTestcase(testcaseNamespace)}/${testcaseID}/${testcaseID}.fmu`
}

export function getKeyForUserTestcase(userSub, testcaseID) {
  return `${getPrefixForUserTestcase(userSub)}/${testcaseID}/${testcaseID}.fmu`
}

// Keys for tests
// These are used as keys for in memory key/value storage (e.g. Redis)
// See docs/redis.md

function getTestKey(testid) {
  return `tests:${testid}`
}

function getUserTestsKey(userSub) {
  return `users:${userSub}:tests`
}

// BOPTEST functions

export async function getVersion() {
  const libraryVersion = (await fs.readFile('/boptest/version.txt', 'utf8')).trim()
  const serviceVersion = (await fs.readFile('/boptest/service-version.txt', 'utf8')).trim()
  
  const status = 200;
  const message = "Queried the version number successfully."
  const payload = {'version': libraryVersion, 'service-version': serviceVersion}
  return {status, message, payload}
}

function promiseTaskLater(task, time, ...args) {
  return new Promise((resolve, reject) => {
    setTimeout(async () => {
      try {
        await task(...args)
        resolve()
      } catch (e) {
        reject(e)
      }
    }, time)
  })
}

export function getTestcasePostForm(testcaseKey, s3url) {
  return new Promise((resolve, reject) => {
    // Construct a new postPolicy.
    const params = {
      Bucket: bucket,
      Fields: {
        key: testcaseKey
      }
    }
    
    s3.createPresignedPost(params, function(err, data) {
      if (err) {
        reject(err)
      } else {
        if (s3url) {
          data.url = s3url
        }
        resolve(data)
      }
    })
  })
}

export function getTestcases(prefix) {
  return new Promise((resolve, reject) => {
    const params = {
      Bucket: bucket,
      Prefix: prefix
    }

    s3.listObjectsV2(params, function(err, data) {
      if (err) {
        reject(err)
      } else {
        const result = data.Contents.map(item => ({ testcaseid: Path.parse(item.Key).name }));
        resolve(result)
      }
    })
  })
}

export async function isTestcase(prefix, testcaseID) {
  const testcases = await getTestcases(prefix)
  return (testcases.find(item => item.testcaseid == testcaseID)) != undefined
}

export function deleteTestcase(testcaseKey) {
  return new Promise((resolve, reject) => {
    const params = {
      Bucket: bucket,
      Key: testcaseKey
    }

    s3.deleteObject(params, function(err, data) {
      if (err) {
        reject(err)
      } else {
        resolve()
      }
    })
  })
}

async function addTestToDB(testid, userSub) {
  const testKey = getTestKey(testid)
  await messaging.hset(testKey, "status", "Queued")
  await messaging.hset(testKey, "timestamp", Date.now())
  if (userSub) {
    const userTestsKey = getUserTestsKey(userSub)
    await messaging.hset(testKey, "user", userSub)
    await messaging.sadd(userTestsKey, testid)
  }
}

async function removeTestFromDB(testid) {
  const testKey = getTestKey(testid)
  const userSub = await messaging.hget(testKey, "user")
  if (userSub) {
    const userTestsKey = getUserTestsKey(userSub)
    await messaging.srem(userTestsKey, testid)
  }
  await messaging.del(testKey)
}

export async function select(testcaseKey, userSub, asyc) {
  const testid = uuidv4()
  await addTestToDB(testid, userSub)
  const testKey = getTestKey(testid)
  await addJobToQueue("boptest_run_test", {testid, testcaseKey})
  if (! asyc) {
    await waitForStatus(testid, "Running")
  }
  return { testid }
}

export async function isTest(testid) {
  const testKey = getTestKey(testid)
  return await messaging.hexists(testKey, "status")
}

export async function getStatus(testid) {
  const exists = await isTest(testid)
  if (exists) {
    const testKey = getTestKey(testid)
    const status = await messaging.hget(testKey, "status")
    return status.toString()
  } else {
    throw(`Cannot getStatus for testid ${testid}, because it does not exist`);
  }
}

export async function waitForStatus(testid, desiredStatus, count, maxCount) {
  maxCount = typeof maxCount !== 'undefined' ? maxCount : process.env.BOPTEST_TIMEOUT
  // The default starting count is 0
  count = typeof count !== 'undefined' ? count : 0
  const currentStatus = await getStatus(testid);
  if (currentStatus == desiredStatus) {
    return;
  } else if (count >= maxCount) {
    throw(`Timeout waiting for test: ${testid} to reach status: ${desiredStatus}`);
  } else {
    // check status every 1000 miliseconds
    await promiseTaskLater(waitForStatus, 1000, testid, desiredStatus, count, maxCount);
    count++
  }
}

// Given testid, return the testcase id
export async function getTests(userSub) {
  const userTestsKey = getUserTestsKey(userSub)
  // TODO use scan instead
  const members = await messaging.smembers(userTestsKey)
  // This is a workaround, because we use "return_buffers" option on the redis client
  // We are doing that due to a limiation of the worker being stuck on python2.x
  let userTests = []
  for (const i in members) {
    userTests.push(members[i].toString())
  }
  return userTests
}

export async function stop(testid) {
  const status = await getStatus(testid)
  if (status == "Running") {
    // In this case send a stop message to the worker,
    // the worker will take care of db cleanup
    await messaging.callWorkerMethod(testid, 'stop', {})
  } else {
    // If the test is not running it is Queued, in which case
    // we don't technically remove it from the queue, but removing the entry in the db
    // will cause the worker to immediately move on when the test comes off the queue
    await removeTestFromDB(testid)
  }
}

export async function getName(testid) {
  return await messaging.callWorkerMethod(testid, 'get_name', {})
}

export async function getInputs(testid, db) {
  return await messaging.callWorkerMethod(testid, 'get_inputs', {})
}

export async function getMeasurements(testid, db) {
  return await messaging.callWorkerMethod(testid, 'get_measurements', {})
}

export async function getForecastParameters(testid) {
  return await messaging.callWorkerMethod(testid, 'get_forecast_parameters', {})
}

export async function setForecastParameters(testid, horizon, interval) {
  return await messaging.callWorkerMethod(testid, 'set_forecast_parameters', { horizon, interval })
}

export async function getForecast(testid) {
  return await messaging.callWorkerMethod(testid, 'get_forecast', {})
}

export async function initialize(testid, params) {
  return await messaging.callWorkerMethod(testid, 'initialize', params)
}

export async function getScenario(testid) {
  return await messaging.callWorkerMethod(testid, 'get_scenario', {})
}

export async function setScenario(testid, scenario) {
  return await messaging.callWorkerMethod(testid, 'set_scenario', { scenario })
}

export async function advance(testid, u) {
  return await messaging.callWorkerMethod(testid, 'advance', { u })
}

export async function getStep(testid) {
  return await messaging.callWorkerMethod(testid, 'get_step', {})
}

export async function setStep(testid, step) {
  return await messaging.callWorkerMethod(testid, 'set_step', { step })
}

export async function getKPIs(testid) {
  return await messaging.callWorkerMethod(testid, 'get_kpis', {})
}

export async function getResults(testid, point_name, start_time, final_time) {
  const params = {point_name, start_time, final_time}
  return await messaging.callWorkerMethod(testid, 'get_results', params)
}

export async function submit(testid, api_key, tags, unit_test) {
  const params = {api_key, tags, unit_test}
  return await messaging.callWorkerMethod(testid, 'post_results_to_dashboard', params)
}
