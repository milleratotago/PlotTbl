function [subplothandles, titles] = PlotTbl(Tbl,varargin)
% Produce a plot from the data in Tbl, possibly consisting of subplots,
% as requested by the name-value parameters in varargin.
% Output the handles of the subplots and their titles.

% The shape of subplothandles is determined by the number of SubplotRows & SubplotCols
% even if SubplotReshape is used.

[SubplotRows, varargin] = ptMultiExtract(Tbl,'SubplotRows',1:50,varargin);  % Have many default specs so that NValues will be large for the
[SubplotCols, varargin] = ptMultiExtract(Tbl,'SubplotCols',1:50,varargin);  % assert(Descriptor.NValues<=NSpecs,... at the end of ptMultiExtract
[Reshape, varargin] = ExtractNameVali('SubplotReshape',[],varargin);
[tfXlabel, varargin] = ExtractNameVali('XLabel',1:50,varargin);
[XLabelStr, varargin]= ExtractNameVali('XLabelStr',{},varargin);
[tfYlabel, varargin] = ExtractNameVali('YLabel',1:50,varargin);
[YLabelStr, varargin]= ExtractNameVali('YLabelStr',{},varargin);
[tfLegend, varargin] = ExtractNameVali('Legend',1,varargin);   % Legend only on first plot, by default.
[CustomizeFn, varargin] = ExtractNameVali({'Custom','Customize','CustomFn'},0,varargin);   % A function to call after each subplot.
[PassThruParms, varargin] = ExtractNameVali('PassThru',{},varargin);

if numel(Reshape)==2
   SubplotNRows = Reshape(1);
   SubplotNCols = Reshape(2);
else
   SubplotNRows = SubplotRows.NValues;
   SubplotNCols = SubplotCols.NValues;
end

DoCustomize = isa(CustomizeFn,'function_handle');

subplothandles = cell(SubplotRows.NValues,SubplotCols.NValues);
titles = cell(SubplotRows.NValues,SubplotCols.NValues);
iPlot = 0;
for iRow=1:SubplotRows.NValues
    [Tbl4Rows, Lgd4Rows, PRsX, PRsY] = ptDescriptorInvoke(Tbl,SubplotRows,iRow);
    for iCol=1:SubplotCols.NValues
        [Tbl4Cols, Lgd4Cols, PCsX, PCsY] = ptDescriptorInvoke(Tbl4Rows,SubplotCols,iCol);
        iPlot = iPlot + 1;
        subplothandles{iRow,iCol} = subplot(SubplotNRows,SubplotNCols,iPlot);
        varargin2 = varargin;

        % Prepend names of X & Y variables to the argument list, as necessary:
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

        SubplotTbl(Tbl4Cols,PassThruParms,varargin2{:},'XLabel',ismember(iPlot,tfXlabel),'YLabel',ismember(iPlot,tfYlabel), ...
          'Legend',ismember(iPlot,tfLegend),MaybeLabelStrs{:});
        if DoCustomize
            CustomizeFn(iRow,iCol);
        end

        stitle = [Lgd4Rows Lgd4Cols];
        while ( (strfind1st(stitle,',')==1) || (strfind1st(stitle,' ')==1) )
            stitle = stitle(2:end);  % strip off leading comma/space pairs (could be several)
        end
        titles{iRow,iCol} = title(stitle);
    end
end
end

