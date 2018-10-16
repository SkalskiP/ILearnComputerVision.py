% Piotr Skalski
% Nearest neighbour method
clc;
clearvars;
close all;

% Img = imread('parrot.bmp');
Img = imread('clock.bmp');
% Img = imread('chessboard.bmp');

figure(1);
imshow(Img)

xReScale = 1.5;
yReScale = 1.5;

[YY,XX] = size(Img);
nYY= floor(YY * yReScale);
nXX= floor(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;

% up -> down
for ii = 0:nYY-1
    % left -> right
    for jj = 0:nXX-1 
        i = round(ii * yStep);
        j = round(jj * xStep);
        
        % out of bounds guard
         if(i > YY-1) 
            i = YY-1;
        end
        if(j > XX-1)
            j = XX-1;
        end
        
        nI(ii+1,jj+1) = Img(i+1, j+1);
    end
end

figure(2);
imshow(nI)