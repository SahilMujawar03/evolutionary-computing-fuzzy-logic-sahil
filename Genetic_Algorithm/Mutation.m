function mutant = Mutation(parent, method, pM, VarMin, VarMax)

    %  Mutation only applies based on probability pM
    if rand > pM
        mutant = parent;
        return;
    end

    switch method
        case "Gaussian"
            sigma = 0.1 * (VarMax - VarMin); % Scale mutation
            mutant = parent + sigma * randn(size(parent));
            
        case "NonUniform"
            beta = 0.1; % Controls mutation strength
            mutant = parent + beta * (VarMax - VarMin) .* (2 * rand(size(parent)) - 1);
            
        otherwise
            error('Unknown Mutation Method');
    end

    % Ensure mutant stays within bounds
    mutant = max(min(mutant, VarMax), VarMin);
end
