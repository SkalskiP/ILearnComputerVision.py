% Piotr Skalski
% Hough transformation

clc;
clearvars;
close all;

% Creating a test image 
image = zeros(11);
image(3, 7) = 1;

[H, theta, rho] = hough(image, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

% Display first test image
figure(1);
subplot(1,2,1);
imshow(image); 
axis on;
title('Test image with one white pixel');
subplot(1,2,2);
imshow(H, []); 
axis on;
title('Test image hough space');

% Updating a test image 
image(9, 8) = 1;

[H, theta, rho] = hough(image, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

% Display second test image
figure(2);
subplot(1,2,1);
imshow(image);
axis on;
title('Test image with two white pixels');
subplot(1,2,2);
imshow(H, []);
axis on;
title('Test image hough space');

% Updating a test image
image(3, 2) = 1;
image(10, 1) = 1;

[H, theta, rho] = hough(image, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

% Theta and ro values read from the chart
rho = rho(162);
theta = theta(198);

x = 0:0.1:10;
% thetar = theta * 2*pi/180;
y = ((rho-x*cosd(theta))/sind(theta));

% Display third test image
figure;
imshow(image);
hold on;
plot(x+1, y+1);