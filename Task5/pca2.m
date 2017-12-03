function FinalTable = pca2(DatasetPath, MeansVector, EigenValues, EigenVectors)
[FeatureMatrix IDs Classes OldFeatures] = GetFeatureMatrix(DatasetPath , 50 , 50);
FeatureMatrix = double(FeatureMatrix);
[n d] = size(FeatureMatrix);
%step 1
% if(s==1)
% MeansVector = sum(FeatureMatrix)/n;
% MeansImage = uint8(reshape(MeansVector,[d^0.5 d^0.5]));
% figure , imshow(MeansImage);
% end
%step 2
for i=1:d
    FeatureMatrix(:,i) = FeatureMatrix(:,i) - MeansVector(:,i);
end
% %step 3
% if(s==1)
% CovMatrix = ((FeatureMatrix.')*FeatureMatrix)/(n-1);
% end
% %step 4
% if(s==1)
% [EigenVectors  EigenValues] = eig(CovMatrix);
% end
% %step 5
% if(s==1)
% EigenValues = sum(EigenValues);
% EigenVectors = [EigenVectors;EigenValues*-1];
% EigenVectors = sortrows(EigenVectors.',d+1).';
% EigenValues = EigenVectors(d+1:d+1,:)*-1;
% EigenVectors = EigenVectors(1:d,:);
% end
%step 6
EigenValuesSum = sum(EigenValues);
EigenValuesCumSum = cumsum(EigenValues)/EigenValuesSum;
figure , plot(linspace(1,100,100),EigenValuesCumSum(1,1:100));
c=0;
for i=1 : d
    c=c+1;
    if EigenValuesCumSum(:,i) >=0.9
        break;
    end
end
PCs = EigenVectors(:,1:c);
FinalData = (PCs.' * FeatureMatrix.').';
FinalTable = [IDs OldFeatures FinalData Classes];
%SaveData( FinalData , IDs , Classes , OldFeatures);
Result = c;
end