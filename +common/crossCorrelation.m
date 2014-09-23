function [result, computationCost] = crossCorrelation(x, h)
    xLength = length(x);
    hLength = length(h);
    computationCost = 0;
    
    paddedX = padarray(x, [0 hLength], 0, 'post');
    paddedH = padarray(h, [0 xLength], 0, 'post');
    
    result = zeros(1, hLength);
    
    for i = 1 : xLength
        for j = 1 :  xLength
            if i + j  < xLength
                result(i) = result(i) + paddedX(j) * paddedH(i + j);
                computationCost = computationCost + 1;
            end
        end
    end
    
    result = fliplr(result(1 : hLength));
end