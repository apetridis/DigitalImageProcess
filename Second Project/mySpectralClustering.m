function clusterIdx = mySpectralClustering(anAffinityMat, k)
    %% Create matrix D (Diagonal with Sum of weights of anAffinityMat)
    D = diag(sum(anAffinityMat,2));
    %% Create matrix L
    L = D - anAffinityMat;
    %% Compute k-min Eigenvalues and Eigenvectors of L
    [U,~] = eigs(L,k,'smallestreal');    %% Eigenvalues are unnecessary.
    %% K-means for clustering 
    clusterIdx = kmeans(U,k);
end