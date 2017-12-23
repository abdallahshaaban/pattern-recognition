function res = LRLGE( Mat )

[H W] = size(Mat);
Mat = double(Mat);
nr = 0;
nr=double(nr);

for row = 1:H
    for col = 1:W
       nr = nr + Mat(row,col); 
    end
end

sum = 0;
sum= double(sum);
for i = 1:H
    for j = 1:W
        v = double( (Mat(i,j)*j*j)/(i*i));
        sum = sum + v ;
    end
end

x=double(nr);
res = (sum/x);

end