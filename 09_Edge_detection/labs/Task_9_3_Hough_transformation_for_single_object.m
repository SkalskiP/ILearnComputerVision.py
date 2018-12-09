% Piotr Skalski
% Hough transformation for single object

clc;
clearvars;
close all;

% Loading image
image = imread('../data/kwadraty.png');

% Display original image
figure(1); 
imshow(image);
axis on;
title('Original image');

% Finds edges by looking for local maxima of the gradient of image
image_canny = edge(image, 'sobel');
figure(2);
imshow(image_canny);
axis on;
title('Image after Canny');

% Searching for peaks
[H, theta, rho] = hough(image_canny, 'RhoResolution', 1, 'ThetaResolution', 1);
peaks = houghpeaks(H, 8);

% Display hough space with peaks
figure(3);
imshow(H, []);
axis on;
hold on;

for k = 1:length(peaks)
    plot(peaks(k, 2), peaks(k, 1), 'ro', 'MarkerSize', 10);
end

% Searching for lines
lines = houghlines(image_canny, theta, rho, peaks);

% Display images with edges
figure(4); 
imshow(image);
axis on;
hold on;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');
end