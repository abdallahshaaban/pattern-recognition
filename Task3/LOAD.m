row=0;
row = int32(row);
Training = zeros(1,13) ;

for j = 1 : 28
Dir = 'F:\Final Images\Training\'; 
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
end
end
Training (1,:)=[] ;
csvwrite('Training.csv',Training);







