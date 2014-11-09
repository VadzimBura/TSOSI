function test_lab4 (imagePath, coreSize, yMin, yMax)
    img = imread(imagePath);
    core = common.lowPassFilterCore(coreSize);
    image = im2double(img);
    contrastedImage = common.linearContrast(image, yMin, yMax);
    filteredImage = zeros(size(img));
    filteredImage(:, :, 1) = common.conv2d(image(:, :, 1), core, 'same');
    filteredImage(:, :, 2) = common.conv2d(image(:, :, 2), core, 'same');
    filteredImage(:, :, 3) = common.conv2d(image(:, :, 3), core, 'same');
    
    [histogramOriginal, binsOriginal] = common.histogram(rgb2gray(image), 1);    
    [histogramContrast, binsContrast] = common.histogram(rgb2gray(contrastedImage), 1);
    [histogramFiltered, binsFiltered] = common.histogram(rgb2gray(filteredImage), 1);
    
    showFigure('Original', img, binsOriginal, histogramOriginal);
    showFigure('Linear Contrast', contrastedImage, binsContrast, histogramContrast);
    showFigure('low Pass Filter', filteredImage, binsFiltered, histogramFiltered);
    xlim([0 1])
end

function showFigure(name, data, bins, hist)
    figure('Name', name)
    subplot(2, 1, 1)
    imshow(data);
    subplot(2, 1, 2)
    bar(bins, hist, 0.001, 'hist')
    xlim([0 1])
end