X = im2double(imread('cameraman.png'));
Y = im2double(imread('baboon.png'));
Z = im2double(imread('checkboard.png'));

sigma1 = 1;
sigma2 = 2;
alpha = 0.04;
threshold = 1e-3 * 9;

[corner_x, corner_y] = harrison_corner_detection(Z, sigma1, sigma2, alpha,threshold);

figure, imshow(Z); hold on;
plot(corner_x, corner_y, 'ro');

saveas(gcf, 'result.png');
