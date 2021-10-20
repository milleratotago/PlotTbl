function [nRows, nCols] = nConds2nRowsnCols(nConds)
    % Choose the number of rows and columns to use when plotting nConds conditions.
    switch nConds
        case 1
            nRows = 1;
            nCols = 1;
        case 2
            nRows = 2;
            nCols = 1;
        case 3
            nRows = 3;
            nCols = 1;
        case 4
            nRows = 2;
            nCols = 2;
        case 5
            nRows = 3;
            nCols = 2;
        case 6
            nRows = 3;
            nCols = 2;
        case 7
            nRows = 4;
            nCols = 2;
        case 8
            nRows = 4;
            nCols = 2;
        case 9
            nRows = 3;
            nCols = 3;
        case 10
            nRows = 5;
            nCols = 2;
        case 11
            nRows = 4;
            nCols = 3;
        case 12
            nRows = 4;
            nCols = 3;
        otherwise
    end
end

