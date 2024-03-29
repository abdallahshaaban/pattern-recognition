function result = GenerateLbelImagesForTestImage(path,Ft,Cls)

    I = imread(path);
  	[N M] = size(path);
	path(1,M-2)='p';
	path(1,M-1)='n';
	path(1,M)='g';
  	Im = imread(path);
 
    [Labels no_objects] = Edgebased(Im);
    Regions = regionprops(Labels,'all');
    [N M] = size(I);
    [h w] = size(Regions);
    

    cat=0;
  
   
    for j = 1 : h
    	if(Regions(j).Area<20  )
            continue;
        end
        
        
     
     Img = imcrop(I, Regions(j).BoundingBox);
     testing = feature_extraction(Img,Ft);
     
    
     
     if(Cls == 1 )
       cat = M_knn_TestImage( testing ,Ft );
     end
     
     if(Cls == 2 )
       cat = R_NN_TestImage( testing ,Ft );
     end
     
     if(Cls == 3 )
       cat = SVM_TestImage( testing ,Ft );
     end
     
    minx = Regions(j).BoundingBox(1);
    miny= Regions(j).BoundingBox(2);
    width = Regions(j).BoundingBox(3);
    height= Regions(j).BoundingBox(4);
    
    minx =round(minx);
    miny=round(miny);
    
     if(cat==1)
         rectangle('Position',Regions(j).BoundingBox,'edgecolor','r','linewidth',2);         
     end
     if(cat==2)
         rectangle('Position',Regions(j).BoundingBox,'edgecolor','g','linewidth',2); 
     end
     if(cat==3)
         rectangle('Position',Regions(j).BoundingBox,'edgecolor','b','linewidth',2); 
     end
     if(cat==4)
         rectangle('Position',Regions(j).BoundingBox,'edgecolor','k','linewidth',2); 
     end
     if(cat==5)
         rectangle('Position',Regions(j).BoundingBox,'edgecolor','y','linewidth',2); 
     end
     
     
     

    end
    
  
end






