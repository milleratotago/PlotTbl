classdef ErrorBarManager < handle
    % A class to manage the process of putting error bars on graphs within PlotTbl.
    % The general idea is to make an ErrorBarManager object for each call to PlotTbl.
    %
    % Here is a skeleton illustrating its use:
    % ErrBars = ErrorBarManager(Rows,Cols,Lines,Points,Directions,Lengths);
    % MyErrorBarFn = @ErrBars.DrawBars;
    % PlotTbl(...,'Customize',{MyErrorBarFn});
    % 
    % The 5 parameters used to create an ErrorBarManager are equal-length vectors,
    % and their length is the total number of error bars that you want PlotTbl to add,
    % summing across all panels.  (Some panels can have 0 error bars, others lots--there
    % is no constraint on that.)  Here is an illustration with vectors of length 5
    % (i.e., that will produce 5 error bars):
    %
    %  Rows    Cols    Lines   Points  Directions  Lengths
    %     1       1       1       2         1       12.643
    %     1       2       1       2        -1       17.780
    %     1       2       1       1         1       18.870
    %     2       1       1       2         1       15.768
    %     2       2       2       2         1       19.832
    %
    % Row and Col refer to the subplot panels produced by PlotTbl, so this example
    % produces 4 error bars, one each in the first 2 x 2 rows and columns.
    % Line and Point are used to indicate the data point to which the error bar
    % should be attached within the specified panel. The panel lines are numbered
    % from 1 upwards, in the order in which they are plotted.
    % Each line has a number of points, and you can attach error bars to as
    % many points as you want.
    % Direction indicates whether the error bar should extend up (1) or down (-1)
    % from the point.
    % Length is the length of the error bar in the units of the vertical axis.
    
    properties
        
        NPanelRows, NPanelCols
        NBars      % is an NPanelRows x NPanelCols array of integers indicating the number of bars in each panel.
        PanelBars  % is an NPanelRows x NPanelCols cell array , where each cell is a vector of bars for the panel.
    end
    
    methods
        
        function obj = ErrorBarManager(PanelRowNums,PanelColNums,LineNums,PointNums,Directions,Lengths)  % Constructor
            obj.LoadFromTable(PanelRowNums,PanelColNums,LineNums,PointNums,Directions,Lengths);
        end
        
        function LoadFromTable(obj,PanelRowNums,PanelColNums,LineNums,PointNums,Directions,Lengths)
            
            % Initialize structures for each panel:
            obj.NPanelRows = max(PanelRowNums);
            obj.NPanelCols = max(PanelColNums);
            obj.NBars = zeros(obj.NPanelRows,obj.NPanelCols);
            obj.PanelBars = cell(obj.NPanelRows,obj.NPanelCols);
            
            TotalNBars = numel(PanelRowNums);   % Total n of error bars across all panels.
            
            % Count the number of bars in each panel:
            for iTblRow=1:TotalNBars
                iRow = PanelRowNums(iTblRow);
                iCol = PanelColNums(iTblRow);
                obj.NBars(iRow,iCol) = obj.NBars(iRow,iCol) + 1;
            end
            
            % Create an empty ErrorBar object for each bar in each panel.
            % PanelBars cell array remains empty for panels with no bars.
            for iRow=1:obj.NPanelRows
                for iCol=1:obj.NPanelCols
                    if obj.NBars(iRow,iCol) > 0
                        obj.PanelBars{iRow,iCol}(obj.NBars(iRow,iCol),1) = ErrorBar;
                    end
                end
            end
            
            % Store the info about each bar within each panel's Bar struct:
            usedBars = zeros(obj.NPanelRows,obj.NPanelCols);  % Keep track of how many bars have already been initialized.
            for iTblRow=1:TotalNBars
                iRow = PanelRowNums(iTblRow);
                iCol = PanelColNums(iTblRow);
                usedBars(iRow,iCol) = usedBars(iRow,iCol) + 1;
                obj.PanelBars{iRow,iCol}(usedBars(iRow,iCol),1).Initialize( ...
                    LineNums(iTblRow),PointNums(iTblRow),Directions(iTblRow),Lengths(iTblRow));
            end
            
        end
        
        function DrawBars(obj,iPanelRowNum,iPanelColNum)
            try
                PanelNBars = obj.NBars(iPanelRowNum,iPanelColNum);
                for iBar = 1:PanelNBars
                    obj.PanelBars{iPanelRowNum,iPanelColNum}(iBar).Draw;
                end
            catch
                    error('Request error bar info not found.');
                % Nothing needed.
                % This try can fail if you try to draw bars for a panel
                % outside the (Row,Col) range of panels for which bars were defined.
                % That's OK--just don't draw any bars.
            end
        end
        
    end % methods
    
end

