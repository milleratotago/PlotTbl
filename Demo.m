% A script to demonstrate the use of PlotTbl.

% You must first install ExtractNameVal, available at https://github.com/milleratotago/ExtractNameVal
% For the very last graph, you also need EnsureCell,
%    available at https://github.com/milleratotago/Cupid/blob/master/EnsureCell.m

% % Create tables of data that can be used to illustrate various plotting capabilities.
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
%  axis labels and legends.  See the demo of CellArModify for another
%  version of this graph that provides even more control.
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
    'SubplotColsLegend',{'' '' ''}, ...  % Set the "legend" labels to empty.
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
    'SubplotColsLegend',{'' '' ''}, ...  % Set the "legend" labels to empty.
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
PassThruParms = {};  % Nothing special to pass through to plot command
subplot(1,2,1);
SubplotTbl(MaleDat,PassThruParms,'Age','AvgWeight','ColorCodeVar','Nationality', ...
    'ColorLegend',{'Germany' 'France' 'Spain'});
axis([0 20 50 100]);
title('Weights of Males');
FemaleDat = AHWDat(AHWDat.Gender==2,:);
subplot(1,2,2);
SubplotTbl(FemaleDat,PassThruParms,'Age','AvgHeight','LineWidthCodeVar','Nationality', ...
    'LineWidthLegend',{'Germany' 'France' 'Spain'});
axis([0 20 110 160]);
title('Heights of Females');

%% Plots made using some of the name-pair abbreviations:
figure; PlotTbl(AHWDat,'Age','AvgWeight','LineType','Nationality','SubPlotRows','Gender');
figure; PlotTbl(AHWDat,'Age','LineType','Nationality','SubPlotRows','Gender','SubPlotColsY',{'AvgWeight','AvgHeight'});

%% Illustration of controlling display order.
GendersReversed = [FemaleDat; MaleDat];  % Make a new data table with the genders in reverse order just so the stable and sorted orders are different.
% When these data are plotted in the default stable order, Gender=2 comes out first (because the females are at the top of the table).
% Be careful with the legends!  These must be specified in the plotting order.
figure; PlotTbl(GendersReversed,'Age','AvgWeight','LineType','Nationality','SubPlotRows','Gender','SubPlotRowsLegend',{'Female','Male'});
% When these data are plotted in the numerically sorted order, Gender=1 comes out first.
figure; PlotTbl(GendersReversed,'Age','AvgWeight','LineType','Nationality','SubPlotRows','Gender','SubPlotRowsOrder','sorted','SubPlotRowsLegend',{'Male','Female'});

%% Illustration of SubplotReshape.
% Make a separate figure for each of the six ages, but show them as 2 rows and 3 cols rather than 6 rows
figure; PlotTbl(AHWDat,'Gender','AvgWeight','LineType','Nationality','SubPlotRows','Age','SubplotReshape',[2 3]);


%% Demo of XYVars, reference lines, PassThru, CustomFn
X1 = randn(50,1);
Y1 = 1.3*X1 + randn(50,1)/5;
X2 = randn(50,1);
Y2 = 1.8*X2 + randn(50,1)/5;
Random = table(X1,Y1,X2,Y2);
%save('Random','Random');

figure('Position',[50 50 1000 450]);  PlotTbl(Random, ...
    'SubplotColsXYVars',{'X1' 'Y1'; 'X2' 'Y2'}, ...
    'LineTypeSpecs',' ', ...   % Don't use any lines, just plot points like scatter
    'MarkerSizeSpecs',7,...  % Increase marker size so it is easier to see
    'AddXRef',0,'XRefStyle','g-','AddYRef',1,'AddDiagonal' ...
    );

%% PassThru example. MATLAB's plot command recognizes the MarkerFaceColor command,
% which is not used in PlotTbl.  So, just "pass through" instructions to
% the plot command if you want to change marker face color.
figure('Position',[50 50 1000 450]);  PlotTbl(Random, ...
    'MarkerTypeXYVars',{'X1' 'Y1'; 'X2' 'Y2'}, ...
    'MarkerTypeLegend',{'X1/X2' 'Y1/Y2'}, ...
    'LineTypeSpecs',' ', ...   % Don't use any lines, just plot points like scatter
    'MarkerSizeSpecs',7,...  % Increase marker size so it is easier to see
    'AddXRef',0,'AddYRef',1,'AddDiagonal', ...
    'XLabel',[],'YLabel',[],'PassThru',{'MarkerFaceColor' 'r'} ...
    );


%% Example of using a customize function. Obviously you can do a lot more
% with non-anonymous functions (e.g., check row & col, etc).
AxLabels = @(row,col)( eval('xlabel(''X''); ylabel(''Y'');') );
% Anonymous functions can have only one command, but you can use eval to get around that.

figure('Position',[50 50 1000 450]);  PlotTbl(Random, ...
    'MarkerTypeXYVars',{'X1' 'Y1'; 'X2' 'Y2'}, ...
    'MarkerTypeLegend',{'X1/X2' 'Y1/Y2'}, ...
    'LineTypeSpecs',' ', ...   % Don't use any lines, just plot points like scatter
    'MarkerSizeSpecs',7,...  % Increase marker size so it is easier to see
    'AddXRef',0,'AddYRef',1,'AddDiagonal', ...
    'XLabel',[],'YLabel',[], 'CustomFn',AxLabels ...
    );


