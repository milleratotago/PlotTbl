function [] = SubplotTbl(Tbl,varargin)
% Create a plot or subplot using the data in Tbl.
% This version: most arguments handled as (key,val) pairs but left-over (often specified first) 1 or 2 parms are taken as sX, sY
% sX is the variable name of the data used on the X axis,
% sY is the variable name of the data used on the Y axis.
% Additional varargin's are control parameters specifying which variables determine line type, marker type, etc.

% ptMultiExtract gets features of individual lines, including variables that determine line characteristics.

LineTypeDefault = {'-','--',':','-.'};
[LineType, varargin] = ptMultiExtract(Tbl,'LineType',LineTypeDefault,varargin);

MarkerTypeDefault = 'sod^v+x*.><ph';
[MarkerType, varargin] = ptMultiExtract(Tbl,'MarkerType',MarkerTypeDefault,varargin);

ColorDefault = 'krgbcmyw';  % blacK, Red, Green, Blue, Cyan, Magenta, Yellow, White
[Color, varargin] = ptMultiExtract(Tbl,'Color',ColorDefault,varargin);

LineWidthDefault = [1.4 1.8 2.4];
[LineWidth, varargin] = ptMultiExtract(Tbl,'LineWidth',LineWidthDefault,varargin);

MarkerSizeDefault = [6 3 9];
[MarkerSize, varargin] = ptMultiExtract(Tbl,'MarkerSize',MarkerSizeDefault,varargin);


% Axis labelling controls:
[tfXlabel, varargin] = ExtractNameVali('XLabel',true,varargin);
[ sXlabel, varargin] = ExtractNameVali('XLabelStr','',varargin);
[tfYlabel, varargin] = ExtractNameVali('YLabel',true,varargin);
[ sYlabel, varargin] = ExtractNameVali('YLabelStr','',varargin);

% Legend controls:
[ tfLegend, varargin] = ExtractNameVali('Legend',true,varargin);  % Show legend?
[LegendLoc, varargin] = ExtractNameVali('LegendLoc','Best',varargin);
[LegendPos, varargin] = ExtractNameVali('LegendPos',[],varargin);
[LegendBox, varargin] = ExtractNameVali('LegendBox','boxoff',varargin);

BasesX = '';
BasesY = '';
% if there are any left-over arguments at this point, they should be variable names sX and/or sY
if numel(varargin)==2
    BasesX = varargin{1};
    BasesY = varargin{2};
    varargin = {};
elseif numel(varargin)==1
    % This is the ugly case because I have to figure out whether sX or sY is the one
    % not specified by LT, MT, etc.
    sXSpecified = (numel(LineType.XVars)>0) | (numel(MarkerType.XVars)>0) ...
        | (numel(Color.XVars)>0) | (numel(LineWidth.XVars)>0) | (numel(MarkerSize.XVars)>0);
    sYSpecified = (numel(LineType.YVars)>0) | (numel(MarkerType.YVars)>0) ...
        | (numel(Color.YVars)>0) | (numel(LineWidth.YVars)>0) | (numel(MarkerSize.YVars)>0);
    if sXSpecified && (~sYSpecified)
        BasesX = '';
        BasesY = varargin{1};
        varargin = {};
    elseif (~sXSpecified) && sYSpecified
        BasesX = varargin{1};
        BasesY = '';
        varargin = {};
    end
end

% Halt if there are any unprocessed input arguments:
if numel(varargin)>0
    disp('These arguments could not be processed:');
    for i=1:numel(varargin)
        disp(varargin{i});
    end
    assert(false,'Must halt');
end
%assert(numel(varargin)==0,['Unprocessed arguments: ' strjoin(varargin)]);

if numel(sXlabel) == 0
    sXlabel = [BasesX LineType.XLabelList MarkerType.XLabelList Color.XLabelList LineWidth.XLabelList MarkerSize.XLabelList];
end
if numel(sYlabel) == 0
    sYlabel = [BasesY LineType.YLabelList MarkerType.YLabelList Color.YLabelList LineWidth.YLabelList MarkerSize.YLabelList];
end

hold on;
iLineCtr = 0;
% iLT, iMT, iC, iLW, iMS index by LineType, MarkerType, Color, LineWidth, MarkerSize, respectively
for iLT=1:LineType.NValues
    [Tbl4LT, Lgd4LT, LTsX, LTsY] = ptDescriptorInvoke(Tbl,LineType,iLT);
for iMT=1:MarkerType.NValues
    [Tbl4MT, Lgd4MT, MTsX, MTsY] = ptDescriptorInvoke(Tbl4LT,MarkerType,iMT);
for iC=1:Color.NValues
    [Tbl4C, Lgd4C, CsX, CsY] = ptDescriptorInvoke(Tbl4MT,Color,iC);
for iLW=1:LineWidth.NValues
    [Tbl4LW, Lgd4LW, LWsX, LWsY] = ptDescriptorInvoke(Tbl4C,LineWidth,iLW);
for iMS=1:MarkerSize.NValues
    [Tbl4MS, Lgd4MS, MSsX, MSsY] = ptDescriptorInvoke(Tbl4LW,MarkerSize,iMS);
iLineCtr = iLineCtr + 1;
thissX = [BasesX LTsX MTsX CsX LWsX MSsX];
thissY = [BasesY LTsY MTsY CsY LWsY MSsY];
Tbl = sortrows(Tbl,thissX);
thisx = Tbl4MS.(thissX);
thisy = Tbl4MS.(thissY);
thislegendstr = [Lgd4LT Lgd4MT Lgd4C Lgd4LW Lgd4MS];
plot(thisx,thisy,[LineType.Specs{iLT} MarkerType.Specs(iMT) Color.Specs(iC)], ...
  'LineWidth',LineWidth.Specs(iLW),'MarkerSize',MarkerSize.Specs(iMS),'DisplayName',thislegendstr(3:end));  % 3:end drops initial ', '
end % iMS
end % iLW
end % iC
end % iMT
end % iLT
if tfXlabel
    xlabel(sXlabel);
end
if tfYlabel
    ylabel(sYlabel);
end
if tfLegend && (numel(thislegendstr)>0)
    hl=legend('show');
    if numel(LegendPos)==4
        legend(hl.String,'Position',LegendPos);
    else
        legend('Location',LegendLoc);  % Does not work properly if boxoff first
    end
    legend(LegendBox);
end

end
