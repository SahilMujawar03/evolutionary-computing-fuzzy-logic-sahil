function ComputeFinalStatistics(resultsFile, performanceLabel)
    % Read the results file
    data = readmatrix(resultsFile);

    % Ensure the file is not empty
    if isempty(data)
        error('Error: The results file "%s" is empty or not found.', resultsFile);
    end

    % Check if data has at least 2 columns (Iteration, Best Cost)
    if size(data,2) < 2
        error('Error: Data does not have enough columns. Check your results file format.');
    end

    % Extract best cost values for iteration 20
    bestCosts = data(data(:,1) == 20, 2);  % Fixed: Use correct column index

    % Ensure bestCosts is not empty
    if isempty(bestCosts)
        error('Error: No data found for iteration 20 in file "%s".', resultsFile);
    end

    % Compute statistics
    medianCost = median(bestCosts);
    meanCost = mean(bestCosts);

    % Print results
    fprintf('%s - Median Best Cost: %.6f\n', performanceLabel, medianCost);
    fprintf('%s - Mean Best Cost: %.6f\n', performanceLabel, meanCost);

    % Save the final statistics
    fileID = fopen('final_results.txt', 'a'); % Append mode
    if fileID == -1
        error('Error: Cannot open "final_results.txt" for writing.');
    end
    fprintf(fileID, '%s - Median Best Cost: %.6f\n', performanceLabel, medianCost);
    fprintf(fileID, '%s - Mean Best Cost: %.6f\n', performanceLabel, meanCost);
    fclose(fileID);
end
