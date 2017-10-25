function result = data_reader(path)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% Read Dataset
input_directory = path; %e.g. 'D:\faces'
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
    
    %%%%
    % Apply Preprocessing and Segmentation on all images to detect Faces.
    % You can apply any preprocessing task(s) to enhance quality of images.
    % After that try to detect and crop faces only from the whole images
    % using any proper segmentation method.
    %%%%
    segmented_img = Segmentation(image);
    cropped_img = crop(image, segmented_img);
    
    %Dataset: save detected face 'image' in dataset 'images'
    %images(:, i) = image(:); %Column-wise
    
    % save detected face 'image' as .jpg file on a separated folder.
    result_folder = fullfile('C:\Users\UPDATE\Documents\VIP\FCIS\Pattern Recognition\Task1\pattern-recognition-master\Task1\cropped_images', filenames(i).name);
    imwrite(cropped_img, result_folder);
end
result = 0;
end

