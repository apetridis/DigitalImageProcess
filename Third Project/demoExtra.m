%% Find keypoints into original Image
% Import lenna and make it double (from uint8)
clear;
lenna_off = imread('lenna.jpg');
lenna = im2double(lenna_off);

% Initialize parametres
sigma = sqrt(2);
K = 20;
levels = 5;
octaves = 5;
[lenna_spacescale, lenna_DoGs] = myDoGs(lenna, K, sigma, levels, octaves);

% Find unfiltered keypoints
lenna_keypoints = myKeypoints(lenna_DoGs);
lenna_unfiltered = {};
lenna_unfiltered_name = {};
% Add keypoints to lenna
for i = 1: size(lenna_keypoints,2)
    octave = lenna_keypoints{i}(1);
    DoGs = lenna_keypoints{i}(2);
    m = lenna_keypoints{i}(3);
    n = lenna_keypoints{i}(4);
    lenna_spacescale{octave}(:,:, DoGs) = rgb2gray(insertMarker(lenna_spacescale{octave}(:,:, DoGs), [m,n], '+', 'color', 'white', 'size', 10));
    lenna_unfiltered{octave, DoGs} = lenna_spacescale{octave}(:,:, DoGs);
    lenna_unfiltered_name{octave, DoGs} = ['Octave ', num2str(octave), ' DoG ', num2str(DoGs)];
end
lenna_unfiltered = lenna_unfiltered(~cellfun('isempty',lenna_unfiltered));
lenna_unfiltered_name = lenna_unfiltered_name(~cellfun('isempty',lenna_unfiltered_name));

% Initialize parametres
levels = size(lenna_DoGs{1}, 3) + 1;
n_spo = levels - 2;
t = 0.015*(2^(1/n_spo) - 1)/(2^(1/3) - 1);
p = 2;

lenna = im2double(lenna_off);
[lenna_spacescale, lenna_DoGs] = myDoGs(lenna, K, sigma, levels, octaves);

% Find Filtered keypoints
lenna_keypointsHighC = discardLowContrasted(lenna_DoGs,lenna_keypoints, t, p);
lenna_filtered = {};
lenna_filtered_name = {};
% Add keypoints to lenna 
for i = 1: size(lenna_keypointsHighC,2)
    octave = lenna_keypointsHighC{i}(1);
    DoGs = lenna_keypointsHighC{i}(2);
    m = lenna_keypointsHighC{i}(3);
    n = lenna_keypointsHighC{i}(4);
    lenna_spacescale{octave}(:,:, DoGs) = rgb2gray(insertMarker(lenna_spacescale{octave}(:,:, DoGs), [m, n], '+', 'color', 'white', 'size', 10));
    lenna_filtered{octave, DoGs} = lenna_spacescale{octave}(:,:, DoGs);
    lenna_filtered_name{octave, DoGs} = ['Octave ', num2str(octave), ' DoG ', num2str(DoGs)];
end
lenna_filtered = lenna_filtered(~cellfun('isempty',lenna_filtered));
lenna_filtered_name = lenna_filtered_name(~cellfun('isempty',lenna_filtered_name));

% Show results

fg = figure();
fg.WindowState = 'maximized';
sgtitle('Results into lenna spacescales with salient points');
% Unfiltered keypoints
for i = 1 : length(lenna_unfiltered)
    subplot(2,length(lenna_unfiltered),i);
    imshow(lenna_unfiltered{i});
    title(lenna_unfiltered_name{i});
end
% Filtered keypoints
for i = 1 : length(lenna_unfiltered)
    subplot(2,length(lenna_unfiltered),i+length(lenna_unfiltered));
    imshow(lenna_filtered{i});
    title(lenna_filtered_name{i});
end

