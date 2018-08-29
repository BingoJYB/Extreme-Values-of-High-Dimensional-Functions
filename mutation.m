%This function is for the mutation operation.
%A random value will be got. If it is smaller than pm, the mutation
%happens.
%Breakpoint is a point where each bit of the two selected
%chromosomes will be changed.

function children=mutation(children,gene_block_length,gene_block_number,pm)
for k1=1:size(children,1)
    if rand<pm
        breakpoint=round(rand*(gene_block_length-2)+1);
        for k2=1:gene_block_number
            children(k1,(k2-1)*gene_block_length+breakpoint)=1-children(k1,(k2-1)*gene_block_length+breakpoint);
        end
    end
end
end