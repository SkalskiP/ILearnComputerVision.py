% Piotr Skalski
% Removal of periodic disturbance

close all;
clearvars;
clc;

%% Loading and displaying an image 
I = imread('../data/lunar.bmp');
th = 26;

subplot(2,2,1);
imshow(I);
title('Original image');

transformed = fft2(I);
transformed = fftshift(transformed);
subplot(2,2,2);
A = abs(transformed);
A = log10(A+1);
imshow(A, []);
title('Amplitude');

subplot(2,2,3);
faza = angle(transformed.*(A > 0.0001));
imshow(faza);
title('Phase');

imgfft2 = fft2(I);
fft2abs = log10(abs(imgfft2)+1);
imgfft2(fft2abs > th) = 0;

subplot(2,2,4);
I_back = ifft2(ifftshift(imgfft2));
imshow(I_back, []);
title('Removed interference');

