img = im2double(imread('einstein1.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;

H = fspecial('gaussian', hsize, sigma);

I = img;
I2 = img;

for s = 1 : scale
    
    img_gaussian = imfilter(I,H);
    
    imwrite(I, sprintf('Gaussian_sclale%d.jpg',s));
    
    I = imresize(img_gaussian, 0.5);
    
end



for s = 1: scale
    
    img_gaussian = imfilter(I2,H);

    lap = I2 - img_gaussian;
    
    imwrite(lap + 0.5, sprintf('Laplacian_scale%d.jpg',s));
    
    I2 = imresize(img_gaussian, 0.5);
    
end