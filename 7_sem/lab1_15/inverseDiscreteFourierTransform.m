function [transformedSignalValues, computationCost] = inverseDiscreteFourierTransform(signalValues)
   [transformedSignalValues, computationCost] = fourierTransform(signalValues, true);
end

