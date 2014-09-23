function [result, computationCost] = correlation(x, h)
    result = utils.createShiftedMatrix(h, 1, 1) * x';
    result = result / length(x);
    computationCost = length(x) * length(h);
end

