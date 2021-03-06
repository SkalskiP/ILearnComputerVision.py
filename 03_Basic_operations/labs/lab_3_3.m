% Piotr Skalski
% Logical Operations

clearvars;
clc;
close all;

Img_square = imread('kwadrat.bmp');
Img_circle = imread('kolo.bmp');


Img_circle = boolean(Img_circle);
Img_square = boolean(Img_square);

figure(1)
imshow(not(Img_circle));
title('NOT');

figure(2)
imshow(and(Img_circle, Img_square));
title('AND');

figure(3)
imshow(or(Img_circle, Img_square));
title('OR');

figure(4)
imshow(xor(Img_circle, Img_square));
title('XOR');