function result = fft2dInner(signal, isInverseTransofrm)
    cost = 0;
    result = zeros(size(signal));
    signalSize = size(signal); 
    %result = fft2(signal);
    
    for i = 1 : signalSize(1)
        result(i, :) = common.fftInner(signal(i, :), cost, isInverseTransofrm);        
    end
    for i = 1 : signalSize(2)
        result(:, i) = common.fftInner(conj(result(:, i)'), cost, isInverseTransofrm)';      
    end

end

