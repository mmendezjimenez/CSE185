load('att_face.mat');
num_training = 40;
num_testing = 160;
id_predict = zeros(size(id_testing));
%scale = 1;
%scale = 2;
scale = 3;

for i = 1:size(id_testing,1)
    
    %extact testing image
    img_test = face_testing(:,:,i);
    %vec_test = img_test(:);
    vec_test = multiscale_sobel_feature(img_test, scale);
    
    error = zeros(size(id_training, 1),1);
    
    for j = 1:size(id_training,1)
        
        %extract training image
        img_train = face_training(:,:,j);
        %vec_train = img_train(:);
        vec_train = multiscale_sobel_feature(img_train, scale);
        
        %compute the square error between feature vectors
        diff = vec_train - vec_test;
        error(j) = sum( diff .^2 );
        
    end
    %find the image id with minimal error
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

%%compute accuracy

accuracy = sum(id_testing == id_predict)/size(id_testing,1);
fprintf('Accuracy = %f\n', accuracy);


% Using gradient magnitude as features:
%
%---------------------------------------
%
% Scale |  Accuracy
%
%---------------------------------------
%
%   1   |   0.5313
%
%---------------------------------------
%
%   2   |   0.5375
%
%---------------------------------------
%
%   3   |   0.5688
%
%---------------------------------------
%
%
% Using gradient orientation as features:
%
%---------------------------------------
%
% Scale |  Accuracy
%
%---------------------------------------
%
%   1   |   0.5563
%
%---------------------------------------
%
%   2   |   0.6063
%
%---------------------------------------
%
%   3   |   0.6188
%
%---------------------------------------
%


