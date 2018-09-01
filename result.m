%This function is to reveal the extrema and arguments.

function [extrema argument]=result(fitness,population_decoding,gene_block_number,max_or_min)
if max_or_min==1
    [extrema position]=max(fitness);
elseif max_or_min==2
    [extrema position]=min(fitness);
end
argument=ones(1,gene_block_number);
argument(1,:)=population_decoding(position,:);
end