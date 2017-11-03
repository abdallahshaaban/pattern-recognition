function [y x] = hist(Image)
x = uint8(zeros(256,1));
y = double(zeros(256,1));
[H W] = size(Image);
for i=1:H
    for j=1:W
        x(Image(i,j)+1,1) = Image(i,j);
        y(Image(i,j)+1,1) = y(Image(i,j)+1,1) + 1;
    end
end
end

