classdef clSubplots < handle
    % Represent an array of subplots on a single figure,
    %   and provide useful functions for dealing with the subplots
    %   (e.g., setting their titles, labelling the left & bottom axes).
    % See clSubplotsDemo for an illustration of how to use it.
    
    properties
        nRows, nCols  % shape of the array of subplots
        AxisHndls     % cell array(nRows, nCols) of axis handles created by subplot
    end % properties
    
    methods
        
        function obj = clSubplots(nRows,nCols)
            % Constructor initializes a cell array of nRows x nCols axis handles.
            obj.nRows = nRows;
            obj.nCols = nCols;
            obj.AxisHndls = cell(nRows,nCols);
            for iRow=1:nRows
                for iCol=1:nCols
                    iFig = obj.PanelNum(iRow,iCol);
                    obj.AxisHndls{iRow,iCol} = subplot(nRows,nCols,iFig);
                end
            end
            obj.AllHold;
        end  % clSubplots constructor
        
        function [] = Activate(obj,iRow,iCol)
            % Activate the specified subplot for subsequent plotting commands
            subplot(obj.Panel(iRow,iCol));
        end
        
        function [] = AllTitles(obj,TitleAr)
            % Set the titles of all subplots to match those in the
            % nRows x nCols array of strings TitleAr.
            for iRow=1:obj.nRows
                for iCol=1:obj.nCols
                    h = obj.Panel(iRow,iCol);
                    title(h,TitleAr{iRow,iCol});
                end
            end
        end
        
        function [] = EdgeAxisLabels(obj,xLabel,yLabel)
            % Add x-axis labels to the bottom row & y-axis to the first column.
            obj.EdgexAxisLabels(xLabel);
            obj.EdgeyAxisLabels(yLabel);
        end
        
        function [] = EdgexAxisLabels(obj,xLabel)
            % Add x-axis labels to the bottom row of subplots
            for iCol=1:obj.nCols
                xlabel(obj.Panel(obj.nRows,iCol),xLabel);
            end
        end
        
        function [] = xylimMatch(obj)
            % Set the axis limits to match across all subplots
            obj.limMatch(@xlim);
            obj.limMatch(@ylim);
        end
        
        function limMatch(obj,xyfun)
            % Equate the indicated x or y limits across all
            % of the plots/subplots (axes) in the handle array
            % e.g., limMatch(subplotHandles,@xlim)  % equate ranges of x axes
            NPanels = numel(obj.AxisHndls);
            minmax = zeros(NPanels,2);
            for iPanel=1:NPanels
                minmax(iPanel,:) = xyfun(obj.AxisHndls{iPanel});
            end
            overallmin = min(minmax(:,1));
            overallmax = max(minmax(:,2));
            for iPanel=1:NPanels
                xyfun(obj.AxisHndls{iPanel},[overallmin, overallmax]);
            end
        end
        
        function [] = EdgeyAxisLabels(obj,yLabel)
            % Add y-axis labels to the first column of subplots
            for iRow=1:obj.nRows
                ylabel(obj.Panel(iRow,1),yLabel);
            end
        end
        
        function [] = AllHold(obj)
            % Set hold on for all panels.
            for iFig=1:numel(obj.AxisHndls)
                hold(obj.AxisHndls{iFig},'on');
            end
        end
        
        function iFig = PanelNum(obj,iRow,iCol)
            % Return the subplot number iFig to be used with the command
            % to select the handle for the desired row & column subplot
            % within the command subplot(nRows,nCols,iFig);
            iFig = iCol + (iRow-1)*obj.nCols;
        end
        
        function Hndl = Panel(obj,iRow,iCol)
            % Return the handle of the subplot at iRow,iCol
            Hndl = obj.AxisHndls{iRow,iCol};
        end
        
    end % methods
    
end % clSubplots classdef
