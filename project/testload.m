row=0;
row = int32(row);
Training = zeros(1,16) ;
confusion = zeros(5,5);
cnt = 0;
X = imread('15.jpg');
X = feature_extraction(X , 3);
for j = 1 : 5
Dir = 'D:\Pattern\Testlabels\'; 
Dir = strcat(Dir,num2str(j));
Dir = strcat(Dir,'\');
path= strcat(Dir,'*.jpg');
srcFiles = dir(path);
for i = 1 : length(srcFiles)
    filename = strcat(Dir,srcFiles(i).name);
    I = imread(filename);
    F = feature_extraction(I , 3);
    cat = M_knn_TestImage(F,3);
    if(cat == j)
        
        cnt = cnt + 1 ;
    end
    row=row+1;
    
end
end
cnt








