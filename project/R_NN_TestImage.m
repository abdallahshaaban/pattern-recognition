function Category = R_NN_TestImage( Testing,Ft)

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
for i = 1:M-1
    
    Mx=max(vec(:,i));
    Mn= min(vec(:,i));
    Training(:,i) = (Training(:,i)-Mean(vec(:,i))) / (Mx-Mn) ;
    Testing (:,i) = (Testing (:,i)-Mean(vec(:,i))) / (Mx-Mn) ;
 
end

Distances = zeros(25,2);
class = 1000 ;
% best k
i=1;
k=4;



        for j = 1 : N
            
            distance = sqrt(sum( (Testing (i ,1:M-1 ) - Training (j,1:M-1)) .* (Testing (i ,1:M-1) - Training (j,1:M-1))));
            distance = distance * 10 ;
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
         
         Category = class ;

end