function res = LRE( Mat )

[H W] = size(Mat);
Mat = double(Mat);
nr = 0;
nr=double(nr);

for row = 1:H
    for col = 1:W
       nr = nr + Mat(row,col); 
    end
end
x=double(nr);

sum = 0;
sum = double(sum);
for i = 1:H
    for j = 1:W
       
        sum = sum + ( Mat(i,j)*(j*j));
    end
end

res = (sum/x);

end