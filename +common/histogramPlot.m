function [centers, yAxisValues] =  histogramPlot(histogram, bins)
    centers = bins(1) : bins(length(bins));
    step = bins(2) - bins(1);
    yAxisValues = zeros(1, size(centers, 2));
    centers = zeros(1, size(histogram, 2));
    
    for i = 1 : length(bins) - 1
        lowBound = bins(i) + 1;
        highBound = bins(i + 1);
        yAxisValues(lowBound : highBound) = histogram(i);
        centers(i) = (i - 0.5) * step;
    end
end

