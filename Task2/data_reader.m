function result = data_reader(Path)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% Read Dataset
input_directory = Path; %e.g. 'D:\faces'
filenames = dir(fullfile(input_directory, '*.jpg'));

num_images = length(filenames); %number of images found in selected folder
image_dims = [50, 50]; %set the desired dimensions of each image

%Initialize a Dataset to save all detected faces after preprocessing the images 
images = zeros(prod(image_dims), num_images);

%Loop on all images to crop faces
    ResPath = fullfile('C:\Users\Lenovo-PC\Desktop\pattern-recognition\Task2\Features\','Features.txt');
    file = fopen(ResPath,'w');
    fprintf(file,'Name\t\t\t\t\tMean\t\t\tVariance\t\t\tStandard Deviation\t\t\tSmoothness\t\t\tSkewness(Third Moment)\t\t\tFourth Moment(Kurtosis)\t\t\tUniformity\t\t\t\t\t\tEntropy\t\t\t\t\t\tGLCM Contrast\t\t\t\t\t\tGLCM Entropy\t\t\t\t\tGLCM Energy\t\t\t\tGLCM Homogeneity\n\n\n');
for i = 1:num_images
    %Build File Name 
    filename = fullfile(input_directory, filenames(i).name);
   
    %Read Colored Image of 'filename'
    image = imread(filename);
    Features = feature_extraction( image );
    fprintf(file,filenames(i).name);
    fprintf(file,'\t\t\t');
    mean = strcat(num2str(Features(1,1)),'\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,2)),'\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,3)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,4)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,5)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,6)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,7)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,8)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,9)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,10)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,11)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    mean = strcat(num2str(Features(1,12)),'\t\t\t\t\t\t');
    fprintf(file,mean);
    fprintf(file,'\n\n\n');
end
fclose(file);
result = 0;
end

