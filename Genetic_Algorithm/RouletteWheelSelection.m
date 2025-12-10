function selectedIdx = RouletteWheelSelection(pop)
    fitness = 1 ./ [pop.Cost]; % Convert cost to fitness
    probabilities = fitness / sum(fitness); % Normalize
    cumulative = cumsum(probabilities);
    r = rand;
    
    selectedIdx = find(r <= cumulative, 1, 'first');
end
