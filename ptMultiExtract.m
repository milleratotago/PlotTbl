function [Descriptor, ArgList] = ptMultiExtract(Tbl,sSet,DefaultSpecs,ArgList)
    % sSet is a string (e.g., 'SubplotRows') or a cell array of possible synonyms for that string.
    sSet = EnsureCell(sSet);
    DefaultOrder = 'stable';
    for iSet=1:numel(sSet)
        s = sSet{iSet};
        % Try all synonyms in sSet and take the last one found.
        if (iSet==1) || (numel(Descriptor.CodeVar)==0)
            [Descriptor.CodeVar, ArgList] = ExtractNameVali({[s 'CodeVar'] s},'',ArgList);   % Used for partitioning data set
        end
        if (iSet==1) || (numel(Descriptor.XVars)==0)
            [Descriptor.XVars,ArgList] = ExtractNameVali({[s 'XVars'] [s 'XVar'] [s 'X']},{},ArgList);  % Cell array of variable names, used for  ...
        end
        if (iSet==1) || (numel(Descriptor.YVars)==0)
            [Descriptor.YVars,ArgList] = ExtractNameVali({[s 'YVars'] [s 'YVar'] [s 'Y']},{},ArgList);  % selecting variables to be plotted on X/Y axis
        end
        if (iSet==1) || (numel(Descriptor.XYVars)==0)
            [Descriptor.XYVars,ArgList] = ExtractNameVali({[s 'XYVars'] [s 'XY']},{},ArgList);  % selecting variables to be plotted on X/Y axis
        end
        if (iSet==1) || strcmp(Descriptor.Specs,DefaultSpecs)
            [Descriptor.Specs, ArgList] = ExtractNameVali([s 'Specs'],DefaultSpecs,ArgList);
        end
        if (iSet==1) || strcmp(Descriptor.Order,DefaultOrder)
            [Descriptor.Order, ArgList] = ExtractNameVali([s 'Order'],DefaultOrder,ArgList);
        end
    end
    if iscell(DefaultSpecs)
        Descriptor.Specs = EnsureCell(Descriptor.Specs);
    end
    [Descriptor.LegendStrs, ArgList] = ExtractNameVali([s 'Legend'],{},ArgList);
    Descriptor.XLabelList = '';
    Descriptor.YLabelList = '';
    if numel(Descriptor.CodeVar)>0
        Descriptor.Values = unique(Tbl.(Descriptor.CodeVar),Descriptor.Order);
        Descriptor.NValues = numel(Descriptor.Values);
    elseif numel(Descriptor.XVars)>0
        Descriptor.NValues = numel(Descriptor.XVars);
        Descriptor.XLabelList = Descriptor.XVars{1};
        for i=2:numel(Descriptor.XVars)
            Descriptor.XLabelList = [Descriptor.XLabelList '/' Descriptor.XVars{i}];
        end
    elseif numel(Descriptor.YVars)>0
        Descriptor.NValues = numel(Descriptor.YVars);
        Descriptor.YLabelList = Descriptor.YVars{1};
        for i=2:numel(Descriptor.YVars)
            Descriptor.YLabelList = [Descriptor.YLabelList '/' Descriptor.YVars{i}];
        end
    elseif numel(Descriptor.XYVars)>0
        Descriptor.NValues = numel(Descriptor.XYVars)/2;
        Descriptor.XLabelList = Descriptor.XYVars{1,1};
        Descriptor.YLabelList = Descriptor.XYVars{1,2};
        for i=2:numel(Descriptor.YVars)
            Descriptor.XLabelList = [Descriptor.XLabelList '/' Descriptor.XVars{i,1}];
            Descriptor.YLabelList = [Descriptor.YLabelList '/' Descriptor.YVars{i,2}];
        end
    else
        Descriptor.NValues = 1;
    end
    
    NSpecs = length(Descriptor.Specs);
    assert(Descriptor.NValues<=NSpecs,['Error: ' s ' has ' num2str(Descriptor.NValues) ' values but there are only ' num2str(NSpecs) ' specifications.']);
    
end

