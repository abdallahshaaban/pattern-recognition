function Result = GlcmEntropy(Mat)

res = zeros(8,8);

for row =1:8
    for col =1:8
        if(Mat(row,col)==0)
            continue ;
        end;
        res(row,col) = double(log2(Mat(row,col)));
    end
end

res = res .* Mat ;
Result = -1*sum (sum(res));

end