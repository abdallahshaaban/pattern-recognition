function Category = SVM_TestImage( Testing , Ft )

Training = csvread('Training.csv');

if(Ft==1)
Training(:,5:15)=[];
end

if(Ft==2)
Training =  Training(:,5:16);
end

[N M] = size(Training);

%normalization
vec =  Training(:,1:M-1) ;
vec =  [vec ; Testing ] ;



u=unique(Training(:,M));


for k=1:5
    %Vectorized statement that binarizes Group
    %where 1 is the current class and 0 is all other classes
    G1vAll=(Training(:,M)==u(k));
    models(k) = svmtrain(Training(:,1:M-1),G1vAll);
end

confusion = zeros(5,5);
%classify test cases

j=1;
    for k=1:5
        if(svmclassify(models(k),Testing(j,1:M-1))) 
            break;
        end
    end
    Category = k;
    








end