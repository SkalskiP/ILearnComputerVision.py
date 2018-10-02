imfinfo('lena.bmp')
imfinfo('lena.jpg')

image_bmp = imread('lena.bmp');
image_jpg = imread('lena.jpg');

figure(1)
imshow(image_bmp)
figure(2)
imshow(image_jpg)

image_bmp_gray = rgb2gray(image_bmp);

figure(3)
imshow(image_bmp_gray)

imwrite(image_bmp_gray, 'lena_gray.bmp')

figure(4)
colormap gray;
mesh(image_bmp_gray)

figure(5)
plot(image_bmp_gray(10,:));

figure(6)
plot(image_bmp_gray(:,5));