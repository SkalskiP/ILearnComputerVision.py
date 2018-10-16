% Piotr Skalski
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

% XX - width
% YY - height

% up -> down
for j = 0:nYY-1
    % left -> right
    for i = 0:nXX-1
             
        % ABCD position
        ii = i*xStep;
        jj = j*yStep;
        
        i_1 = floor(ii);
        j_1 = floor(jj);
        i_2 = i_1+1;
        j_2 = j_1+1;
        
        % out of bounds guard
        if i_2 > XX-1
            i_2 = XX-1;
        end
        if j_2 > YY-1
            j_2 = YY-1;
        end
        
        i_n = rem(ii,1);
        j_n = rem(jj,1);
        
        
        
        nI(j+1,i+1) = Img(j_1+1,i_1+1)*(1-i_n)*(1-j_n) + Img(j_1+1,i_2+1)*i_n*(1-j_n)+Img(j_2+1,i_2+1)*i_n*j_n+Img(j_2+1,i_1+1)*(1-i_n)*j_n;

    end
end

figure(2);
imshow(nI)

[YY,XX] = size(Img);
figure(3)
imshow(imresize(Img,[YY * yReScale, XX * xReScale]))