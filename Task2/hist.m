function [y x] = hist(Image)
x = uint8(zeros(256,1));
y = double(zeros(256,1));
[H W] = size(Image);
for clr = 0 : 255
    x(clr+1,1) = clr;
    for i=1:H
        for j=1:W
            if Image(i,j) == clr
                y(clr+1,1) = y(clr+1,1) + 1;
            end
        end
    end
end
end

