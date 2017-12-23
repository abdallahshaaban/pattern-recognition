function result = Runlength(Image)

[ H W ] = size(Image);

vis = uint8(zeros(H,W));
A = uint8(zeros(6,500)) ;

for k=0:5
 for r=1:H
    for c=1:W
        
        if(vis(r,c)==1)
            continue;
        end
        
        i=r;
        j=c;
        cnt=1;
        
        while(j+1<=W && i<=H && Image(r,c)==k && Image(i,j)==Image(i,j+1))
            vis(i,j+1)=1;
            cnt=cnt+1;
            j=j+1;
        end
        
        if(Image(r,c)== k)
        A(k+1,cnt)= 1+A(k+1,cnt) ;
        end
        
        
    end
 end
end
    

vis = uint8(zeros(H,W));
B = uint8(zeros(6,500)) ;

for k=0:5
 for r=1:H
    for c=1:W
        
        if(vis(r,c)==1)
            continue;
        end
        
        i=r;
        j=c;
        cnt=1;
        
        while(j<=W && i+1<=H && Image(r,c)==k && Image(i,j)==Image(i+1,j))
            vis(i+1,j)=1;
            cnt=cnt+1;
            i=i+1;
        end
        
        if(Image(r,c)== k)
        B(k+1,cnt)= 1+B(k+1,cnt) ;
        end
        
        
    end
 end
end



vis = uint8(zeros(H,W));
C = uint8(zeros(6,500)) ;

for k=0:5
 for r=1:H
    for c=1:W
        
        if(vis(r,c)==1)
            continue;
        end
        
        i=r;
        j=c;
        cnt=1;
        
        while(j+1<=W && i+1<=H && Image(r,c)==k && Image(i,j)==Image(i+1,j+1))
            vis(i+1,j+1)=1;
            cnt=cnt+1;
            i=i+1;
            j=j+1;
        end
        
        if(Image(r,c)== k)
        C(k+1,cnt)= 1+C(k+1,cnt) ;
        end
        
        
    end
 end
end

vis = uint8(zeros(H,W));
D = uint8(zeros(6,500)) ;

for k=0:5
 for r=1:H
    for c=1:W
        
        if(vis(r,c)==1)
            continue;
        end
        
        i=r;
        j=c;
        cnt=1;
        
        while(j-1>=1 && i+1<=H && Image(r,c)==k && Image(i,j)==Image(i+1,j-1))
            vis(i+1,j-1)=1;
            cnt=cnt+1;
            i=i+1;
            j=j-1;
        end
        
        if(Image(r,c)== k)
        D(k+1,cnt)= 1+D(k+1,cnt) ;
        end
        
        
    end
 end
end

result = (A+B+C+D)/4 ;
end