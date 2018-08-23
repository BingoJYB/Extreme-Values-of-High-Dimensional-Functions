%This function is for the crossover operation.
%A random value will be got. If it is smaller than pc, the crossover
%happens. Otherwise, cloning happens.
%Breakpoint is a point after which the parts of the two selected
%Chromosomes are exchanged with each other.

function children=crossover(children,gene_block_length,gene_block_number,pc)
for k1=1:size(children,1)-1
    if rand<pc
        breakpoint=round(rand*(gene_block_length-2)+1);
        for k2=1:gene_block_number
            children(k1,(k2-1)*gene_block_length+1:(k2-1)*gene_block_length+breakpoint)=children(k1,(k2-1)*gene_block_length+1:(k2-1)*gene_block_length+breakpoint);
            children(k1,(k2-1)*gene_block_length+breakpoint+1:k2*gene_block_length)=children(k1+1,(k2-1)*gene_block_length+breakpoint+1:k2*gene_block_length);
        end
    end
end
end