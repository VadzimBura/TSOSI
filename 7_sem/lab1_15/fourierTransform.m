function [transformedSignalValues, computationCost] = fourierTransform(signalValues, isInverseTransform)
    nValues = length(signalValues);
    direction = isInverseTransform .* -1 + ~isInverseTransform;    
    matrix = exp((2i * direction * pi) / nValues * ([0 : nValues - 1]' * [0 : nValues - 1]));

    transformedSignalValues = signalValues * matrix;

    computationCost = size(matrix, 1) * size(matrix, 2);
    if direction == 1
        transformedSignalValues = transformedSignalValues / nValues;
    end
end

