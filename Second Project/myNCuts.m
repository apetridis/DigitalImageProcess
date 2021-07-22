function clusterIdx = myNCuts(anAffinityMat, k)
    %% Create matrix D (Diagonal with Sum of weights of anAffinityMat)
    D = diag(sum(anAffinityMat,2));
    %% Create matrix L
    L = D - anAffinityMat;
    %% Compute Generalized k-min Eigenvalues and Eigenvectors of L
    [U,~] = eigs(L,D,k,'smallestreal');    %% Eigenvalues are unnecessary.
    %% K-means for clustering 
    clusterIdx = kmeans(U,k);
end
