function Result = GlcmContrast( Mat)

res = zeros(8,8);
for row =1:8
    for col =1:8
        res(row,col) = (row-col)*(row-col);
    end
end
  
 Result = res .* Mat;   
 Result = sum(sum(Result));

end