%% Load data and create Graphs from Images
clear;rng(1);                   %% for kmeans
load dip_hw_2.mat;
affine2a = Image2Graph(d2a);
affine2b = Image2Graph(d2b);
[M2a,N2a,~] = size(d2a);
[M2b,N2b,~] = size(d2b);
%% Recursive Normalize-cut 
T1 = 5;
T2 = 0.2;
% Image d2a
numOfParents_a = zeros(length(affine2a),1);
clustered_a = zeros(length(affine2a),1);
[numOfParents_a,clustered_a] = myNCutsRecursive(affine2a, T1, T2, numOfParents_a, clustered_a);
A = clusters(clustered_a);
lenA = size(A,1);
cl_a = zeros(length(affine2a),1);
for i=1:lenA
    temp = unique(A(i,:));    
    cl_a(temp) = i/lenA;
end
im_a = reshape(cl_a, M2a,N2a);

% Image d2b
numOfParents_b = zeros(length(affine2b),1);
clustered_b = zeros(length(affine2b),1);
[numOfParents_b,clustered_b] = myNCutsRecursive(affine2b, T1, T2, numOfParents_b, clustered_b);
B = clusters(clustered_b);
lenB = size(B,1);
cl_b = zeros(length(affine2b),1);
for i=1:lenB
    temp = unique(B(i,:));    
    cl_b(temp) = i/lenB;
end
im_b = reshape(cl_b, M2b,N2b);

%% Show Clustered Images
figure;
subplot(1,2,1);
imshow(d2a);
title('Original Image');
subplot(1,2,2);
imshow(im_a);
title([num2str(lenA) ' clusters']);
figure;
subplot(1,2,1);
imshow(d2b);
title('Original Image');
subplot(1,2,2);
imshow(im_b);
title([num2str(lenB) ' clusters']);
fprintf('Image titles represent numbers of clusters created with thresholds T1 = %d and T2 = %f\n', T1, T2);