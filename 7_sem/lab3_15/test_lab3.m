close all;

signal = @(x) (cos(5 * x) + sin(6 * x));

period = 2 * pi;
nValues = 128;

[x, xAxisValues1] = utils.getSamples(signal, period, nValues);
y = common.fwt(x);
figure
plot(y);
figure
plot(common.ifwt(y));
