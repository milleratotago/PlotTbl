% A script to demonstrate the use of PlotTbl.

% You must first install ExtractNameVal, available at https://github.com/milleratotago/ExtractNameVal

% % Create a table of data that can be used to illustrate various plotting capabilities.
% % These data are not intended to be realistic!
% Ages = 2:2:12;
% Genders = 1:2;        % Male/female
% Nationalities = 1:3;  % Any 3 countries
% AllRows = allcomb(Ages,Genders,Nationalities);  % https://au.mathworks.com/matlabcentral/fileexchange/10064-allcomb-varargin-
% AHWDat = table(AllRows(:,1),AllRows(:,2),AllRows(:,3),'VariableNames',{'Age','Gender','Nationality'});
% AHWDat.AvgHeight = 100 + 2*AHWDat.Age + 10*AHWDat.Gender + randn(height(AHWDat),1)*1.3;
% AHWDat.AvgWeight =  50 + 3*AHWDat.Age + 10*AHWDat.Gender + randn(height(AHWDat),1)*1.50;
% save('AHWDat','AHWDat');

% Load sample data previously created by the above now-commented script.
load('AHWDat');


%% Plot AvgWeight(Y) vs Age(X) with one subplot for each combination of Gender and Nationality:
figure;  PlotTbl(AHWDat,'Age','AvgWeight','SubplotRowsCodeVar','Gender','SubplotColsCodeVar','Nationality');

%% Plot AvgWeight(Y) vs Age(X) in one row of subplots & AvgHeight(Y) vs Age(X) for a second row of subplots.
% Use one column of subplots for each Nationality, and plot males/females as separate lines within each subplot.
figure;  PlotTbl(AHWDat,'Age','SubplotRowsYVars',{'AvgWeight' 'AvgHeight'},'LineTypeCodeVar','Gender','SubplotColsCodeVar','Nationality');

%% Make another version of the previous graph but improve the labelling.
figure;  PlotTbl(AHWDat,'Age', ...
    'SubplotRowsYVars',{'AvgWeight' 'AvgHeight'}, ...
    'SubplotRowsLegend',{'' ''}, ...  % Set the "legend" labels to empty for these two variables.
    'LineTypeCodeVar','Gender', ...
    'LineTypeLegend',{'Male' 'Female'}, ... % Set the "legend" labels for the two values of Gender.
    'SubplotColsCodeVar','Nationality', ...
    'SubplotColsLegend',{'Germany' 'France' 'Spain'});

%% Further improve the previous graph (IMHO) by getting rid of redundant
%  axis labels and legends
figure;  PlotTbl(AHWDat,'Age', ...
    'SubplotRowsYVars',{'AvgWeight' 'AvgHeight'}, ...
    'SubplotRowsLegend',{'' ''}, ...  % Set the "legend" labels to empty for these two variables.
    'LineTypeCodeVar','Gender', ...
    'LineTypeLegend',{'Male' 'Female'}, ... % Set the "legend" labels for the two values of Gender.
    'SubplotColsCodeVar','Nationality', ...
    'SubplotColsLegend',{'Germany' 'France' 'Spain'}, ...
    'XLabel',[4 5 6], ...  % Just put X axis labels on these subplots (as MATLAB numbers them).
    'YLabel',[1 4], ...  % Just put Y axis labels on these subplots (as MATLAB numbers them).
    'Legend',[1]);  % I guess one legend is enough, but you could list several here if you wanted them.

%% Now make separate plots for AvgWeight and AvgHeight, but put all six combinations
% of nationality and gender on each plot.  The only change is to associate nationality
% with Color rather than SubplotCols
figure;  PlotTbl(AHWDat,'Age', ...
    'SubplotRowsYVars',{'AvgWeight' 'AvgHeight'}, ...
    'SubplotRowsLegend',{'' ''}, ...  % Set the "legend" labels to empty for these two variables.
    'MarkerTypeCodeVar','Gender', ...
    'MarkerTypeLegend',{'Male' 'Female'}, ... % Set the "legend" labels for the two values of Gender.
    'ColorCodeVar','Nationality', ...
    'ColorLegend',{'Germany' 'France' 'Spain'}, ...
    'XLabel',[2], ...  % Just put X axis labels on these subplots (as MATLAB numbers them).
    'Legend',[1]);  % I guess one legend is enough, but you could list several here if you wanted them.

