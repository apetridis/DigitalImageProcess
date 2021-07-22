function myGFilter = my2DGaussianFilter(K, sigma)
    %% Create My GaussianFilter centered into (K/2, K/2)
    myGFilter = zeros(K,K);
    for x = 1:K
        for y = 1:K
            myGFilter(x, y) = ( 1/(2 * pi * sigma^2) ) * exp(-( (x-K/2)^2 + (y-K/2)^2 )/(2 * sigma^2) );
        end
    end
    
    %% Normalize Filter into [0,1]
     myGFilter = myGFilter/sum(myGFilter, 'all');
end

