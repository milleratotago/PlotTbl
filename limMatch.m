function limMatch(hndlAr,xyfun)
    % Equate the indicated x or y limits across all
    % of the plots/subplots (axes) in the handle array
    % e.g., limMatch(subplotHandles,@xlim)  % equate ranges of x axes
    NPanels = numel(hndlAr);
    minmax = zeros(NPanels,2);
    for iPanel=1:NPanels
        minmax(iPanel,:) = xyfun(hndlAr{iPanel});
    end
    overallmin = min(minmax(:,1));
    overallmax = max(minmax(:,2));
    for iPanel=1:NPanels
        xyfun(hndlAr{iPanel},[overallmin, overallmax]);
    end
end
