function Percentage = M_knn(Ft)

Testing = csvread('Testing.csv');
Training = csvread('Training.csv');

if(Ft==1)
Training(:,5:15)=[];
Testing(:,5:15)=[];
end

if(Ft==2)
Training =  Training(:,5:16);
Testing  =  Testing(:,5:16);
end

[N M] = size(Training) ;

%normalization
vec =  Training(:,1:M-1) ;
vec2 = Testing(:,1:M-1) ;
vec =  [vec ; vec2 ] ;
for i = 1:M-1
    
    Mx=max(vec(:,i));
    Mn= min(vec(:,i));
    Training(:,i) = (Training(:,i)-Mean(vec(:,i))) / (Mx-Mn) ;
    Testing (:,i) = (Testing (:,i)-Mean(vec(:,i))) / (Mx-Mn) ;
 
end



Bestk = - 1 ;
BestConfusion = -1;
BestPercent = -1.0 ;

Kval = 25 ;

K = zeros(1,Kval);
Errors = zeros(1,Kval);

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

K(1,k) = k;
Errors(1,k) = 100 - Percentage ;

if( Percentage > BestPercent)
    BestPercent = Percentage ;
    BestConfusion = confusion ;
    Bestk = k ;
 
end

end

 figure 
plot(K,Errors);
Percentage = BestPercent  ;
BestPercent
Bestk

end
    




