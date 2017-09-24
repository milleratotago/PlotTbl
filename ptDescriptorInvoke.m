function [OutTbl, Lgd, sX, sY] = ptDescriptorInvoke(InTbl,Descriptor,idx)
    if numel(Descriptor.CodeVar)>0
       OutTbl = InTbl(InTbl.(Descriptor.CodeVar)==Descriptor.Values(idx),:);
    else
       OutTbl = InTbl;
    end
    if numel(Descriptor.XVars)>0
        sX = Descriptor.XVars{idx};
    else
        sX = '';
    end
    if numel(Descriptor.YVars)>0
        sY = Descriptor.YVars{idx};
    else
        sY = '';
    end
    Lgd = '';
    if Descriptor.NValues>1
        if numel(Descriptor.LegendStrs)>0
            Lgd = [', ' Descriptor.LegendStrs{idx}];
        else
            if numel(Descriptor.CodeVar)>0
                Lgd = [', ' Descriptor.CodeVar '=' num2str(Descriptor.Values(idx))];
            elseif numel(Descriptor.XVars)>0
                Lgd = [', ' Descriptor.XVars{idx}];
            elseif numel(Descriptor.YVars)>0
                Lgd = [', ' Descriptor.YVars{idx}];
            end
        end
    end
end

