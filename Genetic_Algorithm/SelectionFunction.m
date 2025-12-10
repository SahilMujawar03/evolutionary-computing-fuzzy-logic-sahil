function parent = SelectionFunction(pop, method)
    switch method
        case "Roulette"
            selectedIdx = RouletteWheelSelection(pop);
        case "Tournament"
            selectedIdx = TournamentSelection(pop);
        case "Rank"
            selectedIdx = RankSelection(pop);
        otherwise
            error('Unknown Selection Method');
    end
    
    % Ensure selection returns a STRUCT, not just index
    parent = pop(selectedIdx);

    % Ensure we are selecting **good individuals**
    if parent.Cost > mean([pop.Cost]) 
        % If selected individual is worse than average, reselect
        parent = pop(randi(numel(pop))); 
    end
end
