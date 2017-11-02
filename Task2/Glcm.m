function Result = Glcm( Image , d)

Img = Contrast( Image , 1, 8);
Img = round(Img);
[H W] = size(Img);
Mat = zeros(8,8);
for i=1:8
    for j=1:8
        for row=1:H
            for col=1:W
                if(Img(row , col) == i && col+d(1,1) <=W && col+d(1,1)>=1 && row+d(1,2)>=1 && row+d(1,2)<=H &&Img(row+d(1,2),col+d(1,1)) == j)       
                  Mat(i,j)= Mat(i,j)+1; 
                end
            end
        end
   end
end
Mat = Mat + Mat.' ;
Sum = sum( sum(Mat));
Result = Mat / Sum ;

end