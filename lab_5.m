clc;
clear all;
close all;
% Load the image
image = imread('fruit-2999796.jpg');
gray_image = rgb2gray(image);

% Apply edge detection using the Sobel operator
edge_horizontal = edge(gray_image, 'Sobel', 'horizontal');
edge_vertical = edge(gray_image, 'Sobel', 'vertical');

% Display the original image and detected edges
subplot(1, 3, 1), imshow(image), title('Original Image');
subplot(1, 3, 2), imshow(edge_horizontal), title('Horizontal Edges');
subplot(1, 3, 3), imshow(edge_vertical), title('Vertical Edges');

