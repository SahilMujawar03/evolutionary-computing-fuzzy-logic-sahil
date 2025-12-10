function selectedIdx = TournamentSelection(pop)
    k = 3; % Tournament size
    selected = randperm(numel(pop), k);
    [~, bestIdx] = min([pop(selected).Cost]); % Best based on cost
    selectedIdx = selected(bestIdx);
end
