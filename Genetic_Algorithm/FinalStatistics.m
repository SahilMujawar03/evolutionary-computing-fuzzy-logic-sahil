clc; clear;

% Define the results file names
resultsFile = 'results.txt'; % Input file containing all run results
finalResultsFile = 'final_results.txt'; % Output file to save final median value

% Check if results.txt exists before processing
if exist(resultsFile, 'file') == 2
    % Load the results from the file
    data = readmatrix(resultsFile);
    
    % Extract Best Cost values from the last iteration (20th iteration) of each run
    bestCosts = data(data(:,2) == 20, 3); 
    
    % Compute mean and median best cost
    meanBestCost = mean(bestCosts);
    medianBestCost = median(bestCosts);
    
    % Display results
    fprintf('======================================\n');
    fprintf('Final Statistics After 20 Runs\n');
    fprintf('======================================\n');
    fprintf('Mean Best Cost (Final Iteration): %.6f\n', meanBestCost);
    fprintf('Median Best Cost (Final Iteration): %.6f\n', medianBestCost);
    fprintf('======================================\n');

    % Save median best cost to file
    fileID = fopen(finalResultsFile, 'w');
    fprintf(fileID, 'Final Median Best Cost After 20 Runs: %.6f\n', medianBestCost);
    fclose(fileID);
    
    fprintf('Final Median Best Cost saved in "%s".\n', finalResultsFile);
else
    fprintf('Error: The results file "%s" does not exist. Please check "RunGA.m".\n', resultsFile);
end

fprintf('\n Full statistics computation completed successfully!\n');
