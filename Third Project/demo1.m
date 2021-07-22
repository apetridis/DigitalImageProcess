%% Load Data
clear;
load dip_hw_3.mat;

%% First Experiment
% Initialize parametres, spacescales and DoGs
sigma = sqrt(2);
K = 7;
levels = 5;
octaves = 3;
[mountains_spacescales, mountains_DoGs] = myDoGs(mountains, K, sigma, levels, octaves);
[roofs_spacescales, roofs_DoGs] = myDoGs(roofs, K, sigma, levels, octaves);

% Show spacescales for image mountains
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=5, octaves=3) Blurring (for Img: mountains)');
for j = 1:levels
    subplot(octaves,levels,j);
    imshow(mountains_spacescales{1}(:,:,j));  
end
for j = levels+1 : 2*levels
    subplot(octaves,levels,j);
    imshow(mountains_spacescales{2}(:,:,j-levels));  
end
for j = 2*levels+1 : 3*levels
    subplot(octaves,levels,j);
    imshow(mountains_spacescales{3}(:,:,j-2*levels));  
end

% Show DoGs for image mountains
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=5, octaves=3) Octave 1 -> line 1, Octave 2 -> line 2, Octave 3 -> line 3 (for Img: mountains)');
for j = 1:levels-1
    subplot(octaves,levels-1,j);
    imshow(mountains_DoGs{1}(:,:,j));  
    title(['DoG ', num2str(j)]);
end
for j = levels : 2*(levels-1)
    subplot(octaves,levels-1,j);
    imshow(mountains_DoGs{2}(:,:,j-(levels-1)));  
    title(['DoG ', num2str(j-(levels-1))]);
end
for j = 2*levels-1 : 3*(levels-1)
    subplot(octaves,levels-1,j);
    imshow(mountains_DoGs{3}(:,:,j-2*(levels-1)));  
    title(['DoG ', num2str(j-2*(levels-1))]);
end

% Show spacescales for image roofs
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=5, octaves=3) Blurring (for Img: roofs)');
for j = 1:levels
    subplot(octaves,levels,j);
    imshow(roofs_spacescales{1}(:,:,j));  
end
for j = levels+1 : 2*levels
    subplot(octaves,levels,j);
    imshow(roofs_spacescales{2}(:,:,j-levels));  
end
for j = 2*levels+1 : 3*levels
    subplot(octaves,levels,j);
    imshow(roofs_spacescales{3}(:,:,j-2*levels));  
end

% Show DoGs for image roofs
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=5, octaves=3) Octave 1 -> line 1, Octave 2 -> line 2, Octave 3 -> line 3 (for Img: roofs)');
for j = 1:levels-1
    subplot(octaves,levels-1,j);
    imshow(roofs_DoGs{1}(:,:,j));  
    title(['DoG ', num2str(j)]);
end
for j = levels : 2*(levels-1)
    subplot(octaves,levels-1,j);
    imshow(roofs_DoGs{2}(:,:,j-(levels-1)));  
    title(['DoG ', num2str(j-(levels-1))]);
end
for j = 2*levels-1 : 3*(levels-1)
    subplot(octaves,levels-1,j);
    imshow(roofs_DoGs{3}(:,:,j-2*(levels-1)));  
    title(['DoG ', num2str(j-2*(levels-1))]);
end

%% Second Experiment
% Initialize parametres, spacescales and DoGs
sigma = sqrt(2);
K = 7;
levels = 3;
octaves = 7;
[mountains_spacescales2, mountains_DoGs2] = myDoGs(mountains, K, sigma, levels, octaves);
[roofs_spacescales2, roofs_DoGs2] = myDoGs(roofs, K, sigma, levels, octaves);

% Show spacescales for image mountains
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=3, octaves=7) Blurring (for Img: mountains)');
for j = 1 : levels
    subplot(octaves, levels, j);
    imshow(mountains_spacescales2{1}(:,:,j));
end
for j = levels+1 : 2*levels
    subplot(octaves, levels, j);
    imshow(mountains_spacescales2{2}(:,:,j-levels));
end
for j = 2*levels+1 : 3*levels
    subplot(octaves, levels, j);
    imshow(mountains_spacescales2{3}(:,:,j-2*levels));
end
for j = 3*levels+1 : 4*levels
    subplot(octaves, levels, j);
    imshow(mountains_spacescales2{4}(:,:,j-3*levels));
end
for j = 4*levels+1 : 5*levels
    subplot(octaves, levels, j);
    imshow(mountains_spacescales2{5}(:,:,j-4*levels));
end
for j = 5*levels+1 : 6*levels
    subplot(octaves, levels, j);
    imshow(mountains_spacescales2{6}(:,:,j-5*levels));
end
for j = 6*levels+1 : 7*levels
    subplot(octaves, levels, j);
    imshow(mountains_spacescales2{7}(:,:,j-6*levels));
end

