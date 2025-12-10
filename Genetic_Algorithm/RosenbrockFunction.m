function cost = RosenbrockFunction(x)
% Rosenbrock function for optimization

n = length(x);
cost = 0;
for i = 1:n-1
    cost = cost + 100*(x(i+1) - x(i)^2)^2 + (1 - x(i))^2;
end
