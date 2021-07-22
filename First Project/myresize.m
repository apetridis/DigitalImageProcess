function xrgbres = myresize(xrgb, N, M, method)
    %% Initialization
    xrgbres = zeros(N, M, 3);
    [M0,N0,~] = size(xrgb);
    y_radio = M0/N;
    x_radio = N0/M;
    %% Implementation
    if strcmp(method, 'nearest')     %% Nearest Neighbor Interpolation
        for i=1:N
            y = ceil(y_radio * i);
            for j=1:M
                x = ceil(x_radio * j); 
                xrgbres(i,j,:) = xrgb(y,x,:);
            end
        end
    elseif strcmp(method, 'linear') %% Bilinear Interpolation
        for i=1:N
            y_l = ceil(y_radio * i);
            y_h = ceil(y_radio * i);
            y_w = (y_radio * i) - y_l;
            for j=1:M
                x_l = ceil(x_radio * j);
                x_h = ceil(x_radio * j);
                x_w = (x_radio * j) - x_l;
                xrgbres(i,j,:) = xrgb(y_l,x_l,:) * (1 - x_w) * (1 - y_w) + xrgb(y_l,x_h,:) * x_w * (1 - y_w) + xrgb(y_h,x_l,:) * (1 - x_w) * y_w +  xrgb(y_h,x_h,:) * x_w * y_w;
            end
        end
    else
        fprintf('Method type is incorrect:\nPlease choose between nearest and linear');
    end
end
