clc;
clear;

% Create Fuzzy Inference System
fis = mamfis('Name', 'SportsAdviceSystem');

% Define Input Variables with Multiple Membership Functions
% 1. Athleticism (Triangular, Gaussian, Trapezoidal)
fis = addInput(fis, [0 10], 'Name', 'Athleticism');
fis = addMF(fis, 'Athleticism', 'trimf', [0 0 5], 'Name', 'Low_Triangular');
fis = addMF(fis, 'Athleticism', 'gaussmf', [1.5 5], 'Name', 'Medium_Gaussian');
fis = addMF(fis, 'Athleticism', 'trapmf', [5 7 10 10], 'Name', 'High_Trapezoidal');

% 2. Hand-Eye Coordination
fis = addInput(fis, [0 10], 'Name', 'HandEyeCoordination');
fis = addMF(fis, 'HandEyeCoordination', 'trimf', [0 0 5], 'Name', 'Poor_Triangular');
fis = addMF(fis, 'HandEyeCoordination', 'gaussmf', [1.5 5], 'Name', 'Average_Gaussian');
fis = addMF(fis, 'HandEyeCoordination', 'trapmf', [5 7 10 10], 'Name', 'Excellent_Trapezoidal');

% 3. Interest in Team Games
fis = addInput(fis, [0 10], 'Name', 'TeamInterest');
fis = addMF(fis, 'TeamInterest', 'trimf', [0 0 5], 'Name', 'NotInterested_Triangular');
fis = addMF(fis, 'TeamInterest', 'gaussmf', [1.5 5], 'Name', 'Neutral_Gaussian');
fis = addMF(fis, 'TeamInterest', 'trapmf', [5 7 10 10], 'Name', 'HighlyInterested_Trapezoidal');

% 4. Stamina
fis = addInput(fis, [0 10], 'Name', 'Stamina');
fis = addMF(fis, 'Stamina', 'trimf', [0 0 5], 'Name', 'Low_Triangular');
fis = addMF(fis, 'Stamina', 'gaussmf', [1.5 5], 'Name', 'Moderate_Gaussian');
fis = addMF(fis, 'Stamina', 'trapmf', [5 7 10 10], 'Name', 'High_Trapezoidal');

% Define Output Variable: Sport Suitability
fis = addOutput(fis, [0 10], 'Name', 'SportSuitability');
fis = addMF(fis, 'SportSuitability', 'trimf', [0 0 4], 'Name', 'NotRecommended_Triangular');
fis = addMF(fis, 'SportSuitability', 'gaussmf', [2 5], 'Name', 'Maybe_Gaussian');
fis = addMF(fis, 'SportSuitability', 'trapmf', [6 8 10 10], 'Name', 'StronglyRecommended_Trapezoidal');

% Define Rule Base
rules = [
    "Athleticism==Low_Triangular & HandEyeCoordination==Poor_Triangular & TeamInterest==NotInterested_Triangular & Stamina==Low_Triangular => SportSuitability=NotRecommended_Triangular";
    "Athleticism==Medium_Gaussian & HandEyeCoordination==Average_Gaussian & TeamInterest==Neutral_Gaussian & Stamina==Moderate_Gaussian => SportSuitability=Maybe_Gaussian";
    "Athleticism==High_Trapezoidal & HandEyeCoordination==Excellent_Trapezoidal & TeamInterest==HighlyInterested_Trapezoidal & Stamina==High_Trapezoidal => SportSuitability=StronglyRecommended_Trapezoidal";
];

fis = addRule(fis, rules);

% Show Membership Functions for Each Type Separately
figure;
subplot(3,2,1);
plotmf(fis, 'input', 1);
title('Athleticism Membership Functions');

subplot(3,2,2);
plotmf(fis, 'input', 2);
title('Hand-Eye Coordination Membership Functions');

subplot(3,2,3);
plotmf(fis, 'input', 3);
title('Interest in Team Games Membership Functions');

subplot(3,2,4);
plotmf(fis, 'input', 4);
title('Stamina Membership Functions');

subplot(3,2,5);
plotmf(fis, 'output', 1);
title('Sport Suitability Membership Functions');

% User Input
athleticism = input('Enter Athleticism level (0-10): ');
handEyeCoordination = input('Enter Hand-Eye Coordination level (0-10): ');
teamInterest = input('Enter Interest in Team Games (0-10): ');
stamina = input('Enter Stamina level (0-10): ');

% Evaluate the System
output = evalfis(fis, [athleticism, handEyeCoordination, teamInterest, stamina]);

% Display Result
if output < 4
    disp('Recommended Decision: Not Recommended for Sports.');
elseif output >= 4 && output < 7
    disp('Recommended Decision: Maybe Suitable for Sports.');
else
    disp('Recommended Decision: Strongly Recommended for Sports!');
end
