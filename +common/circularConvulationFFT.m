function [result, computationCost] = circularConvulationFFT(x, h)
    xLen = length(x);
    result = real(common.ifft(common.fft(x) .* common.fft(h)));
    computationCost = 1.5 * xLen * log2(xLen) + xLen;
end

