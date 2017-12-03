function [ result ] = PriorProbability( data )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

result = zeros(28, 1);
for i=1:28
    c = count(i, data);
    result(i, 1) = c/275.0;
end
end

