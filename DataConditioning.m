%Try to condition data
%GOAL: average values with the same time stamp
%keep track of variance of values with the same time stamp
numericdata = [BEARINGTEMPAFT,BEARINGTEMPFWD,BLEEDAIRHEADPRES, ...
    COALESCERDIFFPRES, CURRENT, ENCLOSURETEMP, ENGINELOPRES, ENGINESPEED, ...
    ENGINEVIBS, ENGLOCLRINPRES, ENGLOCLROUTPRES, ENGLUBEOILTEMP, ...
    EXCTRBEARINGTEMP, FREQUENCY, FUELFILTERDP, FUELMANIFOLDPRES, ...
    FUELOILHEADPRES, FUELOILHEADTEMP, GEARBOXOILPRES, GENAIRCLRINP, ...
    GENAIRCLROUTP, GENAIRTEMP, GENBEARINGTEMP, GENLOCLRINPRES, ...
    GENLOCLROUTPRES, GENLOLEVEL1N, GENLOPRES, GENSWSTRNRDP, HPAIRPRES ...
    LOSUMPLEVEL1N, LUBEOILFILTERDP, POWER, POWERFACTOR, STATOR1TEMP, ...
    STATOR2TEMP, STATOR3TEMP, STATOR4TEMP, STATOR5TEMP, STATOR6TEMP, ...
    STATORHIGHESTTEMP, SWPUMPDISPRES, TURBINEINLETTEMP, VOLTAGE];

names = ["BEARING TEMP AFT", "BEARING TEMP FWD", "BLEED AIR HEAD PRES",...
"COALESCER DIFF PRES","CURRENT","ENCLOSURE TEMP","ENGINE LO PRES", "ENGINE SPEED", ...
"ENGINE VIBS", "ENG LO CLR IN PRES","ENG LO CLR OUT PRES","ENG LUBE OIL TEMP",...
"EXCTR BEARING TEMP","FREQUENCY", "FUEL FILTER DP", "FUEL MANIFOLD PRES",...
"FUEL OIL HEAD PRES", "FUEL OIL HEAD  TEMP","GEARBOX OIL PRES","GEN AIR CLR IN P" ...
"GEN AIR CLR OUT P","GEN AIR TEMP","GEN BEARING TEMP","GEN LO CLR IN PRES",...
"GEN LO CLR OUT PRES", "GEN LO LEVEL:1=N", "GEN LO PRES","GEN SW STRNR DP","HP AIR PRES",...
"LO SUMP LEVEL: 1=N", "LUBE OIL FILTER DP","POWER","POWER FACTOR","STATOR 1 TEMP",...
"STATOR 2 TEMP","STATOR 3 TEMP","STATOR 4 TEMP","STATOR 5 TEMP","STATOR 6 TEMP",...
"STATOR HIGHEST TEMP","SW PUMP DIS PRES","TURBINE INLET TEMP","VOLTAGE"];


utimes = GetUniqueTimes(DateTime);

%Calculate average and variance for paramter measures with same time stamp
% consolidate data to a single machine
GTGS1i = find(indicator == "GTG1");
GTG1data = numericdata(GTGS1i, :);
GTG1times = DateTime(GTGS1i);

for i = 1 : max(size(GTG1times))
    sharedtimes = find(DateTime == GTG1times(i));
    GTG1avgnumericdata(i, :) = mean(numericdata(sharedtimes, :));
    varnumericdata(i, :) = var(numericdata(sharedtimes, :));
end

%{
close all
for setindex = 1: min(size(GTG1avgnumericdata))
    figure()
    histfit(GTG1avgnumericdata(:, setindex))
    title(["GTG1", names(setindex)])
end
%}
close all

%Working on Gen LO press data clean up
%find indexes when Gen LO is super low

lowLOi = find(GTG1avgnumericdata(:, 27) > 5 & GTG1avgnumericdata(:, 43) > 0 & GTG1avgnumericdata(:, 42) <= 240);
for setindex = 1: min(size(GTG1avgnumericdata))
    figure(setindex)
    histfit(GTG1avgnumericdata(lowLOi, setindex))
    title(["GTG1 without low LO data", names(setindex)])
end

%plotting bimodal histfits for Turbine Inlet Temp > 300
highTurbInletTempi = find(GTG1avgnumericdata(:, 27) > 5 & GTG1avgnumericdata(:, 42) > 240 & GTG1avgnumericdata(:, 42) <= 260);
for setindex = 1: min(size(GTG1avgnumericdata))
    figure(setindex)
    hold on
    histfit(GTG1avgnumericdata(highTurbInletTempi, setindex))
    title(["GTG1 high Turbine Inlet temp data", names(setindex)])
end
%}