function result = crop(original_img, segmented_img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

original_img = imresize(original_img, [100, 100]);

[H W] = size(segmented_img);
result = original_img;

minX = 101;
minY = 101;
maxX = 0;
maxY = 0;

for row=1:H
    for col=1:W
        if (segmented_img(row, col) == 1)
            minX = min(minX, col), minY = min(minY, row), maxX=max(maxX, col), maxY=max(maxY, row);
        end
    end
end


for row=1:H
    for col=1:W
        if (row >= minY && row <= maxY && col >= minX && col <= maxX)
            result(row, col) = original_img(row, col);
        else
            result(row, col, :) = [0 0 0];
        end
    end
end

width = maxX-minX;
height = maxY-minY;

cropped_img = imcrop(result, [minX minY width height]);

result = cropped_img;

end
