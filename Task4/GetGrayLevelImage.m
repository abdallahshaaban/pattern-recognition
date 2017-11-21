function Result = GetGrayLevelImage( Image )
%Average
% Result = (Image(:,:,1)+Image(:,:,2)+Image(:,:,3))/3;
%luminosity
Result = (0.21*Image(:,:,1)+0.72*Image(:,:,2)+0.07*Image(:,:,3))/3;
end

