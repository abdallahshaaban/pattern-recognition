function result = GenerateLbelImagesForTestImage(path,n)
%Dir = 'D:\Pattern\Testing\'; 
%path= strcat(Dir,'*.png');
%Path= strcat(Dir,'*.jpg');
%srcFiles = dir(path);
%SrcFiles = dir(Path);
%for i = 1 : length(srcFiles)
 %   filename = strcat(Dir,srcFiles(i).name);
    I = imread(path);
  %  Filename = strcat(Dir,SrcFiles(i).name);
  	[N M] = size(path);
	path(1,M-2)='p';
	path(1,M-1)='n';
	path(1,M)='g';
  	Im = imread(path);
    [Labels no_objects] = Edgebased(Im);
    Regions = regionprops(Labels,'all');
    [N M] = size(I);
    [h w] = size(Regions);
    %imshow(Im);

    for j = 1 : h
    	if(Regions(j).Area >((N*M)-1000)||Regions(j).Area<50||j==1)continue;end
    	rectangle('Position',Regions(j).BoundingBox,'edgecolor','g','linewidth',2);

     name = ''; 
     name = strcat(name,num2str(i));
     name = strcat(name,num2str(j));
     name = strcat(name,'.jpg');
     Img = imcrop(Im, Regions(j).BoundingBox);
     feature =feature_extraction(Img,n);

    % imwrite(Img,name);
    % imshow(Img);
  
    end
    
    
end





