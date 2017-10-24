function result =Segmentation(img)

img = imresize(img,[100 100]);

imageYCbCr = rgb2ycbcr(img);
imageY = imageYCbCr(:,:,1);
cb = imageYCbCr(:,:,2);
cr = imageYCbCr(:,:,3);

hsv = rgb2hsv(img);
hu = hsv(:, :, 1); % Hue image.
s = hsv(:, :, 2); % Saturation image.
v = hsv(:, :, 3); % Value (intensity) image.
[H W L] = size(img) ;
result=zeros(H,W );
for	i=1:H
	for j=1:W
		

		if(140<=cr(i,j)&&cr(i,j)<=185)
			result(i,j)=1;
		end
	end
end
 imshow(result);
 %Y=edge(result,'sobel');
% result=imdilate(Y,ones(5,5));
%Bw_filled=imfill(Y,'holes');
%result=bwboundaries(Bw_filled);
 
imshow(result);

end