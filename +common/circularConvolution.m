function [result, computationCost] = circularConvolution(x, h)
    result = utils.createShiftedMatrix(h, 1, -1) * utils.createShiftedColumnVector(x, 1);
    result = result / length(x);
    computationCost = length(x) * length(h);   
end



