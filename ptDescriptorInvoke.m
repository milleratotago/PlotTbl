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
    if numel(Descriptor.XYVars)>0
        assert(numel(sX)==0,'You are not allowed to specify both XVars and XYVars.');
        assert(numel(sY)==0,'You are not allowed to specify both YVars and XYVars.');
        sX = Descriptor.XYVars{idx,1};
        sY = Descriptor.XYVars{idx,2};
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

