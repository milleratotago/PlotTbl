function car = CellArModify(car,sProperty,Value)
    % Function to modify properties of all cells in a cell array.
    % car is the cell array to be modified.
    % sProperty is the property to be modified, most often specified by a string giving the name of the property.
    %    Sometimes the property is a few levels deep, and in that case sProperty can be a cell array of strings
    %    that will indicate the property to be changed.  For example, to change the Title.FontSize property
    %    car{:}.Title.FontSize, sProperty would be the cell array:  {'Title' 'FontSize'}
    % Value is the new value to be given to the property.
    sProperty = EnsureCell(sProperty);
    Depth = numel(sProperty);
    for i=1:numel(car)
        switch Depth
            case 1
                car{i}.(sProperty{1}) = Value;
            case 2
                car{i}.(sProperty{1}).(sProperty{2}) = Value;
            case 3
                car{i}.(sProperty{1}).(sProperty{2}).(sProperty{3}) = Value;
            case 4
                car{i}.(sProperty{1}).(sProperty{2}).(sProperty{3}).(sProperty{4}) = Value;
            otherwise
                error('Need to implement more levels');
        end
                
    end
end