% Piotr Skalski
% Pattern search with FFT

close all;
clearvars;
clc;

%% Loading and displaying an image 
I = imread('../data/literki.bmp');
pattern = imread('../data/wzorA.bmp');

figure; 
imshow(I);
title('Original image');

figure; 
imshow(pattern);
title('Pattern');

I_FFT = fft2(I);
pattern_FFT = fft2(rot90(pattern, 2), 256, 256);
prod_FFT = I_FFT .* pattern_FFT;
prod = ifft2(prod_FFT);

se = strel('disk', 3);
I_out = imtophat(prod, se);

figure; 
imshow(I_out, []);
title('Output image');