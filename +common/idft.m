function [result, computationCost] = idft(signal)
   [result, computationCost] = common.dftInner(signal, true);
end

