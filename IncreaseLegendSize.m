function [ ] = IncreaseLegendSize(varargin)    
    % Make larger legend text & longer legend lines (& info on these in PlotTbl docs)
    if numel(varargin)==1
       newSize = varargin{1};
    else
       newSize = 12;
    end
    subploths = get(gcf,'children');  % get handles of subplots
    for i=1:numel(subploths)
        subploths(i).FontSize = newSize;
    end
    % subploths(1) is axes, 2 is legends
    % subploths(2).Position(3) = 2*subploths(2).Position(3);  % Position(1) starting X, 2 starting Y, 3 X width but does not affect line length
    
end

