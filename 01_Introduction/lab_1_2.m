image_bmp_gray = imread('lena_gray.bmp');
[X, map] = gray2ind(image_bmp_gray, 256);

figure(1)
imshow(X, map)

map_2 = colormap('summer');
figure(2)
imshow(X, map_2)
