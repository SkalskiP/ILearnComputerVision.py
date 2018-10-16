close all;
Img = imread('parrot.bmp');
scale = 2;

Img_A = imresize(Img, scale, "nearest");
figre
imshow(Img_A)

Img_B = imresize(Img, scale, "bilinear");
figre
imshow(Img_B)

Img_C = imresize(Img, scale, "bicubic");
figre
imshow(Img_C)