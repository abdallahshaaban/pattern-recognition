function [ Knn_acc, confusion ] = KnnClassifier()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%[Training, a, b, c] = pca('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task_4\Final Images2\Final Images\Training');
%Testing = pca2('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task_4\Final Images2\Final Images\Testing', a, b, c);
Training = xlsread('trainingData.xlsx');
Testing = xlsread('testingData.xlsx');
%normalization
for i = 2:72
    Mx=max(Testing(:,i));
    Mn= min(Testing(:,i));
    Testing(:,i) = (Testing(:,i)-Mean(Testing(:,i))) / (Mx-Mn) ;
end

for i = 2:72
    Mx=max(Training(:,i));
    Mn= min(Training(:,i));
    Training(:,i) = (Training(:,i)-Mean(Training(:,i))) / (Mx-Mn) ;
end

Kval = 15 ;


K = zeros(1,Kval);
Errors = zeros(1,Kval);
Knn_acc = 0;
for k = 1:Kval
confusion = zeros(28,28);

    for i = 1 : 174
        
        Distances = zeros(275,2);
        class = 0;
        
        
        for j = 1 : 275
            
            distance = sqrt(sum( (Testing (i ,2:72)- Training (j,2:72)) .* (Testing (i ,2:72)- Training (j,2:72)) ));
            Distances(j,1)= distance;
            Distances(j,2)= Training(j,73);
            
        end
        
        
        Distances = sortrows(Distances);
        
        Mx = 0 ;
        rep = zeros(1,28);
        
        for j = 1 : k 
           class = Distances(j,2) ;
           rep(1,class) = rep(1,class) +1;
             if(rep(1,class) > Mx)
                     Mx=rep(1,class);
             end
        end
        
        rep = zeros(1,28);
        
        for j = 1 : k
           class = Distances(j,2) ;
           rep(1,class) = rep(1,class) +1;
             if(rep(1,class) == Mx)
                     break;
             end 
        end
        
        Actual = Testing(i,73);
        confusion(Actual,class) = confusion(Actual,class)+1;
        
    end
    
true =sum(diag(confusion));
Percentage = double(true / 174.0)*100;

Knn_acc = max(Knn_acc, Percentage);

K(1,k) = k;
Errors(1,k) = 100 - Percentage ;
%Percentage
end
    
figure ,plot(K,Errors);





end

