clc; clear; close all;

numRuns = 20; % Number of runs
resultsFile = 'results.txt'; % File to store results

% Delete the previous results file if it exists
if exist(resultsFile, 'file')
    delete(resultsFile);
end

% Run the Genetic Algorithm 20 times
for runID = 1:numRuns
    fprintf('Starting Run %d...\n', runID);
    
    % Call RunGA with proper arguments
    RunGA(runID, resultsFile);
    
    fprintf('Completed Run %d.\n\n', runID);
end

fprintf('All %d runs completed. Results saved in %s.\n', numRuns, resultsFile);
