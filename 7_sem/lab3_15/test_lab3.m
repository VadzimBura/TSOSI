close all;

signal = @(x) (cos(5 * x) + sin(6 * x));

period = 2 * pi;
nValues = 512;

[x, xAxisValues] = utils.getSamples(signal, period, nValues);
y = common.fwt(x);
figure
subplot(2, 1, 1);
plot(xAxisValues, y);
grid on;
subplot(2, 1, 2);
plot(xAxisValues, common.ifwt(y));
grid on;