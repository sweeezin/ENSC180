% ENSC180 Lab 1-Q1:
% Using vector operations to speed up the code.
% Fiona Jin, 301612323, fja20@sfu.ca 1/16/25
clear all;
close all;

function imgstat = getimgstat(img)
    
    imgstat = zeros(3, 3); 

    for i = 1:3
        i_data = img(:, :, i); 
        imgstat(1, i) = max(i_data(:));  % Maximum value
        imgstat(2, i) = min(i_data(:));  % Minimum value
        imgstat(3, i) = mean(i_data(:)); % Mean value
    end
end

% Load the first image
img1 = imread('office1.jpg');
figure;
imshow(img1);
disp('Size of img1:');
disp(size(img1));
imgstat1 = getimgstat(img1);
disp('Image statistics for img1:');
disp(imgstat1);

% Load the second image
img2 = imread('office6.jpg');
figure;
imshow(img2);
disp('Size of img2:');
disp(size(img2));
imgstat2 = getimgstat(img2);
disp('Image statistics for img2:');
disp(imgstat2);

img3 = (img1+img2)/2;
img3 = uint8(img3);
imgstat3 = getimgstat(img3);
disp('Image statistics for img3 (averaged image):');
disp(imgstat3);

figure;
imshow(img3);
