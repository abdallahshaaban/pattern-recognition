function Result = Skewness( Image , mean , SDeviation )
[H W] = size(Image);
n=H*W;
Result=0;
for i=1 : H
    for j=1 : W
        Result= Result + double(Image(i,j) - mean).^3;
    end
end
Result = double(Result)/(n*double(SDeviation.^3));
end

