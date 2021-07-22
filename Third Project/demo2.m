%% Load Data
clear;
load dip_hw_3.mat;

%% First Experiment of demo1
sigma = sqrt(2);
K = 7;
levels = 5;
octaves = 3;
[~, mountains_DoGs] = myDoGs(mountains, K, sigma, levels, octaves);
[~, roofs_DoGs] = myDoGs(roofs, K, sigma, levels, octaves);

% Normalization to [0,1]
for j = 1:size(mountains_DoGs,2)
    for i = 1:size(mountains_DoGs{j},3)
        mountains_DoGs{j}(:,:,i) = mountains_DoGs{j}(:,:,i)/max(mountains_DoGs{j}(:,:,i),[], 'all');
    end
end
for j = 1:size(roofs_DoGs,2)
    for i = 1:size(roofs_DoGs{j},3)
        roofs_DoGs{j}(:,:,i) = roofs_DoGs{j}(:,:,i)/max(roofs_DoGs{j}(:,:,i),[], 'all');
    end
end


% Find unfiltered keypoints
mountains_keypoints = myKeypoints(mountains_DoGs);
roofs_keypoints = myKeypoints(roofs_DoGs);
mountains_unfiltered = {};
mountains_unfiltered_name = {};
roofs_unfiltered = {};
roofs_unfiltered_name = {};

% Add keypoints to DoGs for image mountains
for i = 1: size(mountains_keypoints,2)
    octave = mountains_keypoints{i}(1);
    DoGs = mountains_keypoints{i}(2);
    m = mountains_keypoints{i}(3);
    n = mountains_keypoints{i}(4);
    mountains_DoGs{octave}(:,:, DoGs) = rgb2gray(insertMarker(mountains_DoGs{octave}(:,:, DoGs), [m, n], 'o', 'color', 'white', 'size', 1));
    mountains_unfiltered{octave, DoGs} = mountains_DoGs{octave}(:,:, DoGs);
    mountains_unfiltered_name{octave, DoGs} = ['Octave ', num2str(octave), ' DoG ', num2str(DoGs)];
end
% Remove empty cells
mountains_unfiltered = mountains_unfiltered(~cellfun('isempty',mountains_unfiltered));
mountains_unfiltered_name = mountains_unfiltered_name(~cellfun('isempty',mountains_unfiltered_name));

% Add keypoints to DoGs for image roofs
for i = 1: size(roofs_keypoints,2)
    octave = roofs_keypoints{i}(1);
    DoGs = roofs_keypoints{i}(2);
    m = roofs_keypoints{i}(3);
    n = roofs_keypoints{i}(4);
    roofs_DoGs{octave}(:,:, DoGs) = rgb2gray(insertMarker(roofs_DoGs{octave}(:,:, DoGs), [m, n], 'o', 'color', 'white', 'size', 1));
    roofs_unfiltered{octave, DoGs} = roofs_DoGs{octave}(:,:, DoGs);
    roofs_unfiltered_name{octave, DoGs} = ['Octave ', num2str(octave), ' DoG ', num2str(DoGs)];
end
% Remove empty cells
roofs_unfiltered = roofs_unfiltered(~cellfun('isempty',roofs_unfiltered));
roofs_unfiltered_name = roofs_unfiltered_name(~cellfun('isempty',roofs_unfiltered_name));

% Calculate again DoGs only for filtered keypoints
[~, mountains_DoGs] = myDoGs(mountains, K, sigma, levels, octaves);
[~, roofs_DoGs] = myDoGs(roofs, K, sigma, levels, octaves);

% Normalization to [0,1]
for j = 1:size(mountains_DoGs,2)
    for i = 1:size(mountains_DoGs{j},3)
        mountains_DoGs{j}(:,:,i) = mountains_DoGs{j}(:,:,i)/max(mountains_DoGs{j}(:,:,i),[], 'all');
    end
end
for j = 1:size(roofs_DoGs,2)
    for i = 1:size(roofs_DoGs{j},3)
        roofs_DoGs{j}(:,:,i) = roofs_DoGs{j}(:,:,i)/max(roofs_DoGs{j}(:,:,i),[], 'all');
    end
end

