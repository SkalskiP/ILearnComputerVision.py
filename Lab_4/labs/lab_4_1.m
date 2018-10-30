%% Piotr Skalski

clc;
clearvars;
close all;

% Settings
data_dir_path = './../data';

%% Loading files
lena_1 = imread(fullfile(data_dir_path, 'lena1.bmp'));
lena_2 = imread(fullfile(data_dir_path, 'lena2.bmp'));
lena_3 = imread(fullfile(data_dir_path, 'lena3.bmp'));
lena_4 = imread(fullfile(data_dir_path, 'lena4.bmp'));

Img_Hist_1 = imread(fullfile(data_dir_path, 'hist1.bmp'));
Img_Hist_2 = imread(fullfile(data_dir_path, 'hist2.bmp'));
Img_Hist_3 = imread(fullfile(data_dir_path, 'hist3.bmp'));
Img_Hist_4 = imread(fullfile(data_dir_path, 'hist4.bmp'));

%% Take a look at Lena's histograms

figure()
subplot(4, 2, 1);
imshow(lena_1)
title('Photo')
subplot(4, 2, 2);
imhist(lena_1);
title('Histogram')

subplot(4, 2, 3);
imshow(lena_2)
subplot(4, 2, 4);
imhist(lena_2);

subplot(4, 2, 5);
imshow(lena_3)
subplot(4, 2, 6);
imhist(lena_3);

subplot(4, 2, 7);
imshow(lena_4)
subplot(4, 2, 8);
imhist(lena_4);

%% Original photos with histograms

figure();
subplot(2, 1, 1);
imshow(Img_Hist_1)
title('hist1.bmp along with histogram')
subplot(2, 1, 2);
imhist(Img_Hist_1);

%% Adjusted histogram

hist_img_adjusted = imadjust(Img_Hist_1);    

figure();
subplot(2, 1, 1);
imshow(Img_Hist_1)
title('adjusted hist1.bmp along with histogram')
subplot(2, 1, 2);
imhist(hist_img_adjusted);

%% Accumulated histogram

[counts, x] = imhist(Img_Hist_1, 256); 
hist_cumulated = cumsum(counts); % Cumulated histogram

k = max(hist_cumulated) / max(counts);
C2 = hist_cumulated / k;

figure();
subplot(12, 1, 1:4);
imshow(Img_Hist_1);
title('Picture');

subplot(12, 1, 6:8); 
imhist(Img_Hist_1 ,256);
title('Original histogram')

subplot(12, 1, 10:12);
plot(x, counts);
title('Accumulated histogram');

%% LUT conversion

LUT = uint8(255*(C2/max(C2)));
[counts_2, x_2] = imhist(intlut(Img_Hist_1, LUT),256);
hist_cumulated_2 = cumsum(counts_2);
k_2 = max(hist_cumulated_2) / max(counts_2);
C22 = hist_cumulated_2 / k_2; 

figure();
subplot(2,2,1);
imshow(intlut(Img_Hist_1, LUT));
title('LUT');

subplot(2,2,2);
histeq(Img_Hist_1, 256);
title('Histeq');
subplot(2,2,3); 
plot(x_2,counts_2);
title('x2 - counts_2');
subplot(2,2,4); 
plot(x_2,C22);
title('x2 - C22');


% For natural images

figure();
subplot(4,4,1); imshow(Img_Hist_2); title('Normal');
subplot(4,4,2); imshow(imadjust(Img_Hist_2)); title('Adjust');
subplot(4,4,3); imshow(histeq(Img_Hist_2)); title('Histeq');
subplot(4,4,4); imshow(adapthisteq(Img_Hist_2)); title('Adapthisteq');

subplot(4,4,5); imshow(Img_Hist_3); 
subplot(4,4,6); imshow(imadjust(Img_Hist_3)); 
subplot(4,4,7); imshow(histeq(Img_Hist_3)); 
subplot(4,4,8); imshow(adapthisteq(Img_Hist_3)); 

subplot(4,4,9); imshow(Img_Hist_4);
subplot(4,4,10); imshow(imadjust(Img_Hist_4)); 
subplot(4,4,11); imshow(histeq(Img_Hist_4)); 
subplot(4,4,12); imshow(adapthisteq(Img_Hist_4));

