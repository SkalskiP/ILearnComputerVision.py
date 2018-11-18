% Skalski Piotr
% implementation of additional functions that could not 
% be implemented in Python
clc;
close all;
clearvars;

%% Load file
image = imread('coins.png');

%% cluster_kitler and entropy_yen

threshold_kitler = clusterKittler(image)/255;
image_kitler = im2bw(image, threshold_kitler);

figure()
subplot(1, 2, 1);
imshow(image_kitler)
title('Photo')
subplot(1, 2, 2);
imhist(image_kitler);
title('Histogram')

threshold_yen = entropyYen(image)/255;
image_yen = im2bw(image, threshold_yen);

figure()
subplot(1, 2, 1);
imshow(image_yen)
title('Photo')
subplot(1, 2, 2);
imhist(image_yen);
title('Histogram')

