function [ res ] = write()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[trainingData, a, b, c] = pca('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task_4\Final Images2\Final Images\Training');
xlswrite('trainingData.csv',trainingData);
testingData = pca2('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task_4\Final Images2\Final Images\Testing', a, b, c);
xlswrite('testingData.csv',testingData);
res = 0;
end

