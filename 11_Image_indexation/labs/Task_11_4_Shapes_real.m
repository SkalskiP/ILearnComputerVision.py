% Piotr Skalski
% Recognition of objects using shape coefficients

close all;
clearvars;
clc;

%% Loading and displaying an image 
im = imread('../data/shapesReal.png');
figure; 
imshow(im, []);
title('Original image')

%% Binarization
im = 1 - im2bw(im, 0.25);
labeled = bwlabel(im, 8);
figure; 
imshow(im);
title('Image after binarization')


%% Calculation of coefficients
labeled = bwlabel(im, 8);
wsp = obliczWspolczynniki(labeled);
figure; 
imshow(labeled, []);
title('Image with labels')

r = regionprops(labeled, 'Centroid');
for i = 1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)] );
end

%% Crosses
crosses = labeled;
[ width height ] = size(labeled);
for x=1:width
    for y=1:height
        px = crosses(x,y);
        if (px ~= 0 && ~(wsp(px,5) > 0.0094 && wsp(px,5) < 0.020 && wsp(px,2) > 0.5 )) && (px ~= 0 && ~(wsp(px,5) > 0.009 && wsp(px,5) < 0.020 && wsp(px,2) > 0.65 ))
%         if (px ~= 0 && ~(wsp(px,5) > 0.009 && wsp(px,5) < 0.020 && wsp(px,2) > 0.65 ))
            crosses(x,y) = 0;
        end
    end
end
figure; imshow(crosses, []);
title('Only crosses from image')