%This function is to find the value and position of the extrema.
%The value and corresponding independent variables will be directly passed
%to the next generation.

function [fitness_extrema fe_encoding fe_decoding]=selection_extrema(fitness,population_encoding,population_decoding,max_or_min)
if max_or_min==1
    [fitness_extrema index]=max(fitness);
elseif max_or_min==2
    [fitness_extrema index]=min(fitness);
end
fe_encoding(1,:)=population_encoding(index,:);
fe_decoding(1,:)=population_decoding(index,:);
end