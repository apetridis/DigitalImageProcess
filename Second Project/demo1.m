%% Load data
clear;rng(1);                   %% for kmeans
load dip_hw_2.mat;
%% Spectral Clustering for:
k = 2;
clustk2a = mySpectralClustering(d1a,k);
k = 3;
clustk3a = mySpectralClustering(d1a,k);
k = 4;
clustk4a = mySpectralClustering(d1a,k);
%% Present resulting labels from mySpectralClustering
fg = figure();
fg.WindowState = 'maximized';
subplot(1,3,1);
histogram(clustk2a,'BinWidth',0.1);
xlabel('Clustered 1 or 2');
ylabel('Number of nodes clustered');
title('Number of nodes clustered for k = 2');
subplot(1,3,2);
histogram(clustk3a,'BinWidth',0.2);
xlabel('Clustered 1, 2 or 3');
ylabel('Number of nodes clustered');
title('Number of nodes clustered for k = 3');
subplot(1,3,3);
histogram(clustk4a,'BinWidth',0.3);
xlabel('Clustered 1, 2, 3 or 4');
ylabel('Number of nodes clustered');
title('Number of nodes clustered for k = 4');
