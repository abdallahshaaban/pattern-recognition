
function LOAD( Path )
row=0;
row = int32(row);
Training = zeros(1,13) ;
Path =strcat(Path,'\')

for j = 1 : 28
Dir =strcat(Path,'Training\')
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

row=0;
row = int32(row);
Testing = zeros(1,13) ;

for j = 1 : 28
Dir =strcat(Path,'Testing\')
Dir = strcat(Dir,num2str(j));
Dir = strcat(Dir,'\');
path= strcat(Dir,'*.jpg');
srcFiles = dir(path);
for i = 1 : length(srcFiles)
    filename = strcat(Dir,srcFiles(i).name);
    I = imread(filename);
    F = feature_extraction(I);
    F = [F j];
    Testing = [Testing ; F];
    row=row+1;
end
end
Testing (1,:)=[] ;
csvwrite('Testing.csv',Testing);





