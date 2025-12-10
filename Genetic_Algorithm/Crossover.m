function [child1, child2] = Crossover(parent1, parent2, method)

    switch method
        case "Uniform"
            mask = rand(size(parent1)) > 0.5;
            child1 = parent1 .* mask + parent2 .* (~mask);
            child2 = parent2 .* mask + parent1 .* (~mask);

        case "BLX"
            alpha = 0.1; % BLX-alpha crossover
            minParent = min(parent1, parent2);
            maxParent = max(parent1, parent2);
            range = maxParent - minParent;
            
            % Generate offspring inside an extended range
            child1 = minParent - alpha * range + (1 + 2 * alpha) .* range .* rand(size(parent1));
            child2 = minParent - alpha * range + (1 + 2 * alpha) .* range .* rand(size(parent2));
            
            % Ensure children stay within bounds
            child1 = max(min(child1, 5), -5);
            child2 = max(min(child2, 5), -5);
            
        otherwise
            error('Unknown Crossover Method');
    end
end
