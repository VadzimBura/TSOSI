function [result, computationCost] = fftInner(signal, cost, isInverseTransform)
    nValues = length(signal);
    computationCost = cost;
    
    if nValues == 1 
        result = signal;
        return;
    end
    
    odd = signal(2 : 2 : nValues);
    even = signal(1 : 2 : nValues);    
    
    [oddResult, costOdd] = common.fftInner(odd, cost, isInverseTransform);
    [evenResult, costEven] = common.fftInner(even, cost, isInverseTransform);
    
    direction = common.ternaryOperation(-1, 1, isInverseTransform);    
    wN = exp(2i * pi * direction / nValues);
    
    range = 1 : nValues / 2;
    ws = ones(nValues / 2);
    
    for j = 2 : nValues / 2
        ws(j) = ws(j - 1) * wN;
    end
    
    result = zeros(1, nValues);
    result(range) = evenResult(range) + ws(range) .* oddResult(range);
    result(range + nValues / 2) = evenResult(range) - ws(range) .* oddResult(range);
    
    computationCost = computationCost + nValues / 2 + costOdd + costEven;
end