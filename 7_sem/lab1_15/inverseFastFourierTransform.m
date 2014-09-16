function [transformedSignalValues, computationCost] = inverseFastFourierTransform(signalValues)
    [transformedSignalValues, computationCost] = fastFourierTranformHelper(signalValues, 0, true);
end