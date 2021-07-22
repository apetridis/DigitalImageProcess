%% Load and Create Images
load march.mat
Image = bayer2rgb(x);
w = 1/8; %% 3 bits/color == 2^3 = 8 quantum zones
quantized = imagequant(Image, w, w, w);
dequantized = imagedequant(quantized, w, w, w);
%% Show Images
fg = figure();
fg.WindowState = 'maximized';
subplot(1,3,3); imshow(Image); title('Original Image');
subplot(1,3,1); imshow(quantized); title('Quantized Image [3 bits/color]');
subplot(1,3,2); imshow(dequantized); title('Dequantized Image [3 bits/color]');
