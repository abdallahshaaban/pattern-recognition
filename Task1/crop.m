function result = crop(original_img, segmented_img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

original_img = imresize(original_img, [100, 100]);

[H W] = size(segmented_img);
result = original_img;

for row=1:H
    for col=1:W
        if (segmented_img(row, col) == 1)
            result(row, col) = original_img(row, col);
        else
            result(row, col, :) = [0 0 0];
    end
end
    
end
