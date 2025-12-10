function RunGA(runID, resultsFile, mode, pC_value)
    clc; close all;  

    %% === PARAMETER DEFINITION === %%
    nVar = 2; % Number of Decision Variables (Rosenbrock requires n=2)
    VarMin = -5;  % Lower Bound
    VarMax = 5;   % Upper Bound

    MaxIt = 20;  % Maximum Iterations
    nPop = 500;  % Population Size

    pC = 0.95;  % Increased Crossover Probability
    pM = 0.05;  % Reduced Mutation Probability

    SelectionMethod = "Tournament";  % Options: "Roulette", "Tournament", "Rank"
    CrossoverMethod = "BLX";   % Options: "SinglePoint", "Uniform", "BLX"
    MutationMethod = "NonUniform"; % Options: "Gaussian", "NonUniform"

    % Check if `mode` is passed correctly
    if nargin < 3  % If `mode` is not provided, use default
        mode = "Default";
    end
    if nargin < 4  % If `pC_value` is not provided, use default
        pC_value = pC;
    end

    % Adjust parameters for different performance runs
    if strcmp(mode, "ParameterChange")
        pC = pC_value; 
    elseif strcmp(mode, "NewOperator")
        SelectionMethod = "Tournament"; % More stable selection
        pM = 0.01;  % Lower mutation rate
    end

    %% === INITIAL POPULATION === %%
    empty_individual.Position = [];
    empty_individual.Cost = [];
    pop = repmat(empty_individual, nPop, 1);

    for i = 1:nPop
        if strcmp(CrossoverMethod, "BLX")  
            pop(i).Position = (VarMin + VarMax) / 2 + 0.2 * randn(1, nVar);
        else
            pop(i).Position = unifrnd(VarMin, VarMax, 1, nVar);
        end
        pop(i).Cost = RosenbrockFunction(pop(i).Position);  % Ensure function is called properly
    end

    pop = SortPopulation(pop); % Sort Population

    %% === MAIN LOOP === %%
    BestCost = zeros(MaxIt, 1);
    figure;
    for it = 1:MaxIt
        newpop = pop;

        % Selection & Crossover
        for k = 1:2:nPop
            parent1 = SelectionFunction(pop, SelectionMethod);
            parent2 = SelectionFunction(pop, SelectionMethod);
            
            [child1, child2] = Crossover(parent1.Position, parent2.Position, CrossoverMethod);
            
            newpop(k).Position = child1;
            newpop(k+1).Position = child2;
        end

        % Mutation
        for k = 1:nPop
            newpop(k).Position = Mutation(newpop(k).Position, MutationMethod, pM, VarMin, VarMax);
            newpop(k).Cost = RosenbrockFunction(newpop(k).Position);  % Ensure function is called properly
        end

        pop = SortPopulation(newpop); % Update Population
        BestCost(it) = pop(1).Cost;

        % Print iteration number and best cost
        fprintf('Run %d | Iteration: %d - Best Cost: %.6f\n', runID, it, BestCost(it));

        % Ensure results file exists before appending
        fileID = fopen(resultsFile, 'a');
        if fileID == -1
            error('Error opening results file: %s', resultsFile);
        end
        fprintf(fileID, '%d %.6f\n', it, BestCost(it));
        fclose(fileID);

        % Visualization: Contour Plot at Start, Middle, and End
        if it == 1 || it == round(MaxIt/2) || it == MaxIt
            subplot(1,3,find([1, round(MaxIt/2), MaxIt] == it));
            VisualizeSideBySide(pop, it, runID);  
        end
    end

    %% === RESULTS === %%
    figure;
    plot(BestCost, 'LineWidth', 2);
    xlabel('Iteration');
    ylabel('Best Cost');
    title(['Convergence Curve - Run ' num2str(runID)]);
end
