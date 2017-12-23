function Result = Glcm( Img , d)

[H W ] = size(Img);
Mat = zeros(6,6);

for row=1:H
    for col=1:W
        if( col+d(1,1) <=W && col+d(1,1)>=1 && row+d(1,2)>=1 && row+d(1,2)<=H)       
        nxt = Img(row+d(1,2),col+d(1,1))+1;
        cur = Img(row,col)+1;
        if(nxt >=1 && cur >=1 && nxt <= 6 && cur <= 6  )
          Mat(cur,nxt)= Mat(cur,nxt)+1; 
        end
        end
    end
end

Mat = Mat + Mat.' ;
Sum = sum( sum(Mat));
Result = Mat / Sum ;

end