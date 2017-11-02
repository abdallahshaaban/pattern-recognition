function Result = Variance (Image , mean)
[H W] = size(Image);
n=H*W;
Result=0;
for i=1 : H
    for j=1 : W
        Result= Result + (Image(i,j) - mean).^2;
    end
end
Result = Result/n;
end

