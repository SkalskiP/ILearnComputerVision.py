close all;
Img = imread('parrot.bmp');
scale = 2;

Img_A = imresize(Img, scale, "nearest");
figure
imshow(Img_A)

Img_B = imresize(Img, scale, "bilinear");
figure
imshow(Img_B)

Img_C = imresize(Img, scale, "bicubic");
figure
imshow(Img_C)