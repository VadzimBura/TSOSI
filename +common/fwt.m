function result = fwt(signal)
    result = common.fwtInner(signal) / length(signal);
end

