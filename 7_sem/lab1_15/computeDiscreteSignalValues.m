function [discreteSignalValues, xAxisValues] = computeDiscreteSignalValues(signalFunctionHandle, period, nValues)
    xAxisValues = (0 : nValues - 1) * (period / nValues);
    discreteSignalValues = signalFunctionHandle(xAxisValues);
end

