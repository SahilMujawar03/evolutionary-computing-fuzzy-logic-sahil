function selectedIdx = RankSelection(pop)
    n = numel(pop);
    ranks = 1:n; % Assign ranks
    probabilities = ranks / sum(ranks); % Normalize
    cumulative = cumsum(probabilities);
    r = rand;
    
    selectedIdx = find(r <= cumulative, 1, 'first');
end
