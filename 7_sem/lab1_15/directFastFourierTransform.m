function [transformedSignalValues, computationCost] = directFastFourierTransform(signalValues)
    [transformedSignalValues, computationCost] = fastFourierTranformHelper(signalValues, 0, false);
    transformedSignalValues = transformedSignalValues / length(signalValues);
end