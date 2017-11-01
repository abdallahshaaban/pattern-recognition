function Features = feature_extraction( Image )
GImage = GetGrayLevelImage(Image);
%Feature 1
mean = Mean(GImage);
%Feature 2
variance = Variance (GImage , mean);
%Feature 3
standardDeviation = StandardDeviation(variance);
%Feature 4
R = Smoothness(variance);
%Feature 5
skewness = Skewness( GImage , mean , standardDeviation );
%Feature 6
kurtosis = Kurtosis( GImage , mean , standardDeviation );
%Histogram Normalization
[y, x] = imhist(GImage);
[H W] = size(GImage);
y=y/(H*W);
%Feature 7
uniformity=Uniformity( x , y );
%Feature 8
entropy=Entropy( x , y );
%Glcm Calculations
d=[0 2];
GLCMMatrix = Glcm( GImage , d);
%Feature 9
GLCMcontrast = GlcmContrast( GLCMMatrix );
%Feature 10
GLCMentropy = GlcmEntropy(GLCMMatrix);
%Feature 11
GLCMenergy = GlcmEnergy( GLCMMatrix );
%Feature 12
GLCMhomogeneity = GlcmHomogeneity( GLCMMatrix);
Features = [mean variance standardDeviation R skewness kurtosis uniformity entropy GLCMcontrast GLCMentropy GLCMenergy GLCMhomogeneity];
end

