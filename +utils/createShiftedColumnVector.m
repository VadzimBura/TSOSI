function result = createShiftedColumnVector(vector, nElementsSkip)
    result = [vector(1 : nElementsSkip) fliplr(vector(nElementsSkip + 1 : end))]';
end

