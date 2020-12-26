function Y = gaussian_filter(X, hsize, sigma)
    
    H = fspecial('gaussian',hsize, sigma);
    
    Canvas = zeros(512, 512, 1, 'double');
    
    shift_v = floor(size(H,2) / 2);
    shift_u = floor(size(H,1) / 2);
    
    for u = 1 + shift_u : size(X, 2) - shift_u
        
        for v = 1 + shift_v : size(X, 1) - shift_v
            
            x1 = u - shift_u; x2 = u + shift_u;
            
            y1 = v - shift_v; y2 = v + shift_v;
            
            patch = X(y1:y2, x1:x2);
            
            patch = patch(:);
            
            H = H(:);
            
            H = H';
            
            value = H * patch;
            
            Canvas(v, u) = value;
            
        end
        
    end
    
    Y = Canvas;

end