function res = GLNU( Mat )

[H W] = size(Mat);
Mat = double(Mat);
nr =0;

for row = 1:H
    for col = 1:W
       nr = nr + Mat(row,col); 
    end
end

sum = 0;
sum=double(sum);

for i = 1:H
    temp =0;
    temp=uint64(temp);
    for j= 1:W
       
        temp = temp + ( Mat(i,j) );
    end
    sum = sum + (temp * temp );
    
end
x=double(nr);
res = double(sum/x);

end