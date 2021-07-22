%% Load and Create Images
load march.mat
Image = bayer2rgb(x);
nearestIm = myresize(Image, 240, 320, 'nearest');
linearIm = myresize(Image, 200, 300, 'linear');
%% Show Images
figure; imshow(Image); title('Original Image [size 960x1280]');
figure;
subplot(1,2,1); imshow(nearestIm); title('Nearest Neighbor interpolation [size 240x320]');
subplot(1,2,2); imshow(linearIm); title('Bilinear interpolation [size 200x300]');

