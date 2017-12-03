function [ result ] = posteriorProb( sample, preProb, class, fMeans, fVars )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here

[row col] = size(sample);

likelihoodVector = zeros(28, 1);

for cat=1:28
    likelihood = 1;
    for i=2:col-1
       mean = fMeans(cat, i-1);
       var = fVars(cat, i-1);
       pdf = PDF(sample(1, i), mean, var);
       likelihood = likelihood * pdf; 
    end
    %likelihood = likelihood * preProb(class, 1);
    if(isnan(likelihood) == 1)
        likelihood = 0;
    end
    likelihoodVector(cat, 1) = likelihood;
end

evidence = 0;
for i=1:28
    if(isnan(likelihoodVector(i, 1)) == 0)
        evidence = evidence + (likelihoodVector(i, 1) * preProb(i));
    end
end

postProb = (likelihoodVector(class, 1) * preProb(class, 1))/evidence;
result = postProb;
end

