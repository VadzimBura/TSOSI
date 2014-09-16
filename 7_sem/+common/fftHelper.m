function [result, computationCost] = fftInner(signalValues, cost, isInverseTransform)
    nValues = length(signalValues);
    computationCost = cost;
    
    if nValues == 1 
        result = signalValues;
        return;
    end
    
    odd = signalValues(2 : 2 : nValues);
    even = signalValues(1 : 2 : nValues);    
    
    [tempOddResult, costOdd] = fftInner(odd, cost, isInverseTransform);
    [tempEvenResult, costEven] = fftInner(even, cost, isInverseTransform);
    
    direction = isInverseTransform .* -1 + ~isInverseTransform;    
    wN = exp(2i * pi * direction / nValues);
    result = zeros(1, nValues);
    
    range = 1 : nValues / 2;
    ws = ones(nValues / 2);
    
    for j = 2 : nValues / 2
        ws(j) = ws(j - 1) * wN;
    end
    
    result(range) = tempEvenResult(range) + ws(range) .* tempOddResult(range);
    result(range + nValues / 2) = tempEvenResult(range) - ws(range) .* tempOddResult(range);
    computationCost = computationCost + nValues / 2 + costOdd + costEven;
end