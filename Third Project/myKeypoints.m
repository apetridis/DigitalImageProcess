function keypoints = myKeypoints(DoGs)
    %% Starting Initialization
    keypoints = {};
    octaves = size(DoGs,2);
    for i = 1 : octaves
        [M,N,levels] = size(DoGs{i});
        levels = levels + 1;
        for l = 2 : levels - 2
            for j = 2 : M-1  
                for k = 2: N-1
                    %% Find Neighbors
                    neighborsNme = [DoGs{i}(j-1,k-1,l-1), DoGs{i}(j-1,k,l-1), DoGs{i}(j-1,k+1,l-1), ...
                        DoGs{i}(j,k-1,l-1), DoGs{i}(j,k,l-1), DoGs{i}(j,k+1,l-1), ...
                        DoGs{i}(j+1,k-1,l-1), DoGs{i}(j+1,k,l-1), DoGs{i}(j+1,k+1,l-1), ...
                        DoGs{i}(j-1,k-1,l), DoGs{i}(j-1,k,l), DoGs{i}(j-1,k+1,l), ...
                        DoGs{i}(j,k-1,l), DoGs{i}(j,k,l),DoGs{i}(j,k+1,l), ...
                        DoGs{i}(j+1,k-1,l), DoGs{i}(j+1,k,l), DoGs{i}(j+1,k+1,l), ...
                        DoGs{i}(j-1,k-1,l+1), DoGs{i}(j-1,k,l+1), DoGs{i}(j-1,k+1,l+1), ...
                        DoGs{i}(j,k-1,l+1), DoGs{i}(j,k,l+1), DoGs{i}(j,k+1,l+1), ...
                        DoGs{i}(j+1,k-1,l+1), DoGs{i}(j+1,k,l+1), DoGs{i}(j+1,k+1,l+1)];    
                    %% Find salient keypoints
                    if (DoGs{i}(j,k,l) == min(neighborsNme, [], 'all') || DoGs{i}(j,k,l) == max(neighborsNme, [], 'all'))
                        keypoints{size(keypoints,2)+1} = [i, l, j, k];
                    end
                end
            end
        end
    end
end

