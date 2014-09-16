close all;
clear all;

signal = @(x) (cos(5 * x) + sin(6 * x));

period = 2 * pi;
nValues = 128;

[discreteSignal, xAxisValues] = computeDiscreteSignalValues(signal, period, nValues);

[dft, dftCost] = discreteFourierTransform(discreteSignal);
[idft, idftCost] = inverseDiscreteFourierTransform(dft);

[fft, fftCost] = fastFourierTransform(discreteSignal);
[ifft, ifftCost] = inverseFastFourierTransform(fft);

draw(xAxisValues, discreteSignal, dft, dftCost, fft, fftCost, idft, idftCost, ifft, ifftCost);
