function myAffinityMat = Image2Graph(imIn)
    %% Initialize usefull arrays
    [M,N,n] = size(imIn);
    myAffinityMat = zeros(M*N,M*N);
    dist = zeros(M*N,M*N);
    channels = cell(1,n);
    %% Divide image into channels
    for i=1:n
        channels(i) = {imIn(:,:,i)};
    end
    %% Compute Euclid distance of brightness between pixels and weights of graph
    for i=1:M*N
        for j=1:M*N
            for k=1:n
                dist(i,j) = dist(i,j) + norm(channels{k}(i) - channels{k}(j));  %% Euclid distance of brightness between pixels
            end
            myAffinityMat(i,j) = 1/(exp(dist(i,j)));                            %% Weights of graph
        end
    end          
end
