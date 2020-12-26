img = im2double(imread('lena.jpg'));

%compute gradient magnitude and orientaiton with Sobel filter
[magnitude, oritentation] = sobel_feature(img);

%%apply thresholding to detect edge
threshold = 0.3;

e = magnitude > threshold;


%%use built-in function to detect edge

e1 = edge(img,'Sobel');
e2 = edge(img, 'Canny');

figure, imshow(img);
figure, imshow(e1); title('Sobel Edge');
figure, imshow(e2); title ('Canny Edge');

imwrite(e1, 'sobel_edge.jpg');
imwrite(e2, 'Canny_edge.jpg');