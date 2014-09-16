function [transformedSignalValues, computationCost] = fastFourierTranformHelper(signalValues, cost, isInverseTransform)
    nValues = length(signalValues);
    computationCost = cost;
    
    if nValues == 1 
        transformedSignalValues = signalValues;
        return;
    end
    
    odd = signalValues(2 : 2 : nValues);
    even = signalValues(1 : 2 : nValues);    
    
    [tempOddResult, costOdd] = fastFourierTranformHelper(odd, cost, isInverseTransform);
    [tempEvenResult, costEven] = fastFourierTranformHelper(even, cost, isInverseTransform);
    
    direction = isInverseTransform .* -1 + ~isInverseTransform;    
    wN = exp(2i * pi * direction / nValues);
    transformedSignalValues = zeros(1, nValues);
    
    range = 1 : nValues / 2;
    ws = ones(nValues / 2);
    
    for j = 2 : nValues / 2
        ws(j) = ws(j - 1) * wN;
    end
    
    transformedSignalValues(range) = tempEvenResult(range) + ws(range) .* tempOddResult(range);
    transformedSignalValues(range + nValues / 2) = tempEvenResult(range) - ws(range) .* tempOddResult(range);
    computationCost = computationCost + nValues / 2 + costOdd + costEven;
    
%     for j = 1 : nValues / 2
%         transformedSignalValues(j) = tempEvenResult(j) + w * tempOddResult(j);
%         transformedSignalValues(j + nValues / 2) = tempEvenResult(j) - w * tempOddResult(j);
%         w = w * wN;
%         computationCost = computationCost + 1;
%     end
    
%     computationCost = computationCost + costOdd + costEven;
end