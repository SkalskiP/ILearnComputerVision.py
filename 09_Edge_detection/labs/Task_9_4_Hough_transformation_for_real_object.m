% Piotr Skalski
% Hough transformation for real object

clc;
clearvars;
close all;

% Loading image
image = imread('../data/lab112.png');
figure;
subplot(1, 2, 1);
imshow(image);
subplot(1, 2, 2);
imhist(image)

marker = image(:,:);

% Reconstruction
T = 100;
marker(marker < T) = 1;
marker(marker > T) = 0;

image_reconstructed = imreconstruct(marker, image);


figure;
subplot(1, 2, 1);
imshow(image_reconstructed);
subplot(1, 2, 2);
imhist(image_reconstructed)

% Binarisation
T = 90;
image_reconstructed(image_reconstructed < T) = 0;
image_reconstructed(image_reconstructed > T) = 255;

figure; 
imshow(image_reconstructed);

% Dilatate
square = strel('square', 10);
imdilated = imerode(image_reconstructed ,square);

figure; 
imshow(imdilated);

% Erode
square = strel('square', 15);
imeroded = imdilate(imdilated ,square);

figure; 
imshow(imeroded);

% Dilatate
square = strel('square', 5);
imdilated = imerode(imeroded ,square);

figure; 
imshow(imdilated);

BW = edge(imdilated, 'canny');
figure; imshow(BW);

[H, theta, rho] = hough(BW, 'RhoResolution', 1, 'ThetaResolution', 1);
% figure; imshow(H, []);
% peaks = houghpeaks(H, 8);
% lines = houghlines(BW, theta, rho, peaks);


figure; 
imshow(imdilated);
hold on;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');
end