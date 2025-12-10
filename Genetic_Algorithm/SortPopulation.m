function sorted_pop = SortPopulation(pop)
% Sorts population based on cost (fitness)

[~, order] = sort([pop.Cost]);
sorted_pop = pop(order);
