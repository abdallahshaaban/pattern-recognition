function Result = GlcmHomogeneity( Mat)

res = zeros(6,6);
for row =1:6
    for col =1:6
        res(row,col) = 1/double(1+abs((row-col)));
    end
end
  
 Result = res .* Mat;   
 Result = sum(sum(Result));

end