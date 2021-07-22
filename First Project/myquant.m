function q = myquant(x, w)
    %% Quantize x with step w
    q = floor(x ./ w);
end