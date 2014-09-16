function [result, computationCost] = ifft(signal)
    [result, computationCost] = common.fftInner(signal, 0, true);
end