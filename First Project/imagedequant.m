function x = imagedequant(q, w1, w2, w3)
    x = zeros(size(q));
    x(:,:,1) = mydequant(q(:,:,1), w1);
    x(:,:,2) = mydequant(q(:,:,2), w2);
    x(:,:,3) = mydequant(q(:,:,3), w3);  
end
