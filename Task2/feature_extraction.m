function Features = feature_extraction( Image )
GImage = rgb2gray(Image);
[H,W] = size(GImage);
n = H*W;
RGImage = double(reshape(GImage,1,n));
%Feature 1
mean = Mean(RGImage);
%Feature 2
variance = Variance (RGImage , mean);
%Feature 3
standardDeviation = StandardDeviation(variance);
%Feature 4
R = Smoothness(variance);
%Feature 5
skewness = Skewness( RGImage , mean , standardDeviation );
%Feature 6
kurtosis = Kurtosis( RGImage , mean , standardDeviation );
%Histogram Normalization
[y, x] = hist(RGImage);
y=y/n;
%Feature 7
uniformity=Uniformity( x , y );
%Feature 8
entropy=Entropy( x , y );
%Glcm Calculations
d=[2 0];
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

