function [corner_x, corner_y] = harrison_corner_detection(I, sigma1, sigma2, alpha, threshold)

%Step 1

%Gaussian Kernal for gradient

hsize1 = 1 + 2 * ceil(sigma1 * 2);
gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);

%Derivative Filter
Dx = [1, 0, -1; 2, 0, -2; 1, 0, -1];
Dy = [1, 2, 1; 0, 0, 0; -1, -2, -1];



D_x = imfilter(I, Dx);
D_y = imfilter(I, Dy);

%imshow(D_x + 0.55);
imwrite(D_x + 0.55, 'D_x.png');

%imshow(D_y + 0.55);
imwrite(D_y + 0.55, 'D_y.png');

Ix = imfilter(D_x, gaussian_kernel1);
Iy = imfilter(D_y, gaussian_kernel1);


%imshow(Ix + 0.55);
imwrite(Ix + 0.55, 'I_x.png');
%imshow(Iy + 0.55);
imwrite(Iy + 0.55, 'I_y.png');

%Step 2
Ixx = Ix .* Ix;
Ixy = Ix .* Iy;
Iyy = Iy .* Iy;

%Step 3

hsize2 = 1 + 2 * ceil(sigma2 * 2);
gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

Sxx = imfilter(Ixx, gaussian_kernel2);
Sxy = imfilter(Ixy, gaussian_kernel2);
Syy = imfilter(Iyy, gaussian_kernel2);

%Step 4

det_M = Sxx .* Syy - Sxy .* Sxy;
trace_M = Sxx + Syy;

R = det_M - alpha * trace_M .^2;

figure, imagesc(R); colormap jet; colorbar; axis image;
saveas(gcf,'Corner_Responses_1.png');

corner_map = R > threshold;
%imshow(corner_map);
imwrite(corner_map, 'Corner_Response_2.png');

%Step 5

local_maxima = imregionalmax(R);
%imshow(local_maxima);
imwrite(local_maxima, 'Local Maxima.png');

final_corner_map = corner_map & local_maxima;
%imshow(final_corner_map);
imwrite(final_corner_map, 'Final_corner_map.png');

%Step 6

[corner_y, corner_x] = find(final_corner_map);

end