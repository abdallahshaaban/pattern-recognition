function result = crop(original_img, segmented_img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%original_img = imresize(original_img, [50, 50]);

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
                mnX = col-cnt;
                mxX = col;
            end
            len = max(len, cnt);
            cnt = 0;
        end
    end
    cnt = 0;
end
if(len==0)
	mnX=1;mxX=15;
end

len = 0;

for col=mnX:mxX
    for row=1:H
        if (segmented_img(row, col) == 1)
        	minY=min(minY,row);
        end
    end
end

for col=mnX:mxX
    for row=H:-1:1
        if (segmented_img(row, col) == 1)
        	maxY=max(maxY,row);
        end
    end
end
if(maxY==0)
	maxY=15;minY=1;
end
tmp=mxX-mnX;
tmp1=450-tmp;
if(tmp<450)
    mxX=mxX+(tmp1/2);
    minY=minY-(tmp1/2);
    end
for row=1:H
    for col=1:W
        if (row >= minY && row <= maxY &&col >= mnX && col <= mxX)
            result(row, col) = original_img(row, col);
        else
            result(row, col, :) = [0 0 0];
        end
    end
end

width = mxX-mnX;
height = maxY-minY;

cropped_img = imcrop(result, [mnX minY width height]);
size(cropped_img);
cropped_img=imresize(cropped_img,2);
result = cropped_img;


end
