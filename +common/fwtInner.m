function result = fwtInner(signal)
    len = length(signal);    
    
    if len == 1 
        result = signal;
        return;
    end 
    
    half = 1 : len / 2;
    left = signal(half) + signal(half + len / 2);
    right = signal(half) - signal(half + len / 2);
    
    leftResult = common.fwtInner(left);
    rightResult = common.fwtInner(right);  
    
    result = [leftResult rightResult];
end

