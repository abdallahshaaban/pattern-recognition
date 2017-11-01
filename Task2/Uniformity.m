function  Result = Uniformity( x , y )
[H W] = size(x);
Result=0;
for i=1 : H
    Result = Result + double(y(i,1)).^2;
end
end

