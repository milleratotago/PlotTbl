function PlotTbl(Tbl,varargin)
[SubplotRows, varargin] = ptMultiExtract(Tbl,'SubplotRows',1:50,varargin);  % Have many default specs so that NValues will be large for the
[SubplotCols, varargin] = ptMultiExtract(Tbl,'SubplotCols',1:50,varargin);  % assert(Descriptor.NValues<=NSpecs,... at the end of ptMultiExtract
[tfXlabel, varargin] = ExtractNameVali('XLabel',1:50,varargin);
[XLabelStr, varargin]= ExtractNameVali('XLabelStr',{},varargin);
[tfYlabel, varargin] = ExtractNameVali('YLabel',1:50,varargin);
[YLabelStr, varargin]= ExtractNameVali('YLabelStr',{},varargin);
[tfLegend, varargin] = ExtractNameVali('Legend',1:50,varargin);
%[SubplotList, varargin] = ptMultiExtract(Tbl,'SubplotList',0,varargin);
iPlot = 0;
for iRow=1:SubplotRows.NValues
    [Tbl4Rows, Lgd4Rows, PRsX, PRsY] = ptDescriptorInvoke(Tbl,SubplotRows,iRow);
    for iCol=1:SubplotCols.NValues
        [Tbl4Cols, Lgd4Cols, PCsX, PCsY] = ptDescriptorInvoke(Tbl4Rows,SubplotCols,iCol);
        iPlot = iPlot + 1;
        subplot(SubplotRows.NValues,SubplotCols.NValues,iPlot);
        varargin2 = varargin;
        if (numel(PRsX)>0) || (numel(PCsX)>0)
            varargin2 = {[PRsX PCsX] varargin{:}};  % Only one of these should be non-blank
        end
        if (numel(PRsY)>0) || (numel(PCsY)>0)
            varargin2 = {varargin2{1} [PRsY PCsY] varargin2{2:end}};  % Only one of these should be non-blank
        end
        if numel(XLabelStr)>=iPlot
            MaybeLabelStrs = {'XLabelStr' XLabelStr{iPlot}};
        else
            MaybeLabelStrs = {};
        end
        if numel(YLabelStr)>=iPlot
            MaybeLabelStrs = {MaybeLabelStrs{:} 'YLabelStr' YLabelStr{iPlot}};
        end
        SubplotTbl(Tbl4Cols,varargin2{:},'XLabel',ismember(iPlot,tfXlabel),'YLabel',ismember(iPlot,tfYlabel),'Legend',ismember(iPlot,tfLegend),MaybeLabelStrs{:});
        stitle = [Lgd4Rows Lgd4Cols];
        while ( (strfind1st(stitle,',')==1) || (strfind1st(stitle,' ')==1) )
            stitle = stitle(2:end);  % strip off leading comma/space pairs (could be several)
        end
        title(stitle);
    end
end
end

