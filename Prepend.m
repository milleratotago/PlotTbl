function titles = Prepend(PanelLabels,titles,varargin)
% Change the figure panel titles to start with A:, B:, ...
% varargin is used to change the ': ' that normally follows PanelLabels(i)
    if numel(varargin)>0
       followstr = varargin{1};
    else
       followstr = ': ';
    end
    [nrows,ncols] = size(titles);
    ictr = 0;
    for irow=1:nrows
        for icol=1:ncols
            ictr = ictr + 1;
            titles{irow,icol}.String = [PanelLabels(ictr) followstr titles{irow,icol}.String];
        end
    end
end  % Prepend
