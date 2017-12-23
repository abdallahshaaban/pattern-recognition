function [Labels no_objects] = Edgebased(image)

%subplot(2,3,1); imshow(image); title('Original Image');

%2) Convert loaded image to grayscale image
grayimage = rgb2gray(image);
%subplot(2,3,2); imshow(grayimage); title('Grayscale Image');

%3) Edge Detection
BW = edge(grayimage,'canny');
%subplot(2,3,3); imshow(BW); title('Edges');

%4) Dilate Image
BW = imdilate(BW,ones(5,5));
%subplot(2,3,4); imshow(BW); title('After Dilation');

BW = ~BW;
%subplot(2,3,5); imshow(BW); title('After Negation');

[Labels no_objects] = bwlabel(BW); %Integer labels starting from 0

 %Regions = regionprops(Labels,'all');
 %[h w] = size(Regions);
 
 %for i=1:h
    %Rect = rectangle('Position',Regions(i).BoundingBox,'edgecolor','g','linewidth',2);
    %Img = imcrop(I, Regions(i).BoundingBox);
    %imwrite(Img , 'i.
 %end

end

