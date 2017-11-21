function result = pca(image)
	image = resize (image ,[50  50]);
	image = GetGrayLevelImage(image);
	[H W ]=size(image);

	mx=max(max(image));
	mn = min(min(image));
	for row=1:H
    	for col=1:W
    		image(row col ) = (image(row col )-mn)/(mx-mn);

    	end 
    end 

	sum = 0;
	for row=1:H
    	for col=1:W
    		sum += image(row col );

    	end 
    end 
    n=H*W;
    mean = sum /n;

    for row=1:H
    	for col=1:W
    		image(row col ) = image(row col )-mean;

    	end 
    end 
   %{
   rows = zeros (H,1);
  
   columns = ones (W , 1);
    
   
    for row=1:H
    	for col=1:W
    		rows(row 1 ) += image(row col);

    	end 
    end 

    for col=1:W
    	for row=1:H
    		columns(col 1 ) += image(row col);

    	end 
    end 
 %}
    cov = ones (H,W);	
     for row=1:H
    	for col=1:W
    		cov (row col) = transpose(image (row :))* image(col : )/(n-1);

    	end 
    end 
 

    [V,D] = eig(cov)
