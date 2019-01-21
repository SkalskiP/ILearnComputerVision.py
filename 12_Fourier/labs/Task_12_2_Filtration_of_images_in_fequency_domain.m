% Piotr Skalski
% Filtration of images in the frequency domain

close all;
clearvars;
clc;

%% Loading and displaying an image 
I = imread('../data/lena.bmp');

figure
subplot(1,3,1);
imshow(I);
title('Original image');

%% High pass filter
R = 0.1;
image_size = 512;

[f1, f2] = freqspace(image_size, 'meshgrid');
Hd = ones(image_size);
r = sqrt(f1.^2 + f2.^2);
Hd(r > R) = 0;
I_filtred = uint8(double(I) .* Hd);

subplot(1,3,2);
imshow(I_filtred);
title('Circle');

h = fwind1(Hd, hanning(21));
[H f1 f2] = freqz2(h, image_size, image_size);

subplot(1,3,3);
imshow(uint8(double(I) .* H));
title('Hanning window');


%% Gauss filter

figure
subplot(2,2,1);
imshow(I);
title('Original image');

H = fspecial('gaussian', image_size, 20.0);
hImg = mat2gray(H);

fourier = fft2(I);
fourier = fftshift(fourier);
fourier = fourier .* H;

subplot(2,2,2);
movedFour = ifftshift(fourier);
I_filtered = ifft2(movedFour);
imshow(I_filtered, []);
title('After Gauss filtration');

subplot(2,2,3);
A = abs(fourier);
A = log10(A+1);
imshow(A, []);
title('Amplitude');

subplot(2,2,4);
faza = angle(fourier.*(A > 0.0001));
imshow(faza, []);
title('Phase');

