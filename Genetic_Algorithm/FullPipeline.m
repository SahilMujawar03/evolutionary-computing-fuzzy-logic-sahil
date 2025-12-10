clc; clear; close all;

% Define output files
resultsFileA = 'results_A.txt'; 
resultsFileB = 'results_B.txt';
resultsFileC = 'results_C.txt';

% Ensure results files exist
fidA = fopen(resultsFileA, 'w'); fclose(fidA);
fidB = fopen(resultsFileB, 'w'); fclose(fidB);
fidC = fopen(resultsFileC, 'w'); fclose(fidC);

% Run Performance A (Baseline)
for runID = 1:20
    RunGA(runID, resultsFileA, "Default", 0.95);
end
ComputeFinalStatistics(resultsFileA, 'Performance A');

% Run Performance B (Parameter Change)
for runID = 1:20
    RunGA(runID, resultsFileB, "ParameterChange", 0.85); % Changing crossover probability
end
ComputeFinalStatistics(resultsFileB, 'Performance B');

% Run Performance C (New Operator)
for runID = 1:20
    RunGA(runID, resultsFileC, "NewOperator", 0.95);
end
ComputeFinalStatistics(resultsFileC, 'Performance C');

disp(" All runs completed successfully!");
