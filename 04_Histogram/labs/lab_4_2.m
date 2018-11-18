% Piotr Skalski
% Histogram Matching

clc;
clearvars;
close all;

% Settings
data_dir_path = './../data';

%% Loading files
load histogramZadany;
phobos_img = imread(fullfile(data_dir_path, 'phobos.bmp'));

%% Display plot

figure();

subplot(2, 3, 1);
imshow(phobos_img); 
title('Orignal');

subplot(2, 3, 2);
imshow(histeq(phobos_img)); 
title('Histeq');

subplot(2, 3, 3);
imshow(imadjust(phobos_img)); 
title('Adjust');

subplot(2, 3 ,4);
imshow(adapthisteq(phobos_img)); 
title('CLAHE');

subplot(2, 3, 5);
imshow(histeq(phobos_img, histogramZadany)); 
title('Given histogram');
