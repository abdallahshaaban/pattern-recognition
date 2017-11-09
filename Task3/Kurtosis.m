function Result = Kurtosis(  Image , mean , SDeviation  )
[H W] = size(Image);
n=H*W;
Result=0;
for i=1 : H
    for j=1 : W
        Result= Result + (Image(i,j) - mean).^4;
    end
end
Result = Result/(n*(SDeviation.^4)) - 3;
end

