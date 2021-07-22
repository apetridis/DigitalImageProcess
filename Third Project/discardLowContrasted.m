function keypointsHighC = discardLowContrasted(DoGs,keypoints, t, p)
    %% Starting Initialization
    keypointsHighC = keypoints;
    NumberOfkeypointsBefore = size(keypoints, 2);
    %     octave -> keypoints{i}(1) 
    %     spacescale, DoGs -> keypoints{i}(2)
    %     m -> keypoints{i}(3)
    %     n -> keypoints{i}(4)
    for i = 1 : NumberOfkeypointsBefore
        %% Discard low contrasted keypoints 
        if (abs(DoGs{keypoints{i}(1)}(keypoints{i}(3),keypoints{i}(4),keypoints{i}(2))) <= p*t)
            keypointsHighC{i} = [];
        end
    end

    %% Remove empty cells
    keypointsHighC = keypointsHighC(~cellfun('isempty',keypointsHighC));
end

