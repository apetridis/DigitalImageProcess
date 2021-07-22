function saveasppm(x, filename, K)
    %% Init
    [M0,N0,~] = size(x);
    %% Create PPM file
    file = fopen(filename, 'w');                 %% Discard existing content if any
    fprintf(file, 'P6 %d %d %d\n', N0, M0, K);   %% PPM Header Format
    %% Create Data
    if (K < 0) || (K > 65536)   %% Error
        fprintf('K must be less than 65,536 and more than zero.');
    elseif K < 256              %% One byte for each unsigned int (with little endian)
        for i=1:M0
            for j=1:N0
                fwrite(file, x(i,j,:), 'uint8', 'ieee-le'); 
            end
        end
    else                        %% Two bytes for each unsigned int (with big endian)
        for i=1:M0
            for j=1:N0
                fwrite(file, x(i,j,:), 'uint16', 'ieee-be'); 
            end
        end
    end  
    fclose(file);
end
