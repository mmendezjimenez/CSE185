%Problem #1:
%X = imread('01.jpg');
%X(:,:,2) = 0;
%imshow(X);
%imwrite(X, 'green.jpg');

%Problem #2
%X = imread('01.jpg');
%Y = 0.299 * X(:,:,1) + 0.587 * X(:,:,2) + 0.114 * X(:,:,3);
%imshow(Y);
%imwrite(Y, 'gray.jpg');

%Problem #3
%X = imread('01.jpg');
%Y = imrotate(X, 90);
%imshow(Y);
%imwrite(Y, 'rotate.jpg');

%Problem #4
%X = imread('01.jpg');
%Y = X(30:270, 100:300, :);
%imshow(Y);
%imwrite(Y, 'crop.jpg');

%Problem#5
%X = imread('01.jpg');
%Y = flip(X);
%imshow(Y);
%imwrite(Y, 'flip.jpg');

%Problem#6
%X = imread('01.jpg');
%Y = imread('02.jpg');
%Z = imread('03.jpg');
%W = imread('04.jpg');
%canvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
%canvas(1:300, 1:400, :) = X;
%canvas(316:615, 1:400, :) = Y;
%canvas(1:300, 416:815, :) = Z;
%canvas(316:615, 416:815, :) = W;
%imshow(canvas);
%imwrite(canvas, 'combine.jpg');

%Problem#7
%X = imread('05.jpg');
%Y = imread('06.jpg');
%V1 = X(:);
%V2 = Y(:);
%Average = (V1 + V2) * 0.5;
%Average = reshape(Average, 375, 1242, 3);
%imshow(Average);
%imwrite(Average, 'Average.jpg');