%% Example of modifying subplot titles:

figure('Position',[50 50 1000 450]);

[~, titles] = PlotTbl(Random, ...
    'MarkerTypeXYVars',{'X1' 'Y1'; 'X2' 'Y2'}, ...
    'MarkerTypeLegend',{'X1/X2' 'Y1/Y2'}, ...
    'LineTypeSpecs',' ', ...   % Don't use any lines, just plot points like scatter
    'MarkerSizeSpecs',7,...  % Increase marker size so it is easier to see
    'AddXRef',0,'AddYRef',1,'AddDiagonal', ...
    'XLabel',[],'YLabel',[], 'CustomFn',AxLabels ...
    );
[nrows,ncols] = size(titles);
ictr = 0;
for irow=1:nrows
    for icol=1:ncols
        ictr = ictr + 1;
        titles{irow,icol}.String = ['Panel(' num2str(irow) ',' num2str(icol) '): ' titles{irow,icol}.String];
    end
end

%% An illustration of how to specify your own RGB values for colors.
% Like an earlier example, this makes separate plots for AvgWeight and AvgHeight, but put all six combinations
% of nationality and gender on each plot.  This time associate nationality with Color and use
% any of your own preferred RGB values for each nationality. This is done by specifying a cell array
% of RGB values for ColorSpec, as shown below.  In this example, gray scale is varied.
figure;  PlotTbl(AHWDat,'Age', ...
    'SubplotRowsYVars',{'AvgWeight' 'AvgHeight'}, ...
    'SubplotRowsLegend',{'' ''}, ...  % Set the "legend" labels to empty for these two variables.
    'MarkerTypeCodeVar','Gender', ...
    'MarkerTypeLegend',{'Male' 'Female'}, ... % Set the "legend" labels for the two values of Gender.
    'ColorCodeVar','Nationality', ...
    'ColorSpecs',{[0.4 0.4 0.4], [0.6 0.6 0.6], [0.8 0.8 0.8]}, ...
    'ColorLegend',{'Germany' 'France' 'Spain'}, ...
    'XLabel',[2], ...  % Just put X axis labels on these subplots (as MATLAB numbers them).
    'Legend',[1]);  % I guess one legend is enough, but you could list several here if you wanted them.


%% Illustration of using CellArModify

figure;
% Grab the subplot handles returned by PlotTbl
sphs = PlotTbl(AHWDat,'Age', ...
    'SubplotRowsYVars',{'AvgWeight' 'AvgHeight'}, ...
    'SubplotRowsLegend',{'' ''}, ...  % Set the "legend" labels to empty for these two variables.
    'LineTypeCodeVar','Gender', ...
    'LineTypeLegend',{'Male' 'Female'}, ... % Set the "legend" labels for the two values of Gender.
    'SubplotColsCodeVar','Nationality', ...
    'SubplotColsLegend',{'Germany' 'France' 'Spain'}, ...
    'Legend',[1]);  % I guess one legend is enough, but you could list several here if you wanted them.

% Make the panels taller and wider
Stretch = [1.2 1.2];  % Expansion factors in horizontal and vertical dimensions
Shift = [0 0];  % Offsets in horizontal and vertical dimensions
sphs = subplotResize(sphs,Stretch,Shift);

% Adjust the Y axis limits and ticks, separately for rows 1 & 2
CellArModify(sphs(1,:),'YLim',[55 125]);  % Set row 1 Y limits & ticks
CellArModify(sphs(1,:),'YTick',60:20:120);
CellArModify(sphs(2,:),'YLim',[105 155]);  % Set row 2 Y limits & ticks
CellArModify(sphs(2,:),'YTick',110:10:150);

% Remove the X axis info from the top row
CellArModify(sphs(1:end-1,:),'XLabel',[]);
CellArModify(sphs(1:end-1,:),'XTickLabel',[]);

% Remove the Y axis info from the 2nd and 3rd columns:
CellArModify(sphs(:,2:end),{'YLabel' 'String'},[]);
CellArModify(sphs(:,2:end),'YTickLabel',[]);

% Move the panel titles down into the panels
[nRows, nCols] = size(sphs);
for iRow=1:nRows
    for iCol=1:nCols
        ax = sphs{iRow,iCol};
        axTitleDecrement = 0.12 * (ax.YLim(2) - ax.YLim(1));
        ax.Title.Position(2) = ax.Title.Position(2) - axTitleDecrement;
        sphs{iRow,iCol} = ax;
    end
end

% Change the title font size and revert to normal rather than boldface
CellArModify(sphs,{'Title' 'FontSize'},12);
CellArModify(sphs,{'Title' 'FontWeight'},'normal');

% Add grid lines
CellArModify(sphs,'XGrid','on');
CellArModify(sphs,'YGrid','on');
% CellArModify(sphs,'XMinorGrid','on');
% CellArModify(sphs,'YMinorGrid','on');


