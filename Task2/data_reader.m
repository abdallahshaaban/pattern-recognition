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
for i = 1:num_images
    %Build File Name 
    filename = fullfile(input_directory, filenames(i).name);
   
    %Read Colored Image of 'filename'
    image = imread(filename);
    Features = feature_extraction( image );
    [H W] = size(filenames(i).name);
    FileName = [filenames(i).name(:,1:W-3)  't' 'x' 't'];
    ResPath = fullfile('C:\Users\Lenovo-PC\Desktop\pattern-recognition\Task2\Features\',FileName);
    file = fopen(ResPath,'w');
    mean = strcat('Mean= ',num2str(Features(1,1)),'\n');
    fprintf(file,mean);
    mean = strcat('Variance= ',num2str(Features(1,2)),'\n');
    fprintf(file,mean);
    mean = strcat('Standard Deviation= ',num2str(Features(1,3)),'\n');
    fprintf(file,mean);
    mean = strcat('Smoothness= ',num2str(Features(1,4)),'\n');
    fprintf(file,mean);
    mean = strcat('Skewness(Third Moment)= ',num2str(Features(1,5)),'\n');
    fprintf(file,mean);
    mean = strcat('Fourth Moment(Kurtosis)= ',num2str(Features(1,6)),'\n');
    fprintf(file,mean);
    mean = strcat('Uniformity= ',num2str(Features(1,7)),'\n');
    fprintf(file,mean);
    mean = strcat('Entropy= ',num2str(Features(1,8)),'\n');
    fprintf(file,mean);
    mean = strcat('GLCM Contrast= ',num2str(Features(1,9)),'\n');
    fprintf(file,mean);
    mean = strcat('GLCM Entropy= ',num2str(Features(1,10)),'\n');
    fprintf(file,mean);
    mean = strcat('GLCM Energy= ',num2str(Features(1,11)),'\n');
    fprintf(file,mean);
    mean = strcat('GLCM Homogeneity= ',num2str(Features(1,12)),'\n');
    fprintf(file,mean);
    fclose(file);
end
result = 0;
end

