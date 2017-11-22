function [Result] = pca(DatasetPath)
[FeatureMatrix IDs Classes OldFeatures] = GetFeatureMatrix(DatasetPath , 50 , 50);
FeatureMatrix = double(FeatureMatrix);
MaxFeatureMatrix = max(FeatureMatrix);
[n d] = size(FeatureMatrix);
for i=1:d
    FeatureMatrix(:,i) = FeatureMatrix(:,i)/MaxFeatureMatrix(:,i);
end
%step 1
MeansVector = sum(FeatureMatrix)/n;
MeansImage = reshape(MeansVector,[d^0.5 d^0.5]);
figure , imshow(MeansImage);
%step 2
for i=1:d
    FeatureMatrix(:,i) = FeatureMatrix(:,i) - MeansVector(:,i);
end
%step 3
CovMatrix = (FeatureMatrix.')*FeatureMatrix;
%step 4
[EigenVectors  EigenValues] = eig(CovMatrix);
%step 5
EigenValues = sum(EigenValues);
EigenVectors = [EigenVectors;EigenValues*-1];
EigenVectors = sortrows(EigenVectors.',d+1).';
EigenValues = EigenVectors(d+1:d+1,:)*-1;
EigenVectors = EigenVectors(1:d,:);
%step 6
EigenValuesSum = sum(EigenValues);
EigenValuesCumSum = cumsum(EigenValues)/EigenValuesSum;
figure , plot(linspace(1,100,100),EigenValuesCumSum(1,1:100));
c=0;
for i=1 : d
    c=c+1;
    if EigenValuesCumSum(1,i) >=0.9
        break;
    end
end
PCs = EigenVectors(:,1:c);
FinalData = (PCs.' * FeatureMatrix.').';
SaveData( FinalData , IDs , Classes , OldFeatures);
Result = c;
end