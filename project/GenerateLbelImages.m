
Dir = 'D:\Pattern\Testing\'; 
path= strcat(Dir,'*.png');
Path= strcat(Dir,'*.jpg');
srcFiles = dir(path);
SrcFiles = dir(Path);
for i = 1 : length(srcFiles)
    filename = strcat(Dir,srcFiles(i).name);
    I = imread(filename);
    Filename = strcat(Dir,SrcFiles(i).name);
    Im = imread(Filename);
 
    [Labels no_objects] = Edgebased(I);
    Regions = regionprops(Labels,'all');
    
    [h w] = size(Regions);
    imshow(Im);

    for j = 1 : h
    %rectangle('Position',Regions(j).BoundingBox,'edgecolor','g','linewidth',2);
     name = ''; 
     name = strcat(name,num2str(i));
     name = strcat(name,num2str(j));
     name = strcat(name,'.jpg');
     Img = imcrop(Im, Regions(j).BoundingBox);
    % imwrite(Img,name);
    % imshow(Img);
  
    end
    
    
end





