I1 = im2double(imread('einstein1.jpg'));
I2 = im2double(imread('einstein2.jpg'));
output1 = zeros(size(I1));
output2 = zeros(size(I2));

for u = 1 + shift_u : size(I1, 2) - shift_u
    for v = 1 + shift_v : size(I1, 1) - shift_v
        x1 = u - shift_u; x2 = u;
        y1 = v - shift_v; y2 = v;
        patch = I1(y1:y2, x1:x2);
        
        %Normalized Cross-Correlation
        value = sum((patch - template).^2, 'all');
        output1(v,u) = value;
        
    end
    
end


match = (output1 < threshold);
imshow(match);
imwrite(match, 'template_matching_SSD_1.jpg');




for u = 1 + shift_u : size(I2, 2) - shift_u
    for v = 1 + shift_v : size(I2, 1) - shift_v
        x1 = u - shift_u; x2 = u;
        y1 = v - shift_v; y2 = v;
        patch = I2(y1:y2, x1:x2);
        
        %ssd
        value = sum((patch - template).^2, 'all');
        output2(v,u) = value;
        
    end
    
end


match = (output2 < threshold);
imshow(match);
imwrite(match, 'template_matching_SSD_2.jpg');