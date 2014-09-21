close all;
clear all;

signal = @(x) (cos(5 * x) + sin(6 * x));

period = 2 * pi;
nValues = 512;

[discreteSignal, xAxisValues] = utils.getSamples(signal, period, nValues);

[dft, dftCost] = common.dft(discreteSignal);
[idft, idftCost] = common.idft(dft);

[fft, fftCost] = common.fft(discreteSignal);
[ifft, ifftCost] = common.ifft(fft);

draw(xAxisValues, discreteSignal,...
    dft, dftCost, fft, fftCost, idft, idftCost, ifft, ifftCost);
