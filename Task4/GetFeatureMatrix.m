function [Result IDs Classes OldFeatures] = GetFeatureMatrix( MainPath , n , m)
Result = zeros(0,n*m) ;
IDs = zeros(0,1);
Classes = zeros(0,1);
OldFeatures = zeros(0,12);
MainPath = strcat(MainPath,'\');
for j = 1 : 28
Dir = MainPath; 
Dir = strcat(Dir,num2str(j));
Dir = strcat(Dir,'\');
path= strcat(Dir,'*.jpg');
srcFiles = dir(path);
for i = 1 : length(srcFiles)
    Classes = [Classes;j];
    filename = strcat(Dir,srcFiles(i).name);
    [a,b] = size(srcFiles(i).name);
    IDs = [IDs;str2num(char(srcFiles(i).name(1,b-7:b-4)))];
    I = imread(filename);
    F = feature_extraction(I);
    OldFeatures = [OldFeatures;F];
    I = GetGrayLevelImage(I); %rgb2gray(I);
    I = imresize (I ,[n  m]);
    I = reshape(I , [1 n*m]);
    Result = [Result;I];
end
end
end

