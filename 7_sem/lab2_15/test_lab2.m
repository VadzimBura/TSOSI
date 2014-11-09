close all;
%clear all;

signal = @(x) (cos(5 * x) + sin(6 * x));
core = @(z)(cos(3 * z));

period = 2 * pi;
nValues = 64;

[x, xAxisValues1] = utils.getSamples(signal, period, nValues);
[h, xAxisValues2] = utils.getSamples(core, period, nValues);

[corr, corrCost] = common.correlation(x, h);
[crossCorr, crossCorrCost] = common.crossCorrelation(x, h);
[corrFFT, corrFFTCost] = common.correlationFFT(x, h);
[linConv, linConvCost] = common.linearConvolution(x, h);
[circConv, circConvCost] = common.circularConvolution(x, h);
[circConvFFT, circConvFFTCost] = common.circularConvulationFFT(x, h);
theirs = xcorr(x, h);

figure
subplot(3, 1, 1);
hold on;
plot(xAxisValues1, x, 'r');
plot(xAxisValues1, h, 'b');
title('Original');
grid on;

subplot(3, 1, 2);
plot(xAxisValues1, circConv);
title(sprintf('Convolution, Computation Cost: %d', circConvCost))
grid on;

subplot(3, 1, 3);
plot(xAxisValues1, circConvFFT);
title(sprintf('ConvolutionFFT, Computation Cost: %d', circConvFFTCost))
grid on;

figure
subplot(3, 1, 1);
hold on;
plot(xAxisValues1, x, 'r');
plot(xAxisValues1, h, 'b');
title('Original');
grid on;

subplot(3, 1, 2);
plot(xAxisValues1, corr);
title(sprintf('Correlation, Computation Cost: %d', corrCost))
grid on;

subplot(3, 1, 3);
plot(xAxisValues1, corrFFT);
title(sprintf('ConvolutionFFT, Computation Cost: %d', corrFFTCost))
grid on;
% subplot(2, 1, 1);
% hold on;
% plot(xAxisValues1, circConvFFT);
% ylabel('circConvFFT');
% plot(xAxisValues1, circConv(1 : nValues), 'r');
% ylabel('circConv')
% 
% subplot(2, 1, 2);
% plot(xAxisValues1, circConv(1 : nValues));
% ylabel('circConv');
% 
% 
% subplot(4, 2, 1);
% hold on;
% plot(xAxisValues1, x, 'r');
% plot(xAxisValues1, h, 'b');
% ylabel('original');
% 
% subplot(4, 2, 2);
% plot(xAxisValues1, corr(1 : nValues));
% ylabel('corr');
% 
% subplot(4, 2, 4);
% plot(xAxisValues1, crossCorr(1: nValues));
% ylabel('crossCorr');
% 
% subplot(4, 2, 6);
% plot(xAxisValues1, corrFFT(1 : nValues));
% ylabel('corrFFT');
% 
% subplot(4, 2, 3);
% plot(xAxisValues1, circConvFFT);
% ylabel('circConvFFT');
% 
% subplot(4, 2, 5);
% plot(xAxisValues1, linConv(1 : nValues));
% ylabel('linvConv');
% 
% subplot(4, 2, 7);
% plot(xAxisValues1, circConv(1 : nValues));
% ylabel('circConv');
% 
% subplot(4, 2, 8);
% plot(xAxisValues1, theirs(1 : nValues));
% ylabel('xcorr');
