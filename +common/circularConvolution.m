function [result, computationCost] = circularConvolution(x, h)
    result = utils.createShiftedMatrix(x, 1, -1) * utils.createShiftedColumnVector(h, 1);
    result = result / length(x);
    computationCost = length(x) * length(h);   
end



