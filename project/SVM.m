Testing = csvread('Testing.csv');
Training = csvread('Training.csv');


[N M] = size(Training) ;

%normalization
for i = 1:M-1
    Mx=max(Testing(:,i));
    Mn= min(Testing(:,i));
    Testing(:,i) = (Testing(:,i)-Mean(Training(:,i))) / (Mx-Mn) ;
end

for i = 1:M-1
    Mx=max(Training(:,i));
    Mn= min(Training(:,i));
    Training(:,i) = (Training(:,i)-Mean(Training(:,i))) / (Mx-Mn) ;
end

u=unique(Training(:,M));


for k=1:5
    %Vectorized statement that binarizes Group
    %where 1 is the current class and 0 is all other classes
    G1vAll=(Training(:,M)==u(k));
    models(k) = svmtrain(Training(:,1:M-1),G1vAll);
end

confusion = zeros(5,5);
%classify test cases
for j=1:size(Testing,1)
    for k=1:5
        if(svmclassify(models(k),Testing(j,1:M-1))) 
            break;
        end
    end
    result(j) = k;
    confusion(Testing(j,M),k) = confusion(Testing(j,M),k)+1;
end

true =sum(diag(confusion));

Percentage = double(true / 25.0)*100