%% Make a 3x3 set of subplots depicting the pairwise relationships between AvgWeight, AvgHeight, and Age
% (somewhat analogous to a correlation matrix).  Each subplot has 36 points corresponding
% to the 36 combinations of 6 age x 3 nationality x 2 gender.
% Just plot the points--no lines.
figure('Position',[50 50 1000 700]);  PlotTbl(AHWDat, ...
    'SubplotColsXVars',{'AvgWeight' 'AvgHeight' 'Age'}, ...
    'SubplotRowsYVars',{'AvgWeight' 'AvgHeight' 'Age'}, ...
    'SubplotCoLsLegend',{'' '' ''}, ...  % Set the "legend" labels to empty.
    'SubplotRowsLegend',{'' '' ''}, ...  % Set the "legend" labels to empty.
    'MarkerTypeCodeVar','Gender', ...
    'MarkerTypeLegend',{'Male' 'Female'}, ...
    'ColorCodeVar','Nationality', ...
    'ColorLegend',{'Germany' 'France' 'Spain'}, ...
    'XLabel',7:9, ...  % Just label the X axis along the bottom row of subplots
    'YLabel',[1 4 7], ...  % Just label the Y axis along the left edge of subplots
    'LineTypeSpecs',' ', ...   % Don't use any lines, just plot points like scatter
    'MarkerSizeSpecs',7,...  % Increase marker size so it is easier to tell squares from circles
    'Legend',1, ...
    'LegendPos',[0.10 0.85 0.20 0.10] ...  % Fuss around with the position of the legend because it is so big
    );

%% Elaborate the previous example using XLabelStr & YLabelStr
figure('Position',[50 50 1000 700]);  PlotTbl(AHWDat, ...
    'SubplotColsXVars',{'AvgWeight' 'AvgHeight' 'Age'}, ...
    'SubplotRowsYVars',{'AvgWeight' 'AvgHeight' 'Age'}, ...
    'SubplotCoLsLegend',{'' '' ''}, ...  % Set the "legend" labels to empty.
    'SubplotRowsLegend',{'' '' ''}, ...  % Set the "legend" labels to empty.
    'MarkerTypeCodeVar','Gender', ...
    'MarkerTypeLegend',{'Male' 'Female'}, ...
    'ColorCodeVar','Nationality', ...
    'ColorLegend',{'Germany' 'France' 'Spain'}, ...
    'XLabel',7:9, ...  % Just label the X axis along the bottom row of subplots
    'YLabel',[1 4 7], ...  % Just label the Y axis along the left edge of subplots
    'LineTypeSpecs',' ', ...   % Don't use any lines, just plot points like scatter
    'XLabelStr',{'' '' '' '' '' '' 'Weight' 'Height' 'Age'},...
    'YLabelStr',{'Weight' '' '' 'Height' '' '' 'Age' '' ''},...
    'MarkerSizeSpecs',7,...  % Increase marker size so it is easier to tell squares from circles
    'Legend',1, ...
    'LegendPos',[0.10 0.85 0.20 0.10] ...  % Fuss around with the position of the legend because it is so big
    );


%% Example of plotting part of the data (i.e., females).

PlotTbl(AHWDat(AHWDat.Gender==2,:),'Age','AvgWeight','LineTypeCodeVar','Nationality');


%% Example of calling SubplotTbl separately for each subplot, to get more control.
figure;
MaleDat = AHWDat(AHWDat.Gender==1,:);
subplot(1,2,1);
SubplotTbl(MaleDat,'Age','AvgWeight','ColorCodeVar','Nationality', ...
    'ColorLegend',{'Germany' 'France' 'Spain'});
axis([0 20 50 100]);
title('Weights of Males');
FemaleDat = AHWDat(AHWDat.Gender==2,:);
subplot(1,2,2);
SubplotTbl(FemaleDat,'Age','AvgHeight','LineWidthCodeVar','Nationality', ...
    'LineWidthLegend',{'Germany' 'France' 'Spain'});
axis([0 20 110 160]);
title('Heights of Females');


