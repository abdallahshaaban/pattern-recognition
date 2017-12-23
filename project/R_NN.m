Testing = csvread('Testing.csv');
Training = csvread('Training.csv');


[N M] = size(Training) ;

%normalization
for i = 1:M-1
    Mx=max(Testing(:,i));
    Mn= min(Testing(:,i));
    Testing(:,i) = (Testing(:,i)-Mean(Testing(:,i))) / (Mx-Mn) ;
end

for i = 1:M-1
    Mx=max(Training(:,i));
    Mn= min(Training(:,i));
    Training(:,i) = (Training(:,i)-Mean(Training(:,i))) / (Mx-Mn) ;
end

Bestk = - 1 ;
BestConfusion = -1;
BestPercent = -1.0 ;

Kval = 2 ;

for k = 1:Kval
    
confusion = zeros(5,5);

    for i = 1 : N
        
        Distances = zeros(25,2);
        class = 1000;
        
        
        for j = 1 : N
            
            distance = sqrt(sum( (Testing (i ,1:M-1 ) - Training (j,1:M-1)) .* (Testing (i ,1:M-1) - Training (j,1:M-1))));
            Distances(j,1)= distance;
            Distances(j,2)= Training(j,M);
            
        end
        
        
        Distances = sortrows(Distances);
        rep = zeros(1,5);
        j=1;
        Mx = -1 ;
        
        while ( j<25 &&  Distances (j,1) <= k)
         class = Distances(j,2) ;
         rep(1,class) = rep(1,class) +1;
         j= j+1;
          if(rep(1,class) > Mx)
              Mx=rep(1,class);
          end
        end
        
        if(Mx == -1)
            continue;
        end
        
        rep = zeros(1,5);
        j = 1 ;
        
         while ( j<25 &&  Distances (j,1) <= k)
         class = Distances(j,2) ;
         rep(1,class) = rep(1,class) +1;
         j= j+1;
         if(rep(1,class) == Mx)
               break;
         end 
         
         end
         
         Actual = Testing(i,M);
         confusion(Actual,class) = confusion(Actual,class)+1;
        
        
        
    end
    
true =sum(diag(confusion));

Percentage = double(true / 25.0)*100;

if( Percentage > BestPercent)
    BestPercent = Percentage ;
    BestConfusion = confusion ;
    Bestk = k ;
end

end


BestPercent  
Bestk 
    
    




