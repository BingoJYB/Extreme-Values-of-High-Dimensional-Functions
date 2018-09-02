%This function is to select chromosomes from the last generation
%randomly.
%The choice is dependent on the ratio of the fitness.
%As to searching for maximum, the bigger the fitness is, the more
%probability it has to be chosen.
%As to searching for minimum, the smaller the fitness is, the more
%probability it has to be chosen.

function children=selection_children(population_encoding,population_size,gene_block_length,gene_block_number,fitness,max_or_min)
children=ones(population_size,gene_block_length*gene_block_number);
if max(fitness)==min(fitness)
    fitness_ratio=fitness/sum(fitness);
else
    if max_or_min==1
        fitness_ratio=(fitness-min(fitness))/sum(fitness-min(fitness));
    elseif max_or_min==2
        fitness_ratio=(max(fitness)-fitness)/sum(max(fitness)-fitness);
    end
end
roulette_wheel=cumsum(fitness_ratio);
position=1;
for k1=rand(1,population_size)
    for k2=1:population_size
        if k1<roulette_wheel(k2)
            children(position,:)=population_encoding(k2,:);
            break
        end
    end
    position=position+1;
end
end