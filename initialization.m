%This function is used to get the binary initial values randomly.
%The number of bits in one chromosome is determined by
%Gene_block_length*gene_block_number.
%The total number of chromosomes depends on population_size.

function population_encoding=initialization(population_size,gene_block_length,gene_block_number)
population_encoding=round(rand(population_size,gene_block_length*gene_block_number));
end