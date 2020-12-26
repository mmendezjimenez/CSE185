%img = imread('bridge.png');
img = imread('hill.png');
%img = imread('lines.png');

edge_map = edge(rgb2gray(img), 'canny', 0.1, 3);
%imshow(edge_map);

[m,b] = hough_transform(edge_map);
x = 1:size(img,2);
y = m * x + b;

figure, imshow(img); hold on;
plot(x,y, 'LineWidth', 4, 'Color', 'red');
h = gcf;

%saveas(h,'bridge_mb_line.png');
saveas(h,'hill_mb_line.png');
%saveas(h,'lines_mb_line.png');

[r, theta] = hough_transform_polar(edge_map);
x = 1:size(img,2);
y = -(cos(theta)/sin(theta)) * x + (r / sin(theta));

figure, imshow(img); hold on;
plot(x,y,'Linewidth', 4, 'color','blue');
h = gcf;
%saveas(h, 'bridge_polar_line.png');
saveas(h, 'hill_polar_line.png');
%saveas(h, 'lines_polar_line.png');