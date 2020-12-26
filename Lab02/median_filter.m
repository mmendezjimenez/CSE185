function Y = median_filter(X, patch_size)
    
    Canvas = zeros(512, 512, 1, 'double');
    
    shift_v = floor(patch_size(2) / 2);
    shift_u = floor(patch_size(1) / 2);
    
    for u = 1 + shift_u : size(X, 2) - shift_u
        
        for v = 1 + shift_v : size(X, 1) - shift_v
            
            x1 = u - shift_u; x2 = u + shift_u;
            
            y1 = v - shift_v; y2 = v + shift_v;
            
            patch = X(y1:y2, x1:x2);
            
            patch = patch(:);
            
            value = median(patch);
            
            Canvas(v, u) = value;
            
        end
        
    end
    
    Y = Canvas;

end