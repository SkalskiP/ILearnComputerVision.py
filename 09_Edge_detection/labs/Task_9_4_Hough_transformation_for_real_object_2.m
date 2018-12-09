% Piotr Skalski
% Hough transformation for real object

clc;
clearvars;
close all;

% Loading image
image = imread('../data/lab112.png');

figure; imshow(image);
T = 45;
image(image < T) = 0;
image(image > T) = 255;
image(:, 500:640) = 255;
% figure; imshow(im);
BW = edge(image, 'canny');
figure; imshow(BW);

[H, theta, rho] = hough(BW, 'RhoResolution', 1, 'ThetaResolution', 1);
figure; imshow(H, []);
peaks = houghpeaks(H, 8);
lines = houghlines(BW, theta, rho, peaks);

figure; imshow(image);
hold on;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');
end
