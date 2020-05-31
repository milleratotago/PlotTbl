function PanelLbl(xCoord,yCoord,sLabel,varargin)
    % Write the string sLabel at location (xCoord,yCoord),
    % where the coordinates are specified 0-1, 0-1
    % as proportions of the distance from the bottom
    % to the top of the axis limits.
    % Adjust size with varargin = 'Fontsize',12
    text(xCoord,yCoord,sLabel,'Units','normalized',varargin{:});
%   return
%   xlims = xlim;
%   xdist = xlims(2) - xlims(1);
%   xloc = xlims(1) + xdist*xCoord;
%   ylims = ylim
%   ydist = ylims(2) - ylims(1);
%   yloc = ylims(1) + ydist*yCoord
%   text(xloc,yloc,sLabel,varargin{:});
end
