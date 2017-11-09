function Result = GlcmHomogeneity( Mat)

res = zeros(8,8);
for row =1:8
    for col =1:8
        res(row,col) = 1/double(1+abs((row-col)));
    end
end
  
 Result = res .* Mat;   
 Result = sum(sum(Result));

end