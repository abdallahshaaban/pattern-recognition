function [ result ] = PDF( x, mean, var )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

%[row col] = size(data);
%result = zeros(row, col-2);

% for i=1:row
%     cat = data(i, col);
%     for j=2:col-1
%         mean = fMeans(cat, j-1);
%         var = fVars(cat, j-1);
%         x = data(i, j);
%         result(i, j-1) = (1/sqrt(2*pi*var)) * exp(-((x-mean).^2)/(2*var));
%     end
% end
result = (1/sqrt(2*pi*var)) * exp(-((x-mean).^2)/(2*var));
end

