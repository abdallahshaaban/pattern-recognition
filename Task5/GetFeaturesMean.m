function [ result ] = GetFeaturesMean( data )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

[row col] = size(data);

result = zeros(28, col-2);

a = 1;
for i=1:28
    cnt = count(i, data);
    b = a+cnt-1;
    for j=1:col-2
        result(i, j) = sum(data(a:b, j+1)) / cnt;
    end
    a = b+1;
end
        

end

