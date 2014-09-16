close all;
clear all;

signal = @(x) (cos(5 * x) + sin(6 * x));

period = 2 * pi;
nValues = 128;

[discreteSignal, xAxisValues] = computeDiscreteSignalValues(signal, period, nValues);
% 
[transformedSignal, computationCost] = discreteFourierTransform(discreteSignal);

plot(discreteSignal);
% figure
% plot(xAxisValues, angle(transformedSignal));

[transformedSignal1, computationCost] = inverseFastFourierTransform(transformedSignal);
figure
plot(real(transformedSignal1));
% 
% [transformedSignal2, computationCost] = inverseDiscreteFourierTransform(transformedSignal);
% figure
% plot(real(transformedSignal2));

% 
% [transformedSignal, computationCost] = directFastFourierTransform(discreteSignal);
% figure
% plot(xAxisValues, angle(transformedSignal));
