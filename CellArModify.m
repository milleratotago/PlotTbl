function car = CellArModify(car,sProperty,Value)
    % Function to modify properties of all cells in a cell array.
    % car is the cell array to be modified.
    % sProperty is the property to be modified, most often specified by a string giving the name of the property.
    %    Sometimes the property is a few levels deep, and in that case sProperty can be a cell array of strings
    %    that will indicate the property to be changed.  For example, to change the Title.FontSize property
    %    car{:}.Title.FontSize, sProperty would be the cell array:  {'Title' 'FontSize'}
    % Value is a value or a cell array with the new value(s) to be given to the property.
    %   If Value is not a cell, that property is given to all cells.
    %   If Value has 1 cell, that property is given to all cells.
    %   If Value has numel(car) cells, the value in cell i is given to car{i}.
    % Examples:
    % hndlAr = CellArModify(hndlAr,{'XLabel' 'String'},'CDF(RT)');  % equiv to xlabel('CDF(RT)') for all panels.
    sProperty = EnsureCell(sProperty);
    Depth = numel(sProperty);
    cellValues = iscell(Value);
    if cellValues
        nnewcellValues = numel(Value);
        assert(nnewcellValues == 1 || nnewcellValues == numel(car),'Values must have one cell per handle.');
    end
    for i=1:numel(car)
        if cellValues
            if nnewcellValues == 1
                newValue = Value{1};
            else
                newValue = Value{i};
            end
        else
            newValue = Value;
        end
        switch Depth
            case 1
                car{i}.(sProperty{1}) = newValue;
            case 2
                car{i}.(sProperty{1}).(sProperty{2}) = newValue;
            case 3
                car{i}.(sProperty{1}).(sProperty{2}).(sProperty{3}) = newValue;
            case 4
                car{i}.(sProperty{1}).(sProperty{2}).(sProperty{3}).(sProperty{4}) = newValue;
            otherwise
                error('Need to implement more levels');
        end
                
    end
end