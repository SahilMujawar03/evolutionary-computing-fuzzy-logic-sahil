function VisualizeSideBySide(pop, it, runID)
x = linspace(-5,5,100);
y = linspace(-5,5,100);
[X,Y] = meshgrid(x,y);
Z = arrayfun(@(x,y) RosenbrockFunction([x y]), X, Y);

% Check if figure exists, if not, create it
figName = sprintf('Run%d_SideBySide.png', runID);
if ~exist(figName, 'file')
    figure;
end

% Determine subplot index
subplotIdx = find([1, 10, 20] == it);

% Add subplot for iteration 1, 10, or 20
subplot(1,3,subplotIdx);
contourf(X,Y,Z,30);
hold on;

popPositions = reshape([pop.Position], [], 2);
X_pop = popPositions(:, 1);
Y_pop = popPositions(:, 2);

scatter(X_pop, Y_pop, 50, 'r', 'filled');
title(sprintf('Run %d | Iteration: %d', runID, it));
xlabel('X');
ylabel('Y');
hold off;

% Save the combined figure only after iteration 20
if it == 20
    saveas(gcf, figName);
    close(gcf);
end
end
