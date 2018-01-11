function Legends = LegendSet(symb, vals)
% Return a cell array with one string for each of the numerical values in vals.
% symb is a string with the name of the values.
% Each string has the form 'symb=v', where v is one of the numbers in vals.

Legends = cell(size(vals));

for iLeg=1:numel(vals)
    Legends{iLeg} = [symb '=' num2str(vals(iLeg))];
end

end
