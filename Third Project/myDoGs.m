function [spacescales, DoGs] = myDoGs(img, K, sigma, levels, octaves)
    %% Starting Initialization
    k = sqrt(2);
    spacescales = cell(1,octaves);
    DoGs = cell(1,octaves);
    for j = 1:octaves
        %% Find spacescales and DoGs
        prespacescale = zeros(size(img,1), size(img, 2), levels);
        preDoGs = zeros(size(img,1), size(img, 2), levels-1);
        aGaussianFIlter = my2DGaussianFilter(K, sigma);
        prespacescale(:,:,1) = conv2(img, aGaussianFIlter, 'same');
        for i=1:levels-1
            aGaussianFIlter = my2DGaussianFilter(K, k^(i)*sigma);
            prespacescale(:,:,i+1) = conv2(prespacescale(:,:,i), aGaussianFIlter, 'same');
            preDoGs(:,:,i) = prespacescale(:,:,i) - prespacescale(:,:,i+1);
            if k^(i) == 2
                img = prespacescale(:,:,i+1);
            end
        end
        %% Scale down for next gaussian filtered Image
        img = imresize(img,0.5);
        sigma = 2*sigma;
        spacescales{j} = prespacescale;
        DoGs{j} = preDoGs;
    end
end

