I1 = im2double(imread('einstein1.jpg'));
%I1 = im2double(imread('einstein2.jpg'));
template = im2double(imread('template.jpg'));
threshold = 0.5;
shift_u = 26;
shift_v = 26;
output = zeros(size(I1));

for u = 1 + shift_u : size(I1, 2) - shift_u
    for v = 1 + shift_v : size(I1, 1) - shift_v
        x1 = u - shift_u; x2 = u;
        y1 = v - shift_v; y2 = v;
        patch = I1(y1:y2, x1:x2);
        
        patch_vec = reshape(patch,[],1);
        temp_vec = reshape(template,[],1);
        
        patch_value = patch_vec - mean(patch_vec);
        temp_value = temp_vec - mean(temp_vec);
        
        mag_patch = norm(patch_value) ;
        mag_temp = norm(temp_value);
        
        patch_value = patch_value ./ mag_patch;
        temp_value =  temp_value ./ mag_temp;
        
        normcorr = dot(patch_value, temp_value);
        
        %Normalizd Cross-Correlation
        value = normcorr;
        output(v,u) = value;
        
    end
    
end


match = (output > threshold);
imshow(match);
imwrite(match, 'template_matching_normcorr_1.jpg');
%imwrite(match, 'template_matching_normcorr_2.jpg');


