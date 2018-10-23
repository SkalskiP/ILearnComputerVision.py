close all
clearvars

Img_lena = imread('lena.bmp');
Img_lena_2 = imresize(Img_lena, 0.5); 
Img_lena_3 = imresize(Img_lena_2, 0.5);
Img_lena4 = imresize(Img_lena_3, 0.5);
 
figure()
% 512x512
imshow(Img_lena)

figure()
%256x256
imshow(Img_lena_2,'InitialMagnification', 200)
 
figure()
%128x128
imshow(Img_lena_3,'InitialMagnification', 400)
 
figure()
 %64x64
imshow(Img_lena4,'InitialMagnification', 800)

Img = imread('clock.bmp');
Img = imresize(Img,[128,128]);

I_1 = imadjust(Img,[],[0,31/255]);
I_2 = imadjust(Img,[],[0,15/255]);
I_3 = imadjust(Img,[],[0,7/255]);
I_4 = imadjust(Img,[],[0,3/255]);
I_5 = imadjust(Img,[],[0,1/255]);

subplot(2,3,1)
imshow(Img);

subplot(2,3,2);
imshow(I_1,[])

subplot(2,3,3);
imshow(I_2,[])

subplot(2,3,4);
imshow(I_3,[])

subplot(2,3,5);
imshow(I_4,[])

subplot(2,3,6);
imshow(I_5,[])