% Calculate thresholds
mountains_levels = size(mountains_DoGs{1}, 3) + 1;
mountains_n_spo = mountains_levels - 2;
mountains_t = 0.015*(2^(1/mountains_n_spo) - 1)/(2^(1/3) - 1);

roofs_levels = size(roofs_DoGs{1}, 3) + 1;
roofs_n_spo = roofs_levels - 2;
roofs_t = 0.015*(2^(1/roofs_n_spo) - 1)/(2^(1/3) - 1);

p = 0.8;

% Find filtered keypoints
mountains_keypointsHighC = discardLowContrasted(mountains_DoGs,mountains_keypoints, mountains_t, p);
roofs_keypointsHighC = discardLowContrasted(roofs_DoGs,roofs_keypoints, roofs_t, p);
mountains_filtered = {};
mountains_filtered_name = {};
roofs_filtered = {};
roofs_filtered_name = {};


% Add keypoints to DoGs for image mountains
for i = 1: size(mountains_keypointsHighC,2)
    octave = mountains_keypointsHighC{i}(1);
    DoGs = mountains_keypointsHighC{i}(2);
    m = mountains_keypointsHighC{i}(3);
    n = mountains_keypointsHighC{i}(4);
    mountains_DoGs{octave}(:,:, DoGs) = rgb2gray(insertMarker(mountains_DoGs{octave}(:,:, DoGs), [m, n], 'o', 'color', 'white', 'size', 1));
    mountains_filtered{octave, DoGs} = mountains_DoGs{octave}(:,:, DoGs);
    mountains_filtered_name{octave, DoGs} = ['Octave ', num2str(octave), ' DoG ', num2str(DoGs)];
end
% Remove empty cells
mountains_filtered = mountains_filtered(~cellfun('isempty',mountains_filtered));
mountains_filtered_name = mountains_filtered_name(~cellfun('isempty',mountains_filtered_name));

% Add keypoints to DoGs for image roofs
for i = 1: size(roofs_keypointsHighC,2)
    octave = roofs_keypointsHighC{i}(1);
    DoGs = roofs_keypointsHighC{i}(2);
    m = roofs_keypointsHighC{i}(3);
    n = roofs_keypointsHighC{i}(4);
    roofs_DoGs{octave}(:,:, DoGs) = rgb2gray(insertMarker(roofs_DoGs{octave}(:,:, DoGs), [m, n], 'o', 'color', 'white', 'size', 1));
    roofs_filtered{octave, DoGs} = roofs_DoGs{octave}(:,:, DoGs);
    roofs_filtered_name{octave, DoGs} = ['Octave ', num2str(octave), ' DoG ', num2str(DoGs)];
end
% Remove empty cells
roofs_filtered = roofs_filtered(~cellfun('isempty',roofs_filtered));
roofs_filtered_name = roofs_filtered_name(~cellfun('isempty',roofs_filtered_name));


% Show Images with keypoints
% For mountains
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=5, octaves=3)| First Line -> Unfiltered keypoints, Second Line -> Low contrast filtered keypoints |(for Img: mountains)');
% Unfiltered keypoints
for i = 1 : length(mountains_unfiltered)
    subplot(2,length(mountains_unfiltered),i);
    imshow(mountains_unfiltered{i});
    title(mountains_unfiltered_name{i});
end
% Filtered keypoints
for i = 1 : length(mountains_filtered)
    subplot(2,length(mountains_unfiltered),length(mountains_unfiltered)+i);
    imshow(mountains_filtered{i});
    title(mountains_filtered_name{i});
end

% For roofs
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=5, octaves=3)| First Line -> Unfiltered keypoints, Second Line -> Low contrast filtered keypoints |(for Img: roofs)');
% Unfiltered keypoints
for i = 1 : length(roofs_unfiltered)
    subplot(2,length(roofs_unfiltered),i);
    imshow(roofs_unfiltered{i});
    title(roofs_unfiltered_name{i});
end
% Filtered keypoints
for i = 1 : length(roofs_filtered)
    subplot(2,length(roofs_unfiltered),length(roofs_unfiltered)+i);
    imshow(roofs_filtered{i});
    title(roofs_filtered_name{i});
end