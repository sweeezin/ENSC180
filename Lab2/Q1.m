% ENSC180 Lab 2-Q1:
% Fiona Jin, 301612323, fja20@sfu.ca 1/23/25
clear all
close all

image = imread('circles.png');

[rows,cols] = size(image);

black = numel(find(image == 0));
gray = numel(find(image == 128));
white = numel(find(image == 255));

black;
gray;
white;

%2

newimg = 128 * ones(size(image));

indexw = (image == 255);
newimg(indexw) = 255;


indexb = (image == 0);
newimg(indexb) = 0;

figure;
imshow(newimg, [0, 255]);

newarray = 128 * ones(size(image), 'uint8');
newarray(indexw) = 255;

figure;
tiledlayout('flow');

nexttile;
imshow(image);

nexttile;
imshow(newarray);