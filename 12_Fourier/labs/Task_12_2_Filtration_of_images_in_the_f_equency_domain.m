% Piotr Skalski
% Filtration of images in the frequency domain

close all;
clearvars;
clc;

%% Loading and displaying an image 
I = imread('../data_1/lena.bmp');
figure; 
imshow(I);
title('Original image')

