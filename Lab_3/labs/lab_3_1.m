% Piotr Skalski
% LUT

clearvars;
clc;
close all;

load funkcjeLUT
lut_operations = {kwadratowa, log, odwlog, odwrotna, pierwiastkowa, pila, wykladnicza};

lena = imread('lena.bmp');
circle = imread('kolo.bmp');
square = imread('kwadrat.bmp');
jet = imread('jet.bmp');

img_data_list = {lena, circle, square, jet};

figure(1)
LUT(lena, kwadratowa)

figure(2)
LUT(jet, odwrotna)

figure(3)
LUT(jet, odwlog)

figure(4)
LUT(jet, pila)

figure(5)
LUT(jet, wykladnicza)

figure(6)
LUT(jet, log)