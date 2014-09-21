function [result, computationCost] = fftInner(signal, cost, isInverseTransform)
    nValues = length(signal);
    computationCost = cost;
    
    if nValues == 1 
        result = signal;
        return;
    end
    % Since matlab indexes start from 1 (and in fft formula - from 0),
    % even indexes are 1, 3, 5, etc.
    even = signal(1 : 2 : nValues);
    odd = signal(2 : 2 : nValues);    
    
    [oddResult, costOdd] = common.fftInner(odd, cost, isInverseTransform);
    [evenResult, costEven] = common.fftInner(even, cost, isInverseTransform);
    
    direction = utils.ternaryOperation(-1, 1, isInverseTransform);    
    wN = exp(2i * pi * direction / nValues);
    
    range = 1 : nValues / 2;    
    ws = wN .^ (range - 1);
    
    result = zeros(1, nValues);
    result(range) = evenResult(range) + ws(range) .* oddResult(range);
    result(range + nValues / 2) = evenResult(range) - ws(range) .* oddResult(range);
    
    computationCost = computationCost + nValues / 2 + costOdd + costEven;
end