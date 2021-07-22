%% Load and Create Image
load march.mat
Image = bayer2rgb(x);
%% Show Images and kernels
figure; imshow(x); title('Image captured');
figure; imshow(Image); title('Image after bayer2rgb');
fprintf(' Kernels used on bayer2rgb:\n Kernel for R = 1/4*[1 2 1;2 4 2;1 2 1]\n Kernel for G = 1/4*[0 1 0;1 4 1;0 1 0]\n Kernel for B = 1/4*[1 2 1;2 4 2;1 2 1]\n');
