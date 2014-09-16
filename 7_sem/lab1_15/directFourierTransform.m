function [transformedSignalValues, computationCost] = fastFourierTranformHelper(signalValues, cost, isInverseTransform)
    nValues = length(signalValues);
    computationCost = cost;
    
    if nValues == 1 
        transformedSignalValues = signalValues;
        return;
    end
    
    odd = signalValues(1 : 2 : nValues);
    even = signalValues(2 : 2 : nValues);    
    
    [tempOddResult, costOdd] = fastFourierTranformHelper(odd, cost, isInverseTransform);
    [tempEvenResult, costEven] = fastFourierTranformHelper(even, cost, isInverseTransform);
    
    direction = isInverseTransform .* -1 + ~isInverseTransform;    
    wN = exp(-2i * pi * direction / nValues);
    w = 1;
    
    transformedSignalValues = zeros(nValues);
    
%     range = 1 : nValues / 2;
%     ws = w * wN * range;
%     transformedSignalValues(range) = tempEvenResult(range) + ws(range) .* tempOddResult(range);
%     transformedSignalValues(range + nValues / 2) = tempEvenResult(range) - ws(range) .* tempOddResult(range);
%     computationCost = computationCost + nValues / 2;
    
    for j = 1 : nValues / 2
        transformedSignalValues(j) = tempEvenResult(j) + w * tempOddResult(j);
        transformedSignalValues(j + nValues / 2) = tempEvenResult(j) - w * tempOddResult(j);
        w = w * wN;
        computationCost = computationCost + 1;
    end
    
    computationCost = computationCost + costOdd + costEven;
end