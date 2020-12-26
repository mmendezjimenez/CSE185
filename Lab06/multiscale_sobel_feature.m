function feature2 = multiscale_sobel_feature(img, scale)

%initialize feature vector
feature = [];

for i = 1:scale
    
    %compute soble feature
    [magnitude, orientation] = sobel_feature(img);
    
    %concatenate feature vector
    %feature = cat(1,feature,magnitude(:));
    feature = cat(1,feature,orientation(:));

    %down_sample image by 2
    feature2 = imresize(feature, 1/scale);
    
end


end