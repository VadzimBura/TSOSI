function [result, computationCost] = dftInner(signal, isInverseTransform)
    nValues = length(signal);
    direction = utils.ternaryOperation(-1, 1, isInverseTransform); 
    matrix = exp((2i * direction * pi) / nValues * ([0 : nValues - 1]' * [0 : nValues - 1]));

    result = signal * matrix;
    computationCost = size(matrix, 1) * size(matrix, 2);
end

