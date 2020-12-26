%Problem #1
%X = im2double(imread('lena.jpg'));
%
%H = [1, 2, 1 : 0, 0, 0 : -1, -2, -1];
%
%img_sobel = sobel_filter(X,H);
%figure, imshow(img_sobel);
%imwrite(img_sobel, 'sobel_y.jpg');

%Problem #2
% X = im2double(imread('lena.jpg'));
% 
% H = [1, 0, -1 : 2, 0, -2 : 1, 0, -1];
% 
% img_sobel = sobel_filter(X,H);
% figure, imshow(img_sobel);
% imwrite(img_sobel, 'sobel_x.jpg');

%Problem #3

X = im2double(imread('lena.jpg'));

cr = sobel_filter(X);
figure, imshow (cr);
imwrite(cr,'sobel_cr.jpg');


%Problem #4

% X = im2double(imread('lena.jpg'));
% 
% rc = sobel_filter(X);
% figure, imshow (rc);
% imwrite(rc,'sobel_rc.jpg');


%Problem #5
% X = im2double(imread('lena.jpg'));
% 
% hsize = 5; sigma = 2;
% 
% img_gaussian = gaussian_filter(X, hsize, sigma);
% figure, imshow(img_gaussian);
% imwrite(img_gaussian, 'gaussian_5.jpg');

%Problem #6
% X = im2double(imread('lena.jpg'));
% 
% hsize = 9; sigma = 4;
% 
% img_gaussian = gaussian_filter(X, hsize, sigma);
% figure, imshow(img_gaussian);
% imwrite(img_gaussian, 'gaussian_9.jpg');