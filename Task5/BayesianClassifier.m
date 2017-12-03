function [ testingData, predicted, acc, trainingData, priorProb, finalP ] = BayesianClassifier()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%Training Part
%data = GetData('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task_4\Final Images\Final Images\Training');
trainingData = xlsread('trainingData.xlsx');
%[trainingData, a, b, c] = pca('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task_4\Final Images2\Final Images\Training');
%normalization of train data
% for i=2:84
%     mx=max(trainingData(:,i));
%     mn=min(trainingData(:,i));
%     trainingData(:, i) = (trainingData(:, i) - Mean(trainingData(:, i))) / (mx-mn);
% end

priorProb = PriorProbability(trainingData);
fMean = GetFeaturesMean(trainingData);
fVariance = GetFeaturesVariance(trainingData);
result = fMean;
res = fVariance;

%Testing Part
testingData = xlsread('testingData.xlsx');
%testingData = pca2('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task_4\Final Images2\Final Images\Testing', a, b, c);
%pdf = PDF(testingData, fMean, fVariance);


% %normalization of test data
% for i=2:84
%     mx=max(testingData(:,i));
%     mn=min(testingData(:,i));
%     testingData(:, i) = (testingData(:, i) - Mean(testingData(:, i))) / (mx-mn);
% end

[row col] = size(testingData);
predicted = zeros(row, col);
finalP = zeros(row, 28);

totalValid = 0;
for i=1:row
    predicted(i, 1:col-1) = testingData(i, 1:col-1);
    mx = 0;
    class = 1;
    for cat=1:28
       postProb = posteriorProb( testingData(i, 1:col), priorProb, cat, fMean, fVariance ) 
       finalP(i, cat) = postProb;
       if(postProb > mx)
           mx = postProb;
           class = cat;
       end
    end
    predicted(i, col) = class;
    if(class == testingData(i, col))
        totalValid = totalValid + 1;
    end
end

acc = (100*totalValid)/174;

end

