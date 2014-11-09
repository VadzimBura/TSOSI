function result = conv2d(signal, core, varargin)    
    padWidth = floor(size(core, 1) / 2 + 1);
    padHeight = floor(size(core, 2) / 2 + 1);
    paddedSignal = padarray(signal, [padWidth padHeight]);    
    result  = zeros(size(paddedSignal));

    for i = 1 + padWidth : size(result, 1) - padWidth
        for j = 1 + padHeight : size(result, 2) - padHeight    
            result(i, j) = sum(sum(...
                paddedSignal(i - padWidth + 1: i + padWidth - 1,...
                j - padHeight + 1: j + padHeight - 1) .* core));
        end
    end
    
    if nargin == 3 && strcmp(varargin(1), 'same')
        result = result(1 + padWidth  : end - padWidth, 1 + padHeight : end - padHeight);
    end
%     paddedSignal = padarray(signal, [size(core, 1) size(core, 2)]);    
%     result  = zeros(size(paddedSignal));
% 
%     for i = 1 : size(signal, 1) + size(core, 1)
%         for j = 1 : size(signal, 2) + size(core, 2)
%             endI = i + size(core, 1) - 1;
%             endJ = j + size(core, 2) - 1;
%             result(i, j) = sum(sum(paddedSignal(i : endI, j : endJ) .* core));
%         end
%     end
%     
%     if nargin == 3 && strcmp(varargin(1), 'same')
%         offsetX = floor(size(core, 1) / 2 + 1);
%         offsetY = floor(size(core, 2) / 2 + 1);
%         sizeDiff = (size(paddedSignal) - size(signal));
%         result = result(1 + offsetX  : end - (sizeDiff(1) - offsetX),...
%             1 + offsetY : end - (sizeDiff(2) - offsetY));
%     end
end