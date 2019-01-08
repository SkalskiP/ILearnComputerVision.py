% Piotr Skalski
% Recognition of objects using shape coefficients

close all;
clearvars;
clc;

%% Loading and displaying an image 
im = imread('../data/shapes.png');
figure; 
imshow(im, []);
title('Original image')

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

[ width height ] = size(labeled);

crosses = labeled;
for x=1:width
    for y=1:height
        px = crosses(x,y);
        if (px ~= 0 && ~(wsp(px,5) > 0.015 && wsp(px,5) < 0.020) )
            crosses(x,y) = 0;
        end
    end
end
figure; imshow(crosses, []);
title('Only crosses from image')

%% Squares

squares = labeled;
for x=1:width
    for y=1:height
        px = squares(x,y);
        if (px ~= 0 && ~(wsp(px,2) > 0.8 && wsp(px,2) < 0.9) )
            squares(x,y) = 0;
        end
    end
end
figure; imshow(squares, []);
title('Only squares from image')