function result = crop(original_img, segmented_img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

original_img = imresize(original_img, [50, 50]);

[H W] = size(segmented_img);
result = original_img;

minY = 101;
maxY = 0;

cnt = 0;
len = 0;

mnX = 0;
mxX = 0;

for row=1:H
    for col=1:W
        if (segmented_img(row, col) == 1)
%             minY = min(minY, row);
%             maxY=max(maxY, row);
            cnt = cnt+1;
        else 
            if(cnt > len)
                mnX = col-len;
                mxX = col;
            end
            len = max(len, cnt);
            cnt = 0;
        end
    end
    cnt = 0;
end

cnt = 0;
len = 0;

for col=1:W
    for row=1:H
        if (segmented_img(row, col) == 1)
            cnt=cnt+1;
        else
            if(cnt > len)
                minY = row - len;
                maxY = row;
            end
            len = max(len, cnt);
            cnt = 0;
        end
    end
    cnt = 0;
end

for row=1:H
    for col=1:W
        if (row >= minY && row <= maxY && col >= mnX && col <= mxX)
            result(row, col) = original_img(row, col);
        else
            result(row, col, :) = [0 0 0];
        end
    end
end

width = mxX-mnX;
height = maxY-minY;
cropped_img = imcrop(result, [mnX minY width height]);

result = cropped_img;


end
