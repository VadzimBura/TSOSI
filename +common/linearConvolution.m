function [result, computationCost] = linearConvolution(x, h)
    xLength = length(x);
    hLength = length(h);
    computationCost = 0;
    
    paddedX = padarray(x, [0 hLength], 0, 'post');
    paddedH = padarray(h, [0 xLength], 0, 'post');
    
    result = zeros(1, hLength + xLength - 1);
    
    for i = 1 : xLength + hLength - 1
        for j = 1 : xLength
            if i - j + 1 > 0
                result(i) = result(i) + paddedX(j) * paddedH(i - j + 1);
                computationCost = computationCost + 1;
            end
        end
    end
end

