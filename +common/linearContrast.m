function result = linearContrast(image, yMin, yMax)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    vectImage = reshape(image, [], 1);
    xMin = min(vectImage);
    xMax = max(vectImage);
    
    vectResult = (vectImage - xMin) / (xMax - xMin) * (yMax - yMin) / 255 + yMin / 255;
    result = reshape(vectResult, size(image));
end

