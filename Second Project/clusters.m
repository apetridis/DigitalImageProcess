%% Compute id's of clustered pixels for n clusters 
function A = clusters(clusterIdx)
    n = unique(clusterIdx);                 %% Find how many clusters we have
    for i = 1:length(n)
        temp = find(clusterIdx == n(i));
        A(i,1:length(temp)) = temp;         %% Find id's of each cluster
    end
    while ismember(0,A)                     %% Find all zeros and make them the last digit of row
        A(A(:) == 0) = A(find(A(:) == 0)-length(n));
    end
end
