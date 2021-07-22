%% Load and Create Images
load march.mat
start = bayer2rgb(x);                               %% RGB Image
subsampl = myresize(start, 150, 200, 'linear');     %% Resize with linear
w = 1/8;                                            %% 3 bits/color == 2^3 = 8 quantum zones
quantized = imagequant(subsampl, w, w, w);          %% Quantize with 3bits/color
saveasppm(quantized, 'dip_is_fun.ppn', 1/w);        %% Save as ppm
%% Show Pipeline of Image    
figure; imshow(start); title('RGB Image');
figure;
subplot(3,1,1); imshow(subsampl); title('Resized to 150x200 with linear interpolation');
subplot(3,1,2); imshow(quantized); title('Quantized Image with 3bits/color');
subplot(3,1,3); imshow('dip_is_fun.ppn'); title('Image in file dip\_is\_fun.ppn');