classdef ErrorBar < handle
    % A class for drawing a single error bar
    
    % Program note: When MATLAB adds lines to plots, the new lines are added at the
    % beginning of the LineH structure.  So, LineH(1) refers to a data line when the first
    % error bar is added, but then it refers to an error bar line when the second error bar
    % is added.  To counteract this, the line numbers are computed from the end of the LineH
    % array.
    
    properties (SetAccess=public)
        LineNum         % Number of the line to which this error bar will be attached.
        PointNum        % Number of the point on that line to which this error bar will be attached.
        Len             % Length of error bar in y-axis units
        Dir             % Direction of error bar from point (1 = up, -1 = down)
        HalfWidthAsProp % Halfwidth of horizontal bar as a proportion of x-axis range
        LineParms       % A cell array of 'k-' etc to control the error bar characteristics
    end
    
    methods
        
        function obj = ErrorBar
            obj.HalfWidthAsProp = 0.02;
            obj.LineParms = {'k-','linewidth',1.3};
        end
        
        function Initialize(obj,LineNum,PointNum,Dir,Len)
            obj.LineNum = LineNum;
            obj.PointNum = PointNum;
            obj.Len = Len;
            obj.Dir = Dir;
        end
        
        function Draw(obj)

            % Recover the x and y values of the point to which the error bar is attached:
            LineH = get(gca, 'Children');
            NLines = numel(LineH);
            myLineNo = NLines - obj.LineNum + 1;  % See note about line numbering
            xar = get(LineH(myLineNo), 'XData');
            yar = get(LineH(myLineNo), 'YData');
            thisx = xar(obj.PointNum);
            thisy = yar(obj.PointNum);

            % Plot the vertical part of the error bar:
            vertxar = [thisx thisx];
            thisyend = thisy + obj.Dir*obj.Len;
            vertyar = [thisy thisyend];
            plot(vertxar,vertyar,obj.LineParms{:});  % Vertical line

            % Find out the x-axis range to find out how wide the horizontal part of the error bar
            % is in the graph's x units.
            lim = axis;
            xrange = lim(2) - lim(1);
            xhw = xrange*obj.HalfWidthAsProp;
            horizxar = [thisx-xhw thisx+xhw];
            horizyar = [thisyend thisyend];
            plot(horizxar,horizyar,obj.LineParms{:});  % horizontal cross-bar
        end
        
    end
    
end

