% Piotr Skalski
% Histogram for Color Images

clc;
clearvars;
close all;

% Settings
data_dir_path = './../data';

%% Loading files

lena_RGB = imread(fullfile(data_dir_path, 'lenaRGB.bmp'));
lena_HSV = rgb2hsv(lena_RGB);

%% Display plot

figure();
subplot(2,1,1)
imshow(lena_RGB);
title("RGB")
subplot(2,1,2);
lena_HSV = rgb2hsv(lena_RGB);
lena_HSV(:,:,3) = histeq(lena_HSV(:,:,3));
% title("HSV")

%% RGB operations

lenaR = lena_RGB(:, :, 1);
lenaG = lena_RGB(:, :, 2);
lenaB = lena_RGB(:, :, 3);
lenaH = lena_HSV(:, :, 1);
lenaS = lena_HSV(:, :, 2);
lenaV = lena_HSV(:, :, 3);

figure(2);
subplot(2, 3, 1);
imshow(lenaR);

subplot(2, 3, 2);
imshow(lenaR);

subplot(2, 3, 3);
imshow(lenaR);

subplot(2, 3, 4);
imshow(lenaH);

subplot(2, 3, 5);
imshow(lenaS);

subplot(2, 3, 6);
imshow(lenaV);


imageEQ(:, :, 1) = lenaR;
imageEQ(:, :, 2) = lenaG;
imageEQ(:, :, 3) = lenaB;

figure(3)
imshow(histeq(imageEQ));
title('After histeq');






