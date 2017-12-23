function Features = feature_extraction( Image )

[H W L] = size(Image);
Img = GetGrayLevelImage(Image);
Image = Contrast( Img , 0 , 5 ) ;

%%% Glcm Features %%%%
glcm = ( Glcm( Image , [0 1]) + Glcm( Image , [1 0]) + Glcm( Image , [1 1]) ) / 3 ;
Homogeneity = GlcmHomogeneity( glcm ) ;
entropy = GlcmEntropy(glcm) ;
energy = GlcmEnergy( glcm ) ;
contrast = GlcmContrast( glcm ) ;

%%% Run length Features %%%%


run = Runlength(Image) ;
srlge = SRLGE( run ) ;
sre = SRE( run ) ;
lre = LRE( run ) ;
hgre = HGRE( run ) ;
lgre =  LGRE( run) ;
srhge = SRHGE( run ) ;
lrlge = LRLGE (run) ;
lrhge = LRHGE (run) ;
rlnu = RLNU( run ) ;
glnu = GLNU( run ) ;
rpc = RPC (run,H,W) ; 

res = [ double(Homogeneity)  double(entropy) double(energy) double(contrast)  double(sre) double(lre) double(hgre) double(lgre) double(srlge) double(srhge)  double(lrlge)  double(lrhge)  double(rlnu)  double(glnu)  double(rpc) ];
Features  = double(res) ;
end