% Show DoGs for image mountains
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=3, octaves=7) Octave 1 -> line 1, Octave 2 -> line 2, Octave 3 -> line 3, Octave 4 -> line 4, Octave 5 -> line 5, Octave 6 -> line 6, Octave 7 -> line 7 (for Img: mountains)');
for j = 1 : levels-1
    subplot(octaves, levels-1, j);
    imshow(mountains_DoGs2{1}(:,:,j));
    title(['DoG ', num2str(j)]);
end
for j = levels : 2*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(mountains_DoGs2{2}(:,:,j-(levels-1)));
    title(['DoG ', num2str(j-(levels-1))]);
end
for j = 2*levels-1 : 3*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(mountains_DoGs2{3}(:,:,j-2*(levels-1)));
    title(['DoG ', num2str(j-2*(levels-1))]);
end
for j = 3*levels-2 : 4*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(mountains_DoGs2{4}(:,:,j-3*(levels-1)));
    title(['DoG ', num2str(j-3*(levels-1))]);
end
for j = 4*levels-3 : 5*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(mountains_DoGs2{5}(:,:,j-4*(levels-1)));
    title(['DoG ', num2str(j-4*(levels-1))]);
end
for j = 5*levels-4 : 6*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(mountains_DoGs2{6}(:,:,j-5*(levels-1)));
    title(['DoG ', num2str(j-5*(levels-1))]);
end
for j = 6*levels-5 : 7*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(mountains_DoGs2{7}(:,:,j-6*(levels-1)));
    title(['DoG ', num2str(j-6*(levels-1))]);
end

% Show spacescales for image roofs
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=3, octaves=7) Blurring (for Img: roofs)');
for j = 1 : levels
    subplot(octaves, levels, j);
    imshow(roofs_spacescales2{1}(:,:,j));
end
for j = levels+1 : 2*levels
    subplot(octaves, levels, j);
    imshow(roofs_spacescales2{2}(:,:,j-levels));
end
for j = 2*levels+1 : 3*levels
    subplot(octaves, levels, j);
    imshow(roofs_spacescales2{3}(:,:,j-2*levels));
end
for j = 3*levels+1 : 4*levels
    subplot(octaves, levels, j);
    imshow(roofs_spacescales2{4}(:,:,j-3*levels));
end
for j = 4*levels+1 : 5*levels
    subplot(octaves, levels, j);
    imshow(roofs_spacescales2{5}(:,:,j-4*levels));
end
for j = 5*levels+1 : 6*levels
    subplot(octaves, levels, j);
    imshow(roofs_spacescales2{6}(:,:,j-5*levels));
end
for j = 6*levels+1 : 7*levels
    subplot(octaves, levels, j);
    imshow(roofs_spacescales2{7}(:,:,j-6*levels));
end

% Show DoGs for image roofs
fg = figure();
fg.WindowState = 'maximized';
sgtitle('(K=7, levels=3, octaves=7) Octave 1 -> line 1, Octave 2 -> line 2, Octave 3 -> line 3, Octave 4 -> line 4, Octave 5 -> line 5, Octave 6 -> line 6, Octave 7 -> line 7 (for Img: roofs)');
for j = 1 : levels-1
    subplot(octaves, levels-1, j);
    imshow(roofs_DoGs2{1}(:,:,j));
    title(['DoG ', num2str(j)]);
end
for j = levels : 2*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(roofs_DoGs2{2}(:,:,j-(levels-1)));
    title(['DoG ', num2str(j-(levels-1))]);
end
for j = 2*levels-1 : 3*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(roofs_DoGs2{3}(:,:,j-2*(levels-1)));
    title(['DoG ', num2str(j-2*(levels-1))]);
end
for j = 3*levels-2 : 4*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(roofs_DoGs2{4}(:,:,j-3*(levels-1)));
    title(['DoG ', num2str(j-3*(levels-1))]);
end
for j = 4*levels-3 : 5*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(roofs_DoGs2{5}(:,:,j-4*(levels-1)));
    title(['DoG ', num2str(j-4*(levels-1))]);
end
for j = 5*levels-4 : 6*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(roofs_DoGs2{6}(:,:,j-5*(levels-1)));
    title(['DoG ', num2str(j-5*(levels-1))]);
end
for j = 6*levels-5 : 7*(levels-1)
    subplot(octaves, levels-1, j);
    imshow(roofs_DoGs2{7}(:,:,j-6*(levels-1)));
    title(['DoG ', num2str(j-6*(levels-1))]);
end


%% For Automatic plots, is not used because by hand we have smallest number of figures
% for i = 1:octaves
%     fg = figure();
%     %fg.WindowState = 'maximized';
%     sgtitle(['Octave ', num2str(i)]);
%     for j = 1:levels-1
%         subplot(1,levels-1,j);
%         imshow(mountains_DoGs{i}(:,:,j));  
%         title(['DoG ', num2str(j)]);
%     end
% end
% for i = 1:octaves
%     fg = figure();
%     %fg.WindowState = 'maximized';
%     sgtitle(['Octave ', num2str(i)]);
%     for j = 1:levels-1
%         subplot(1,levels-1,j);
%         imshow(roofs_DoGs{i}(:,:,j));  
%         title(['DoG ', num2str(j)]);
%     end
% end