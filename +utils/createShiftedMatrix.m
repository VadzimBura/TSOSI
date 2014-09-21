function result = createShiftedMatrix(vector, shiftStep, direction)
    len = length(vector);
    result = repmat(vector, len, 1);
    
    for i = 1 : len
        result(i, :) = circshift(result(i, :), [0 direction * (i - shiftStep)]);
    end
end