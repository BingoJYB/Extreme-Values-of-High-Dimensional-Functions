%This is the objective function to get the fitness.
%It identifies the number of variables

function fitness=evaluation(fitness_function,gene_block_number,population_decoding)
if gene_block_number==1
    fitness=subs(fitness_function,'x1',population_decoding(:,1));
elseif gene_block_number==2
    fitness=subs(fitness_function,{'x1','x2'},{population_decoding(:,1),population_decoding(:,2)});
elseif gene_block_number==3
    fitness=subs(fitness_function,{'x1','x2','x3'},{population_decoding(:,1),population_decoding(:,2),population_decoding(:,3)});
end
end