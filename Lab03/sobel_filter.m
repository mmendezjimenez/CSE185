% function Y = sobel_filter(X, kernel)
% 
%     Canvas = zeros(512, 512, 1, 'double');
%     
%     shift_v = floor(size(kernel,2) / 2);
%     shift_u = floor(size(kernel,1) / 2);
%     
%     for u = 1 + shift_u : size(X, 2) - shift_u
%         
%         for v = 1 + shift_v : size(X, 1) - shift_v
%             
%             x1 = u - shift_u; x2 = u + shift_u;
%             
%             y1 = v - shift_v; y2 = v + shift_v;
%             
%             patch = X(y1:y2, x1:x2);
%             
%             patch = patch(:);
%             
%             kernel = kernel(:);
%             
%             kernel = kernel';
%             
%             value = kernel * patch;
%             
%             Canvas(v, u) = value;
%             
%         end
%         
%     end
%     
%     Y = Canvas;
% 
% end

function Y = sobel_filter(X)

    %cr components
    Hx1 = [1,1,1; 0,0,0; -1,-1,-1];
    Hx2 = [1,2,1];
    
    %rc components
%     Hx1 = [1 2 1; 1 2 1; 1 2 1];
%     Hx2 = [1,0,-1];
    
    %Hx3 = Hx2';
    [rows, cols] = size(X);
    I2 = zeros (rows+2, cols+2);
    I2(1+1:rows+1,1+1:cols+1) = X;
    output = zeros(rows+2, cols+2);
    Y = zeros(rows, cols);

    
    
    for i= 1:rows
        for j = 1:cols
            
          %cr components
          output(i,j:j+2) = sum(Hx1.*I2(i:i+2,j:j+2),1);
          Y(i,j) = sum(Hx2.*output(i,j:j+2));
          
          %rc componets
%             output(i:i+2,j) = sum(Hx1.*I2(i:i+2,j:j+2),2);
%             Y(i,j) = sum(Hx2'.*output(i:i+2,j));

        end
    end              
end