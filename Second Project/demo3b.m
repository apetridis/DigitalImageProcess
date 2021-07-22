%% Load data and create Graphs from Images
clear;rng(1);                   %% for kmeans
load dip_hw_2.mat;
affine2a = Image2Graph(d2a);
affine2b = Image2Graph(d2b);
[M2a,N2a,~] = size(d2a);
[M2b,N2b,~] = size(d2b);
%% Normalize-cut Clustering and Reshape of Image for:
k = 2;
clustk2a = myNCuts(affine2a,k);
nCutValueA = calculateNcut(affine2a, clustk2a);
clustk2b = myNCuts(affine2b,k);
nCutValueB = calculateNcut(affine2b, clustk2b); 
fprintf('nCutValue for d2a is: %f \n nCutValue for d2b is: %f \n',nCutValueA,nCutValueB);
%% Show Original and Clustered Images
clustk2a = clustk2a./k;
clustk2b = clustk2b./k;
im2a = reshape(clustk2a,M2a,N2a);
im2b = reshape(clustk2b,M2b,N2b);
figure;
subplot(1,2,1);
imshow(d2a);
title('Original Image');
subplot(1,2,2);
imshow(im2a);
title('Image with 2 clusters');
figure;
subplot(2,2,1);
imshow(d2b);
title('Original Image');
subplot(2,2,2);
imshow(im2b);
title('Image with 2 clusters');