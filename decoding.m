%This function is used to transform binary values to decimal values within
%the bounds.

function population_decoding=decoding(population_encoding,population_size,gene_block_length,range)
index=(gene_block_length-1:-1:0)';
population_decoding=ones(population_size,size(range,1));
for k1=1:size(range,1)
    factor=2.^index./(2^gene_block_length-1).*(range(k1,2)-range(k1,1));
    for k2=1:population_size
        population_decoding(k2,k1)=sum(population_encoding(k2,gene_block_length*(k1-1)+1:gene_block_length*k1).*factor')+range(k1,1);
    end
end
end