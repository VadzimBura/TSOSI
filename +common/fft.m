function [result, computationCost] = fft(signal)
    [result, computationCost] = common.fftInner(signal, 0, false);    
    %result = result / length(signal);
end
