function a = figDefaults
    % Set some MATLAB defaults to make nice figures, and return
    % a structure with some settings that I like (see end).

% Example of use:
% a = figDefaults;
% f1 = figure('Position',a.TwoByTwoPanelCoords);
% PlotTbl(BTCMns,BTCfigParms{:});
% IncreaseLegendSize;
% set(f1,'PaperSize',a.TwoByTwoPanelPaper);
% print(f1,'FigCDFsim2p.pdf','-dpdf','-bestfit');   % WORKS BETTER THAN SAVEAS
% saveas(f1,'BTCMns.pdf');

    set(0,'defaultlinelinewidth',2.1)
    set(0,'defaultaxeslinewidth',1)
%     set(0,'defaultpatchlinewidth',2)  % e.g., for making cross-hatched regions

    % set(groot,'defaultAxesYScale','log');  % Superceded by CustomFn
    % set(groot,'defaultAxesYScale','linear');

    % set(groot,'defaultAxesYTickLabelMode','manual') 
    % ytickformat('%4.0f')

    set(groot,'defaultfigureposition',[400 250 900 750])  % e.g. in startup.m
    set(groot,'defaultAxesTickLabelInterpreter','latex');
    set(groot,'defaultLegendInterpreter','latex');
    set(groot,'defaultTextInterpreter','latex');

a.OneByOnePanelCoords = [100 100 375 300];
a.OneByOnePanelPaper = [4 4];   % Size, in inches, of the figure plotted on paper.
a.OneByTwoPanelCoords = [100 100 750 300];
a.OneByTwoPanelPaper = [8 4];   % Size, in inches, of the figure plotted on paper.
a.OneByThreePanelCoords = [100 100 1050 400];
a.OneByThreePanelPaper = [8 4];   % Size, in inches, of the figure plotted on paper.

a.TwoByTwoPanelCoords = [100 100 750 600];
a.TwoByTwoPanelPaper = [8 8];   % Size, in inches, of the figure plotted on paper.
a.TwoByOnePanelCoords = [100 100 375 600];
a.TwoByOnePanelPaper = [4 8];   % Size, in inches, of the figure plotted on paper.

a.ThreeByThreePanelCoords = [100 100 750 800];
a.ThreeByThreePanelPaper = [8 8];   % Size, in inches, of the figure plotted on paper.

a.ThreeByTwoPanelCoords = [100 100 750 800];
a.ThreeByTwoPanelPaper = [8 8];   % Size, in inches, of the figure plotted on paper.

% Same as 2x2
a.OneByOneBigPanelCoords = [100 100 750 600];
a.OneByOneBigPanelPaper = [8 8];   % Size, in inches, of the figure plotted on paper.

end
