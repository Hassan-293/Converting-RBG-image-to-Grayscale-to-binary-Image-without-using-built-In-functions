clc; clear all; 
close all;

RGB_image = imread('gaming.png');

RGB_image = double(RGB_image);

% splitng the Images in Red Green Blue Channels

R = RGB_image(:,:,1);

G = RGB_image(:,:,2);

B = RGB_image(:,:,3);
% use weight, self define

gray = 0.299 * R + 0.587 * G + 0.114 * B;
% gray to rgb, self define
% display

Gray_scale_Image=(mat2gray(gray));


%Now converting the Grayscale Image Into Binary Image

image=imread('gaming.png');



di = strel('line',50,100);
%Creating morphological structuring element
%strel(shape,parameters)

dilate = imdilate(gray,di);
%dilates the grayscale, binary,

er = strel('line',50,100);

erode = imerode(dilate,er);
% erodes the grayscale, binary,

%difference image between opening operation and grayscale

difference_image = double(gray) - double(erode);

imshow(difference_image,[]); % Display the difference image.

outputImage = uint8(255 * mat2gray(difference_image));

%Displaying the Images 

subplot(1,3,1)
imshow(mat2gray(RGB_image));
title('Orignal RGB Image')


subplot(1,3,2)
imshow(mat2gray(gray));
title('GrayScale Image')


subplot(1,3,3)
imshow(outputImage);
title('Binary Image')


