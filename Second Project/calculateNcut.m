function nCutValue = calculateNcut(anAffinityMat, clusterIdx)   %% Only for k = 2 with clusters 1 and 2
%% Find length from cluster 1 and cluster 2
A = clusters(clusterIdx);
A1 = unique(A(1,:));
A2 = unique(A(2,:));

%% Compute assoc(A,A) and assoc(A,V)
assoc_A_A = sum(anAffinityMat(A1,A1),'all');
assoc_A_V = sum(anAffinityMat(A1,:),'all');

%% Compute assoc(B,B) and assoc(B,V)
assoc_B_B = sum(anAffinityMat(A2,A2),'all');
assoc_B_V = sum(anAffinityMat(A2,:),'all');

%% Ncut(A,B) = 2 - Nassoc(A,B) with Nassoc(A,B) = assoc(A,A)/assoc(A,V) + assoc(B,B)/assoc(B,V)
Nassoc_A_B = assoc_A_A/assoc_A_V + assoc_B_B/assoc_B_V;
nCutValue = 2 - Nassoc_A_B;
end
