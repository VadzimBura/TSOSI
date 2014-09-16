function [transformedSignalValues, computationCost] = discreteFourierTransform(signalValues)
   [transformedSignalValues, computationCost] = fourierTransform(signalValues, false);
end

