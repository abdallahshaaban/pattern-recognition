function Category = M_knn_TestImage( Testing,Ft)

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

% best K 
k = 1 ;
i = 1 ;

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
            
      Category = Cls ;
      

end

