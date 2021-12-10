function [hndlAr] = EdgeLabel(hndlAr,xLabel,yLabel)
    % Add X & Y axis labels to the subplots on the edge of hndlAr
    [nRows, nCols] = size(hndlAr);
    for iRow=1:nRows
         ylabel(hndlAr{iRow,1},yLabel);
    end
    for iCol=1:nCols
        xlabel(hndlAr{end,iCol},xLabel);
    end
end

