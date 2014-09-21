function [result, computationCost] = correlationFFT(x, h)
    result = (common.ifft((common.fft(h) .* conj(common.fft(x)))));
    computationCost = length(x) * length(h);
end
