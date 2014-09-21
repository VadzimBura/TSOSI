function [result, computationCost] = circularConvulationFFT(x, h)
    result = real(common.ifft(common.fft(x) .* common.fft(h)));
    computationCost = 0;
end

