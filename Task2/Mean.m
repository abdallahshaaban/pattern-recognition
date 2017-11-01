function Result = Mean( Image )
[H W] = size(Image);
n=H*W;
Result=0;
for i=1 : H
    for j=1 : W
        Result= Result + Image(i,j);
    end
end
Result = double(Result)/n;
end

