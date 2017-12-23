row=0;
row = int32(row);
Training = zeros(1,16) ;

for j = 1 : 5
Dir = 'D:\Pattern\Testlabels\'; 
Dir = strcat(Dir,num2str(j));
Dir = strcat(Dir,'\');
path= strcat(Dir,'*.jpg');
srcFiles = dir(path);
for i = 1 : length(srcFiles)
    filename = strcat(Dir,srcFiles(i).name);
    I = imread(filename);
    F = feature_extraction(I);
    F = [F j];
    Training = [Training ; F];
    row=row+1;
    imshow(I);
end
end
Training (1,:)=[] ;
csvwrite('Testing.csv',Training);







