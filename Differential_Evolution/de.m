clc; clear;

%% Problem Definition

CostFunction = @(x) Rosenbrock(x);    % Cost Function
nVar = 20;              % Number of Decision Variables
VarSize = [1 nVar];     % Decision Variables Matrix Size
VarMin = -5;            % Lower Bound of Decision Variables
VarMax = 5;             % Upper Bound of Decision Variables

%% DE Parameters

MaxIt = 50;       % Maximum Number of Iterations
nPop = 50;          % Population Size
beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
pCR = 0.2;          % Crossover Probability

%% Run DE multiple times

numRuns = 10;          % Number of runs
allBestCosts = zeros(numRuns, MaxIt);  % Matrix to store Best Cost for each run

for run = 1:numRuns
    
    %% Initialization
    
    empty_individual.Position = [];
    empty_individual.Cost = [];
    
    BestSol.Cost = inf;
    
    pop = repmat(empty_individual, nPop, 1);
    
    for i = 1:nPop
        pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
        pop(i).Cost = CostFunction(pop(i).Position);
        
        if pop(i).Cost < BestSol.Cost
            BestSol = pop(i);
        end
    end
    
    BestCost = zeros(MaxIt, 1);
    
    %% DE Main Loop
    
    for it = 1:MaxIt
        
        for i = 1:nPop
            
            x = pop(i).Position;    % Target Vector
            
            r = randperm(nPop);     % Indices for Random Vectors
            r(r == i) = [];         % Remove indices if equal to Target Vector
            
            % Mutant Vector (Mutation)
            beta = unifrnd(beta_min, beta_max, VarSize);
            v = pop(r(1)).Position + beta .* (pop(r(2)).Position - pop(r(3)).Position);   % Uses Three Random Vectors
            v = max(v, VarMin);
            v = min(v, VarMax);
            
            % Trial Vector (Crossover between Target Vector x and Mutant Vector v)
            u = zeros(size(x));
            j0 = randi([1 numel(x)]);   % rnbr(i)
            for j = 1:numel(x)
                if j == j0 || rand <= pCR
                    u(j) = v(j);        % Trial Vector variable from Mutant Vector
                else
                    u(j) = x(j);        % Trial Vector variable from Target Vector
                end
            end
            
            NewSol.Position = u;
            NewSol.Cost = CostFunction(NewSol.Position);
            
            % Selection
            if NewSol.Cost < pop(i).Cost
                pop(i) = NewSol;
                
                if pop(i).Cost < BestSol.Cost
                   BestSol = pop(i);
                end
            end
        end
        
        % Update Best Cost
        BestCost(it) = BestSol.Cost;
        
    end
    
    % Store the best cost of the current run
    allBestCosts(run, :) = BestCost;
    
    % Display Median Best Cost of current run
    medianBestCost = median(BestCost);
    disp(['Run ' num2str(run) ': Median Best Cost = ' num2str(medianBestCost)]);
    
end

%% Overall Median Best Cost

overallMedianBestCost = median(allBestCosts(:)); % Calculate median of all runs
disp(['Overall Median Best Cost = ' num2str(overallMedianBestCost)]);

%% Show Results

% Plot median best cost for each run
semilogy(median(allBestCosts, 1), 'LineWidth', 2);
xlabel('Iteration');
ylabel('Median Best Cost');
grid on;
