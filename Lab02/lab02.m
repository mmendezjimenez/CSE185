% Problem#1

%X = imread('01.jpg');

%Canvas = zeros(300, 400, 3, 'uint8');

%x0 = 400/2;
%y0 = 300/2;

%for x1 = 1:400
%   for y1 = 1:300
%        x2 = round(cosd(45) * (x1 - x0) + sind(45) * (y1 - y0) + x0);
%        y2 = round(-sind(45) * (x1 - x0) + cosd(45) * (y1 - y0) + y0);
        
        
%        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            
%            Canvas(y2, x2, :) = X(y1, x1, : );
            
%        end
            
        
%    end
%end

%imshow(Canvas);
%imwrite(Canvas, 'rotate_0.jpg');


% Problem#2

%X = imread('01.jpg');

%Canvas = zeros(300, 400, 3, 'uint8');

%x0 = 400/2;
%y0 = 300/2;

%for y1 = 1:300
%    for x1 = 1:400
    
%        x2 = round(cosd(45) * (x1 - x0) - sind(45) * (y1 - y0) + x0);
%        y2 = round(sind(45) * (x1 - x0) + cosd(45) * (y1 - y0) + y0);
        
        
%        if (x2 >= 1 && x2 <= 400 && y2 >= 1 && y2 <= 300)
            
%            Canvas(y1, x1, :) = X(y2, x2, : );
            
%        end
         
%    end

%end

%imshow(Canvas);
%imwrite(Canvas, 'rotate_1.jpg');


% Problem#3

%X = im2double(imread('lena_noisy.jpg'));

%patch_size = [3,3];

%Y = median_filter(X,patch_size);

%imshow(Y);
%imwrite(Y, 'meadian_0.jpg');

% Problem#3

%X = im2double(imread('lena_noisy.jpg'));

%patch_size = [5,5];

%Y = median_filter(X,patch_size);

%imshow(Y);
%imwrite(Y, 'meadian_1.jpg');