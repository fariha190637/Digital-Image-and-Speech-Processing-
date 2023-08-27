clc;
clear all;
close all;
% Read the image
originalImage = imread('fruit-2999796.jpg'); % Replace with your image filename

% Convert to grayscale if necessary
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% i) Threshold image
thresholdValue = 128;
thresholded = grayImage > thresholdValue;

% ii) Power enhance contrast image
gamma = 1.5;
enhancedImage = imadjust(grayImage, [], [], gamma);

% iii) High pass image
filterSize = 3;
highPass = grayImage - imgaussfilt(grayImage, filterSize);

% Display the images
subplot(2, 2, 1), imshow(originalImage), title('Original Image');
subplot(2, 2, 2), imshow(thresholded), title('Thresholded Image');
subplot(2, 2, 3), imshow(enhancedImage), title('Enhanced Contrast Image');
subplot(2, 2, 4), imshow(highPass), title('High Pass Image');
