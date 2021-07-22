function x = mydequant(q, w)
    %% Dequantize q with step w
    x = w .* (q + 1/2); 
end
