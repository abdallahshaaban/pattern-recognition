function Result = Entropy( x , y )
[H W] = size(x);
Result=0;
for i=1 : H
    if~(y(i,1) == 0)
    Result = Result + y(i,1)*log2(y(i,1));
    end
end
Result = -Result;
end

