function [result, computationCost] = dft(signal)
   [result, computationCost] = common.dftInner(signal, false);
   result = result / length(signal);
end

