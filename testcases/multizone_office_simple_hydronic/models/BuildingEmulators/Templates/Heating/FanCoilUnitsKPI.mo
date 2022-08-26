within BuildingEmulators.Templates.Heating;
model FanCoilUnitsKPI
    extends .BuildingEmulators.Templates.Heating.FanCoilUnits;
    .IDEAS.Utilities.IO.SignalExchange.Read reaPProHea(y(unit="W"), description = "Gas power used by the heating production system",KPIs = IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.GasPower) annotation(Placement(transformation(extent = {{48.242510025824764,-20.242510025824757},{39.757489974175236,-11.757489974175243}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPProCoo(y(unit="W"), KPIs = IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,description = "Electric power used by the cooling production system") annotation(Placement(transformation(extent = {{-9.757489974175236,-60.24251002582476},{-18.242510025824764,-51.75748997417524}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumProCoo(y(unit="W"), description = "Electric power used by the cooling production system pump",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower) annotation(Placement(transformation(extent = {{33.757489974175236,-62.24251002582476},{42.242510025824764,-53.75748997417524}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumProHea(y(unit="W"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,description = "Electric power used by the heating production system pump") annotation(Placement(transformation(extent = {{105.75748997417523,-24.242510025824757},{114.24251002582477,-15.757489974175243}},origin = {0.0,0.0},rotation = 0.0)));

    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumEmiCooNz(y(unit="W"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,description = "Electric power used by the north zone cooling emission system pump") annotation(Placement(transformation(extent = {{-50.242510025824764,-4.242510025824757},{-41.757489974175236,4.242510025824757}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumEmiHeaNz(y(unit="W"), description = "Electric power used by the north zone heating emission system pump",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower) annotation(Placement(transformation(extent = {{13.757489974175236,35.75748997417524},{22.242510025824764,44.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumAhuCooNz(y(unit="W"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,description = "Electric power used by the north zone cooling AHU water system pump") annotation(Placement(transformation(extent = {{105.75748997417523,53.75748997417524},{114.24251002582477,62.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumAhuHeaNz(y(unit="W"), description = "Electric power used by the north zone heating AHU water system pump",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower) annotation(Placement(transformation(extent = {{171.75748997417523,73.75748997417524},{180.24251002582477,82.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumEmiCooSz(y(unit="W"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,description = "Electric power used by the south zone cooling emission system pump") annotation(Placement(transformation(extent = {{-50.242510025824764,-4.242510025824757},{-41.757489974175236,4.242510025824757}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumEmiHeaSz(y(unit="W"), description = "Electric power used by the south zone heating emission system pump",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower) annotation(Placement(transformation(extent = {{13.757489974175236,35.75748997417524},{22.242510025824764,44.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumAhuCooSz(y(unit="W"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,description = "Electric power used by the south zone cooling AHU water system pump") annotation(Placement(transformation(extent = {{105.75748997417523,53.75748997417524},{114.24251002582477,62.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPPumAhuHeaSz(y(unit="W"), description = "Electric power used by the south zone heating AHU water system pump",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower) annotation(Placement(transformation(extent = {{171.75748997417523,73.75748997417524},{180.24251002582477,82.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));

    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupProCoo(y(unit="K"), description = "Cooling production system supply temperature",KPIs = IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{-37.757489974175236,-66.24251002582476},{-46.242510025824764,-57.75748997417524}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetProCoo(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "Cooling production system return temperature") annotation(Placement(transformation(extent = {{-37.757489974175236,-86.24251002582476},{-46.242510025824764,-77.75748997417524}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupProHea(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "Heating production system supply temperature") annotation(Placement(transformation(extent = {{28.242510025824764,-16.242510025824757},{19.757489974175236,-7.757489974175243}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetProHea(y(unit="K"), description = "Heating production system return temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{65.75748997417523,-28.242510025824757},{74.24251002582477,-19.757489974175243}},origin = {0.0,0.0},rotation = 0.0)));

    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetEmiCooNz(y(unit="K"), description = "North zone cooling emission system return temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{-54.24251002582477,25.757489974175243},{-45.75748997417523,34.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupEmiCooNz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "North zone cooling emission system supply temperature") annotation(Placement(transformation(extent = {{-54.24251002582477,37.75748997417524},{-45.75748997417523,46.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetEmiHeaNz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "North zone heating emission system return temperature") annotation(Placement(transformation(extent = {{13.757489974175229,50.75748997417524},{22.24251002582477,59.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupEmiHeaNz(y(unit="K"), description = "North zone heating emission system supply temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{13.757489974175229,61.75748997417524},{22.24251002582477,70.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetAhuCooNz(y(unit="K"), description = "North zone cooling AHU water system return temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{105.75748997417523,68.25748997417524},{114.24251002582477,76.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupAhuCooNz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "North zone cooling AHU water system supply temperature") annotation(Placement(transformation(extent = {{105.75748997417523,79.25748997417524},{114.24251002582477,87.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetAhuHeaNz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "North zone heating AHU water system return temperature") annotation(Placement(transformation(extent = {{191.75748997417523,76.25748997417524},{200.24251002582477,84.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupAhuHeaNz(y(unit="K"), description = "North zone heating AHU water system supply temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{191.75748997417523,87.25748997417524},{200.24251002582477,95.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetEmiCooSz(y(unit="K"), description = "South zone cooling emission system return temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{-54.24251002582477,25.757489974175243},{-45.75748997417523,34.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupEmiCooSz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "South zone cooling emission system supply temperature") annotation(Placement(transformation(extent = {{-54.24251002582477,37.75748997417524},{-45.75748997417523,46.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetEmiHeaSz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "South zone heating emission system return temperature") annotation(Placement(transformation(extent = {{13.757489974175229,50.75748997417524},{22.24251002582477,59.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupEmiHeaSz(y(unit="K"), description = "South zone heating emission system supply temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{13.757489974175229,61.75748997417524},{22.24251002582477,70.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetAhuCooSz(y(unit="K"), description = "South zone cooling AHU water system return temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{105.75748997417523,68.25748997417524},{114.24251002582477,76.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupAhuCooSz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "South zone cooling AHU water system supply temperature") annotation(Placement(transformation(extent = {{105.75748997417523,79.25748997417524},{114.24251002582477,87.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTRetAhuHeaSz(y(unit="K"), KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,description = "South zone heating AHU water system return temperature") annotation(Placement(transformation(extent = {{191.75748997417523,76.25748997417524},{200.24251002582477,84.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaTSupAhuHeaSz(y(unit="K"), description = "South zone heating AHU water system supply temperature",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None) annotation(Placement(transformation(extent = {{191.75748997417523,87.25748997417524},{200.24251002582477,95.74251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPFcuNz(KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,description = "Electric power used by the north zone fan coil units",y(unit = "W")) annotation(Placement(transformation(extent = {{-89.75748997417523,47.75748997417524},{-98.24251002582477,56.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
    .IDEAS.Utilities.IO.SignalExchange.Read reaPFcuSz(y(unit = "W"),description = "Electric power used by the south zone fan coil units",KPIs = .IDEAS.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower) annotation(Placement(transformation(extent = {{-89.75748997417523,47.75748997417524},{-98.24251002582477,56.24251002582476}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(reaPProHea.u,boi.P) annotation(Line(points = {{49.09101203098972,-16},{53,-16},{53,-7.999999999999998}},color = {0,0,127}));
    connect(reaPProCoo.u,chi.P) annotation(Line(points = {{-8.908987969010283,-56},{-4.954493984505142,-56},{-4.954493984505142,-54},{-1,-54}},color = {0,0,127}));
    connect(pumCoo.P,reaPPumProCoo.u) annotation(Line(points = {{-2.133292087251448,-74.80003374679427},{2,-74.80003374679427},{2,-66},{26.908987969010283,-66},{26.908987969010283,-58},{32.90898796901028,-58}},color = {0,0,127}));
    connect(pumHea.P,reaPPumProHea.u) annotation(Line(points = {{96.2910623192392,-35.14723280665025},{100,-35.14723280665025},{100,-20},{104.90898796901027,-20}},color = {0,0,127}));
    connect(mixingEmiCoo[1].P,reaPPumEmiCooNz.u) annotation(Line(points = {{-63,12.000000000000004},{-56,12.000000000000004},{-56,0},{-51.09101203098972,0}},color = {0,0,127}));
    connect(mixingEmiHea[1].P,reaPPumEmiHeaNz.u) annotation(Line(points = {{-1,32},{5.954493984505142,32},{5.954493984505142,40},{12.908987969010283,40}},color = {0,0,127}));
    connect(mixingAhuCoo[1].P,reaPPumAhuCooNz.u) annotation(Line(points = {{70.13477794117637,55.03643333333331},{87.52188295509332,55.03643333333331},{87.52188295509332,58},{104.90898796901027,58}},color = {0,0,127}));
    connect(mixingAhuHea[1].P,reaPPumAhuHeaNz.u) annotation(Line(points = {{154.55261249999992,62.65324852941174},{162.7308002345051,62.65324852941174},{162.7308002345051,78},{170.90898796901027,78}},color = {0,0,127}));
    connect(mixingEmiCoo[2].P,reaPPumEmiCooSz.u) annotation(Line(points = {{-63,12.000000000000004},{-56,12.000000000000004},{-56,0},{-51.09101203098972,0}},color = {0,0,127}));
    connect(mixingEmiHea[2].P,reaPPumEmiHeaSz.u) annotation(Line(points = {{-1,32},{5.954493984505142,32},{5.954493984505142,40},{12.908987969010283,40}},color = {0,0,127}));
    connect(mixingAhuCoo[2].P,reaPPumAhuCooSz.u) annotation(Line(points = {{70.13477794117637,55.03643333333331},{87.52188295509332,55.03643333333331},{87.52188295509332,58},{104.90898796901027,58}},color = {0,0,127}));
    connect(mixingAhuHea[2].P,reaPPumAhuHeaSz.u) annotation(Line(points = {{154.55261249999992,62.65324852941174},{162.7308002345051,62.65324852941174},{162.7308002345051,78},{170.90898796901027,78}},color = {0,0,127}));
    connect(senTSupProCoo.T,reaTSupProCoo.u) annotation(Line(points = {{-28,-53.97522156344958},{-28,-62},{-36.90898796901028,-62}},color = {0,0,127}));
    connect(reaTRetProCoo.u,senTRetProCoo.T) annotation(Line(points = {{-36.90898796901028,-82},{-34,-82},{-34,-75.97522156344958}},color = {0,0,127}));
    connect(reaTSupProHea.u,senTSupProHea.T) annotation(Line(points = {{29.091012030989717,-12},{34,-12},{34,-7.303494910683021}},color = {0,0,127}));
    connect(reaTRetProHea.u,senTRetProHea.T) annotation(Line(points = {{64.90898796901027,-24},{60,-24},{60,-35.97522156344958},{52,-35.97522156344958}},color = {0,0,127}));
    connect(mixingEmiCoo[1].TRet,reaTRetEmiCooNz.u) annotation(Line(points = {{-63,15.000000000000004},{-59.045506015494865,15.000000000000004},{-59.045506015494865,30},{-55.091012030989724,30}},color = {0,0,127}));
    connect(mixingEmiCoo[1].TSup,reaTSupEmiCooNz.u) annotation(Line(points = {{-63,17.000000000000004},{-63,42},{-55.091012030989724,42}},color = {0,0,127}));
    connect(mixingEmiHea[1].TSup,reaTSupEmiHeaNz.u) annotation(Line(points = {{-1.0000000000000018,37},{2,37},{2,66},{12.908987969010274,66}},color = {0,0,127}));
    connect(mixingEmiHea[1].TRet,reaTRetEmiHeaNz.u) annotation(Line(points = {{-1.0000000000000018,35},{4,35},{4,55},{12.908987969010274,55}},color = {0,0,127}));
    connect(mixingAhuCoo[1].TRet,reaTRetAhuCooNz.u) annotation(Line(points = {{70.13477794117637,58.03643333333331},{86,58.03643333333331},{86,72.5},{104.90898796901027,72.5}},color = {0,0,127}));
    connect(mixingAhuCoo[1].TSup,reaTSupAhuCooNz.u) annotation(Line(points = {{70.13477794117637,60.03643333333331},{84,60.03643333333331},{84,83.5},{104.90898796901027,83.5}},color = {0,0,127}));
    connect(reaTRetAhuHeaNz.u,mixingAhuHea[1].TRet) annotation(Line(points = {{190.90898796901027,80.5},{186,80.5},{186,65.65324852941174},{154.55261249999992,65.65324852941174}},color = {0,0,127}));
    connect(reaTSupAhuHeaNz.u,mixingAhuHea[1].TSup) annotation(Line(points = {{190.90898796901027,91.5},{184,91.5},{184,67.65324852941174},{154.55261249999992,67.65324852941174}},color = {0,0,127}));
    connect(mixingEmiCoo[2].TRet,reaTRetEmiCooSz.u) annotation(Line(points = {{-63,15.000000000000004},{-59.045506015494865,15.000000000000004},{-59.045506015494865,30},{-55.091012030989724,30}},color = {0,0,127}));
    connect(mixingEmiCoo[2].TSup,reaTSupEmiCooSz.u) annotation(Line(points = {{-63,17.000000000000004},{-63,42},{-55.091012030989724,42}},color = {0,0,127}));
    connect(mixingEmiHea[2].TSup,reaTSupEmiHeaSz.u) annotation(Line(points = {{-1.0000000000000018,37},{2,37},{2,66},{12.908987969010274,66}},color = {0,0,127}));
    connect(mixingEmiHea[2].TRet,reaTRetEmiHeaSz.u) annotation(Line(points = {{-1.0000000000000018,35},{4,35},{4,55},{12.908987969010274,55}},color = {0,0,127}));
    connect(mixingAhuCoo[2].TRet,reaTRetAhuCooSz.u) annotation(Line(points = {{70.13477794117637,58.03643333333331},{86,58.03643333333331},{86,72.5},{104.90898796901027,72.5}},color = {0,0,127}));
    connect(mixingAhuCoo[2].TSup,reaTSupAhuCooSz.u) annotation(Line(points = {{70.13477794117637,60.03643333333331},{84,60.03643333333331},{84,83.5},{104.90898796901027,83.5}},color = {0,0,127}));
    connect(reaTRetAhuHeaSz.u,mixingAhuHea[2].TRet) annotation(Line(points = {{190.90898796901027,80.5},{186,80.5},{186,65.65324852941174},{154.55261249999992,65.65324852941174}},color = {0,0,127}));
    connect(reaTSupAhuHeaSz.u,mixingAhuHea[2].TSup) annotation(Line(points = {{190.90898796901027,91.5},{184,91.5},{184,67.65324852941174},{154.55261249999992,67.65324852941174}},color = {0,0,127}));
    connect(reaPFcuNz.u,fanCoilUnit[1].P) annotation(Line(points = {{-88.90898796901027,52},{-79,52},{-79,66.6}},color = {0,0,127}));
    connect(reaPFcuSz.u,fanCoilUnit[2].P) annotation(Line(points = {{-88.90898796901027,52},{-79,52},{-79,66.6}},color = {0,0,127}));

end FanCoilUnitsKPI;
