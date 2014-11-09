function [result, computationCost] = correlationFFT(x, h)
    xLen = length(x);
    result = fliplr(common.ifft((common.fft(h) .* conj(common.fft(x)))));
    computationCost = 1.5 * xLen * log2(xLen) + xLen;
end
