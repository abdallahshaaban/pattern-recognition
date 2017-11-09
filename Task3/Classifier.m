Testing = csvread('Testing.csv');
Training = csvread('Training.csv');

%normalization
for i = 1:12
    Mx=max(Testing(:,i));
    Mn= min(Testing(:,i));
    Testing(:,i) = (Testing(:,i)-Mean(Testing(:,i))) / (Mx-Mn) ;
end

for i = 1:12
    Mx=max(Training(:,i));
    Mn= min(Training(:,i));
    Training(:,i) = (Training(:,i)-Mean(Training(:,i))) / (Mx-Mn) ;
end

Kval = 15 ;


K = zeros(1,Kval);
Errors = zeros(1,Kval);

for k = 1:Kval
confusion = zeros(28,28);

    for i = 1 : 174
        
        Distances = zeros(275,2);
        class = 0;
        
        
        for j = 1 : 275
            
            distance = sqrt(sum( (Testing (i ,1:12)- Training (j,1:12)) .* (Testing (i ,1:12)- Training (j,1:12)) ));
            Distances(j,1)= distance;
            Distances(j,2)= Training(j,13);
            
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
        
        Actual = Testing(i,13);
        confusion(Actual,class) = confusion(Actual,class)+1;
        
    end
    
true =sum(diag(confusion));
Percentage = double(true / 174.0)*100;

K(1,k) = k;
Errors(1,k) = 100 - Percentage ;
Percentage
end
    
    figure 
    plot(K,Errors);




