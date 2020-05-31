function SP = subplotResize(SP,Stretch,varargin)
    % This function resizes and optionally moves MATLAB's subplots from their default positions.
    % SP is a single subplot handle or a cell array of subplot handles.
    % Stretch is a vector of 2 numbers giving the scaling factors on the horizontal & vertical dimensions, respectively.
    % For example, Stretch = [1.1, 1.2] would make the subplot 10% wider and 20% taller
    % varargin is an optional 2-number vector giving horizontal and vertical position offsets for moving
    %  the lower left corner of the subplot. For example, passing Offset = [0.1 -0.2] as the varargin
    %  would move the lower left corner of the stretched subplot 0.1 units to the right and 0.2 units down
    %
    % Here are 2 examples of how to use this function:
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
    SP = EnsureCell(SP);
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
    for iCell = 1:numel(SP)
        oldPosition = SP{iCell}.Position;
        oldX = oldPosition(1);
        oldY = oldPosition(2);
        oldWid = oldPosition(3);
        oldHt = oldPosition(4);
        newHt = oldHt * vertStretch;
        newWid = oldWid * horizStretch;
        newX = oldX + horizShift;
        newY = oldY + vertShift;
        SP{iCell}.Position = [newX newY newWid newHt];
    end
end
