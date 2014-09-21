function [samples, timestamps] = getSamples(signalFunctionHandle, period, nValues)
    timestamps = (0 : nValues - 1) * (period / nValues);
    samples = signalFunctionHandle(timestamps);
end

