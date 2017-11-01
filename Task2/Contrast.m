function Result = Contrast( Image , NewMin , NewMax )
[RedOldMin RedOldMax] = ChannelMaxAndMin(Image(:,:,1));
[H W L] = size(Image);
if(L>1)
[GreenOldMin GreenOldMax] = ChannelMaxAndMin(Image(:,:,2));
[BlueOldMin BlueOldMax] = ChannelMaxAndMin(Image(:,:,3));
end
NewRedChannel = ApplyNewRange(Image(:,:,1) , NewMin , NewMax , RedOldMin , RedOldMax);
if(L>1)
NewGreenChannel = ApplyNewRange(Image(:,:,2), NewMin , NewMax , GreenOldMin , GreenOldMax);
NewBlueChannel = ApplyNewRange(Image(:,:,3), NewMin , NewMax , BlueOldMin , BlueOldMax);
end
Result(:,:,1) = NewRedChannel;
if(L>1)
Result(:,:,2) = NewGreenChannel;
Result(:,:,3) = NewBlueChannel;
end
end

