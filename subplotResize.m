function SP = subplotResize(SP,Stretch,varargin)
    % This function resizes and optionally moves MATLAB's subplots from their default positions.
    % SP is a single subplot handle or a cell array of subplot handles.
    % Stretch is a vector of 2 numbers giving the scaling factors on the horizontal & vertical dimensions, respectively.
    % For example, Stretch = [1.1, 1.2] would make the subplot 10% wider and 20% taller
    % varargin is an optional 2-number vector giving horizontal and vertical position offsets for moving
    %  the lower left corner of the subplot. For example, passing Offset = [0.1 -0.2] as the varargin
    %  would move the lower left corner of the stretched subplot 0.1 units to the right and 0.2 units down
    %
    % Here are examples of how to use this function:
    %
    % 1. Enlarge subplot leaving the lower left corner in place:
    %   hsp1 = subplot(2,2,1);   % get a handle for the subplot with MATLAB's regular command.
    %   hsp1 = subplotResize(hsp1,[1.1 1.2]);  % make the subplot 1.1 times wider and 1.2 times taller.
    %   plot(x,y);  % use any of the normal plot commands, set axis limits, legends, etc
    %
    % 2. Enlarge subplot and move its lower left corner:
    %   hsp1 = subplot(2,2,1);   % get a handle for the subplot with MATLAB's regular command.
    %   hsp1 = subplotResize(hsp1,[1.1 1.2],[0.1 -0.2]);  % make the subplot 1.1 times wider and 1.2 times taller.
    %                                                     % also move the lower left corner of the resized subplot
    %                                                     % 0.1 units to the right and 0.2 units down
    %   plot(x,y);  % use any of the normal plot commands, set axis limits, legends, etc
    %
    % 3. Example using PlotTbl:
    %       subplothandles = PlotTbl(tbl,'X','Y', ...
    %       subplothandles = subplotResize(subplothandles,Stretch,Shift);
    %
    % NOTE: If SP is a cell array with just one cell, this function does nothing.
    %  This is so you can call it with all PlotTbl outputs regardless of how many subplots.
    cellInput = iscell(SP);  % Find out if input was a cell so we can return the same type of output.
    if cellInput
        [nRows, nCols] = size(SP);
        if nRows*nCols == 1
            return;
        end
    else
        SP = {SP};
        nRows = 1;
        nCols = 1;
    end
    horizStretch = Stretch(1);
    if numel(Stretch)>1
        vertStretch = Stretch(2);
    else
        vertStretch = horizStretch;
    end
    if numel(varargin)>0
        horizShift = varargin{1}(1);
        vertShift = varargin{1}(2);
    else
        horizShift = 0;
        vertShift = 0;
    end
    for iRow = 1:nRows
        for iCol = 1:nCols
            oldPosition = SP{iRow,iCol}.Position;
            oldX = oldPosition(1);
            oldY = oldPosition(2);
            oldWid = oldPosition(3);
            oldHt = oldPosition(4);
            newHt = oldHt * vertStretch;
            newWid = oldWid * horizStretch;
            newX = oldX + horizShift;
            if ( (nRows==1) || (iRow<nRows) )
                newY = oldY;
            else
                newY = oldY + vertShift;  % Do not shift 1st row of several
            end
            SP{iRow,iCol}.Position = [newX newY newWid newHt];
        end
    end
    if ~cellInput
        SP = SP{1};
    end
end
