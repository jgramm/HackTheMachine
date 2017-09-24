
figure(1)
%get values for a single GTG
GTG1i = find(indicator == 'GTG1');
scatter(DateTime(GTG1i), POWER(GTG1i))
title("GTG1 power vs. time")

figure(2)
scatter(DateTime(GTG1i), CURRENT(GTG1i))
title("GTG1 current vs. time")

figure(3)
scatter(DateTime(GTG1i), ENGINESPEED(GTG1i))
title("GTG1 enginespeed vs. time")

figure(4)
scatter(DateTime(GTG1i), STATORHIGHESTTEMP(GTG1i))
title("GTG1 StatorHighsetTemp vs. time")

figure(5)
scatter(DateTime(GTG1i), ENCLOSURETEMP(GTG1i))
title("GTG1 Enclosure Temp vs. time")