function [ result ] = count( cat, data )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

[row col] = size(data);
result = 0;
for i=1:row
    if(data(i, col) == cat)
        result = result + 1;
    end
end

end

