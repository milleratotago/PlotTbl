function hndlAr = MakeSubplotHandles(nRows,nCols)
    hndlAr = cell(nRows,nCols);
    iFig = 0;
    % With this arrangement of rows & cols
    % hndlAr{1:nRows*nCols} corresponds to the
    % order in which MATLAB arranges the subplots
    % (e.g., iFig=2 is 1st row, 2nd column);
    for iCol=1:nCols
        for iRow=1:nRows
            iFig = iFig + 1;
            hndlAr{iRow,iCol} = subplot(nRows,nCols,iFig);
            hold on
        end
    end
end
