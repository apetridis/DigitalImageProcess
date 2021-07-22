function xrgb = bayer2rgb(xb)
    %% Initialize xrgb and bayerfilter
    [M0,N0,~] = size(xb);
    xrgb = zeros(M0,N0,3);
    bayerfilter = zeros(M0,N0,3);
    R = [1 0 0];
    G = [0 1 0];
    B = [0 0 1];
    for i=1:M0
        for j=1:N0
            if mod(i,2)==0 && mod(j,2)==1     % Red
                bayerfilter(i,j,:) = R;
            elseif mod(i,2)==1 && mod(j,2)==0 % Blue
                bayerfilter(i,j,:) = B;
            else                              % Green
                bayerfilter(i,j,:) = G;
            end
        end
    end
    %% Image from Censors with Bayer filter
    xrgb(:,:,1) = (xb.*bayerfilter(:,:,1)); 
    xrgb(:,:,2) = (xb.*bayerfilter(:,:,2)); 
    xrgb(:,:,3) = (xb.*bayerfilter(:,:,3)); 
    %% Convolution kernels for bilinear interpolation
    Kr = 1/4*[1 2 1;2 4 2;1 2 1];
    Kg = 1/4*[0 1 0;1 4 1;0 1 0];
    Kb = 1/4*[1 2 1;2 4 2;1 2 1];
    
    xrgb(:,:,1) = conv2(xrgb(:,:,1),Kr, 'same'); 
    xrgb(:,:,2) = conv2(xrgb(:,:,2),Kg, 'same'); 
    xrgb(:,:,3) = conv2(xrgb(:,:,3),Kb, 'same'); 
end
