% Piotr Skalski
% Built-in indexation

close all;
clearvars;
clc;

%% Loading and displaying an image 
I = imread('../data_1/l');
figure; 
imshow(im, []);
title('Original image')

figure; 
imshow(bwlabel(im, 4), []);
title('Using the 4-part environment')

figure; 
imshow(bwlabel(im, 8), []);
title('Using the 8-part environment')