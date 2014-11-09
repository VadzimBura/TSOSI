function [histogram, bins]  = histogram(indata, binStep)
    max = 255;
    vectIndata = reshape(indata, 1, []) * max;
    histogram = zeros(1, floor((max / binStep) + 1));
    bins = (0 : binStep : max) / max;
    for i = 1 : length(vectIndata)
        index = floor(vectIndata(i) / binStep) + 1;
        histogram(index) = histogram(index) + 1;
    end
end
