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

Kval = 25 ;

for k = 1:Kval
    
confusion = zeros(5,5);

    for i = 1 : N
        
        Distances = zeros(25,2);
        rep = zeros(1,5);
        rep = double(rep);
        class = 1000;
        
        
        for j = 1 : N
            
            distance = sqrt(sum( (Testing (i ,1:M-1 ) - Training (j,1:M-1)) .* (Testing (i ,1:M-1) - Training (j,1:M-1))));
            Distances(j,1)= distance;
            Distances(j,2)= Training(j,M);
            
        end
        
        
        Distances = sortrows(Distances);
        rep = zeros(1,5);
        
        
        dk = Distances(k,1);
        d = Distances(1,1);
        Mx = -1 ;
        Cls = -1 ;
        
        for j=1:k
            
         class = Distances(j,2) ;
         disj = Distances(j,1) ;
         if(k==1)
         W = 1 ;
         else
         W =  double(dk - disj) / double(dk - d) ;
         end
       
         rep(1,class) = rep(1,class) + W ;
         
         if(rep(1,class) > Mx)
              Mx=rep(1,class);
              Cls = class ;
          end
         
        end
         
         Actual = Testing(i,M);
         confusion(Actual,Cls) = confusion(Actual,Cls)+1;
        
        
        
    end
    
true =sum(diag(confusion));

Percentage = double(true / 25.0)*100;

if( Percentage > BestPercent)
    BestPercent = Percentage ;
    BestConfusion = confusion ;
    Bestk = k ;
    
    BestPercent  
    Bestk 
end

end


BestPercent  
Bestk 
    
    




