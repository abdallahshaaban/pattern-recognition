function Result = GlcmContrast( Mat)

res = zeros(6,6);
for row =1:6
    for col =1:6
        res(row,col) = (row-col)*(row-col);
    end
end
  
 Result = res .* Mat;   
 Result = sum(sum(Result));

end