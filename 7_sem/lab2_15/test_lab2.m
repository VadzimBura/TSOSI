close all;
% clear all;

signal = @(x) (cos(5 * x) + sin(6 * x));
core = @(z)(cos(3 * z));

period = 2 * pi;
nValues = 128;

[x, xAxisValues1] = utils.getSamples(signal, period, nValues);
[h, xAxisValues2] = utils.getSamples(core, period, nValues);

corr = common.correlation(x, h);
crossCorr = common.crossCorrelation(x, h);
corrFFT = common.correlationFFT(x, h);
linConv = common.linearConvolution(x, h);
circConvFFT = common.circularConvulationFFT(x, h);
theirs = xcorr(x, h);

figure
subplot(4, 2, 1);
hold on;

plot(xAxisValues1, x, 'r');
plot(xAxisValues1, h, 'b');
ylabel('original');
subplot(4, 2, 2);
plot(xAxisValues1, corr(1 : nValues));
ylabel('corr');
subplot(4, 2, 4);
plot(xAxisValues1, crossCorr(1: nValues));
ylabel('crossCorr');
subplot(4, 2, 6);
plot(xAxisValues1, corrFFT(1 : nValues));
ylabel('corrFFT');
subplot(4, 2, 3);
plot(xAxisValues1, fliplr(circConvFFT));
ylabel('circConvFFT');
subplot(4, 2, 5);
plot(xAxisValues1, linConv(1 : nValues));
ylabel('linvConv');
subplot(4, 2, 8);
plot(xAxisValues1, theirs(1 : nValues));
ylabel('xcorr');
% , 'corr', 'crossCorr', 'corrFFT', 'circConvFFT', 'linvConv', 'xcorr')
