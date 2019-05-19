function Legends = LegendSet(symb, vals, varargin)
% Return a cell array with one string for each of the numerical values in vals.
% symb is a string with the name of the values.
% If NumFirst is not specified, then each string has the form 'symb=v', where v is one of the numbers in vals.
% If NumFirst is specified, then each string has the form 'v symb', where v is one of the numbers in vals.
% If Latex is specified and NumFirst is not, the equals sign and number are inserted before the final $ if there is one.

[WantLatex, varargin] = ExtractNamei('Latex',varargin);
[NumFirst, varargin] = ExtractNamei('NumFirst',varargin);

EnsureEmpty(varargin); % Halt if there are any unprocessed input arguments:

Legends = cell(size(vals));

for iLeg=1:numel(vals)
    if NumFirst
        Legends{iLeg} = [num2str(vals(iLeg)) ' ' symb];
    else
        if WantLatex && (symb(end) == '$')
            Legends{iLeg} = [symb(1:end-1) '=' num2str(vals(iLeg)) '$'];
        else
            Legends{iLeg} = [symb '=' num2str(vals(iLeg))];
        end
    end
end

end
