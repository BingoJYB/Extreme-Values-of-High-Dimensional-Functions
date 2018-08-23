%This is the main function. The process is following:
%The choice of searching for maximum or minimum
%Enter the arguments by the user
%Initialization
%Decoding
%Evaluation
%Selection
%Crossover
%Mutation
%If the terminated condition isn't reached, the loop will continue.
%Finally, the initial, final generation plots and performance graph are
%given.

syms x1 x2 x3;
max_or_min=menu('Do you want to search for maximum or minimum?','Max','Min');
disp('Please enter the number of independent variables');
gene_block_number=input('Pay attention! The maximum number of variables is 3\n');
gene_block_length=input('Please enter the number of binary bits for one variable\n');
population_size=input('Please enter the size of chromosomes in the population\n');
disp('Please enter the upper and lower bounds for each variable');
range=input('The input should be in the form of matrix like [a,b;c,d]\n');
generations=input('Please enter the times of the loop\n');
best_fitness=ones(1,generations+1);
mean_fitness=ones(1,generations+1);
pc=input('Please enter the probability of crossover in (0,1)\n');
pm=input('Please enter the probability of mutation in (0,1)\n');
disp('Please enter the fitness function');
fitness_function=sym(input('Please change the original variables into x1 x2...\n'));
population_encoding=initialization(population_size,gene_block_length,gene_block_number);
population_decoding=decoding(population_encoding,population_size,gene_block_length,range);
fitness=evaluation(fitness_function,gene_block_number,population_decoding);
[fitness_extrema fe_encoding fe_decoding]=selection_extrema(fitness,population_encoding,population_decoding,max_or_min);
if max_or_min==1
    best_fitness(1)=max(fitness);
elseif max_or_min==2
    best_fitness(1)=min(fitness);
end
mean_fitness(1)=mean(fitness);
if gene_block_number==1||gene_block_number==2
    subplot(2,1,1);
    plotting(fitness_function,fitness,population_decoding,gene_block_number,range,max_or_min);
    title('Initial Generation');
end
for k1=1:generations
    children=selection_children(population_encoding,population_size,gene_block_length,gene_block_number,fitness,max_or_min);
    children=crossover(children,gene_block_length,gene_block_number,pc);
    children=mutation(children,gene_block_length,gene_block_number,pm);
    population_encoding=children;
    population_decoding=decoding(population_encoding,population_size,gene_block_length,range);
    fitness=evaluation(fitness_function,gene_block_number,population_decoding);
    if max_or_min==1
        if fitness_extrema>min(fitness)
            [fitness_min index]=min(fitness);
            fitness(index)=fitness_extrema;
            population_encoding(index,:)=fe_encoding(1,:);
            population_decoding(index,:)=fe_decoding(1,:);
        end
    elseif max_or_min==2
        if fitness_extrema<max(fitness)
            [fitness_max index]=max(fitness);
            fitness(index)=fitness_extrema;
            population_encoding(index,:)=fe_encoding(1,:);
            population_decoding(index,:)=fe_decoding(1,:);
        end
    end
    [fitness_extrema fe_encoding fe_decoding]=selection_extrema(fitness,population_encoding,population_decoding,max_or_min);
    if max_or_min==1
        best_fitness(k1+1)=max(fitness);
    elseif max_or_min==2
        best_fitness(k1+1)=min(fitness);
    end
    mean_fitness(k1+1)=mean(fitness);
end
[extrema argument]=result(fitness,population_decoding,gene_block_number,max_or_min);
if max_or_min==1
    fprintf('Maximum=%5.4f\n',extrema)
elseif max_or_min==2
    fprintf('Minimum=%5.4f\n',extrema)
end
for k2=1:length(argument)
    fprintf('x%d=%5.4f  ',k2,argument(k2))
end
fprintf('\n')
if gene_block_number==1||gene_block_number==2
    subplot(2,1,2);
    plotting(fitness_function,fitness,population_decoding,gene_block_number,range,max_or_min);
    title('Last Generation');
end
figure(2);
plot(0:generations,best_fitness,'r--*',0:generations,mean_fitness,'-x')
legend('Best','Average',-1);
title(sprintf('pc=%.3f   pm=%.3f',pc,pm));
xlabel('Generations');
ylabel('Fitness');