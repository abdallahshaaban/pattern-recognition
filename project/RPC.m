function res = RPC( Mat ,M,N )

[H W] = size(Mat);
Mat = double(Mat);
nr =0;
nr=double(nr);
for row = 1:H
    for col = 1:W
       nr = nr + Mat(row,col); 
    end
end

x=double(M*N);
res = double(nr/x);

end