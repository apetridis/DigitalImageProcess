function [numOfParents,clustered] = myNCutsRecursive(anAffinityMat, T1, T2, numOfParents,clustered)
    clusterIdx = myNCuts(anAffinityMat,2);
    clustered(clusterIdx == 1) = numOfParents(clusterIdx == 1)*10 + 1;  %% Make values of cluster unique
    clustered(clusterIdx == 2) = numOfParents(clusterIdx == 2)*10 + 2;  %% Make values of cluster unique
    nCutValue = calculateNcut(anAffinityMat, clusterIdx);
    A = clusters(clusterIdx);       %% Always only 2 clusters
    A1 = unique(A(1,:));
    A2 = unique(A(2,:));    
    lenA = length(A1);
    lenB = length(A2);
    if lenA < T1 || lenB < T1 || nCutValue > T2
        return;
    else
        numOfParents(A1) = numOfParents(A1) + 1;
        [numOfParents(A1),clustered(A1)] = myNCutsRecursive(anAffinityMat(A1,A1), T1, T2,numOfParents(A1),clustered(A1));  
        numOfParents(A2) = numOfParents(A2) + 1;
        [numOfParents(A2),clustered(A2)] = myNCutsRecursive(anAffinityMat(A2,A2), T1, T2,numOfParents(A2),clustered(A2));
    end
end
