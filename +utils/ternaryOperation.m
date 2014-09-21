function result = ternaryOperation(arg1, arg2, condition)
    result= condition .* arg1 + ~condition .* arg2;
end

