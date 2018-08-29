%This function is used to show the plots.
%Function with one independent variable will get a 2-D plot and function
%with two independent variables will get a 3-D plot. However, Function with
%three independent variables will not get a plot.
%One is the initial plot and the other is the final generation.
%The extreme point is indicated in the plots.

function []=plotting(fitness_function,fitness,population_decoding,gene_block_number,range,max_or_min)
if max_or_min==1
    [extrema position]=max(fitness);
elseif max_or_min==2
    [extrema position]=min(fitness);
end
if gene_block_number==1
    ezplot(fitness_function,[range(1,1) range(1,2)])
    hold on
    plot(population_decoding,fitness,'k*')
    plot(population_decoding(position),extrema,'g*')
    hold off
    txt=sprintf('(%.4f,%.4f)',population_decoding(position),extrema);
    text(population_decoding(position),extrema,txt);
    ylabel('Fitness');
elseif gene_block_number==2
    ezsurf(fitness_function,[range(1,1) range(1,2) range(2,1) range(2,2)])
    hold on
    plot3(population_decoding(:,1),population_decoding(:,2),fitness,'k*')
    plot3(population_decoding(position,1),population_decoding(position,2),extrema,'g*')
    hold off
    txt=sprintf('(%.4f,%.4f,%.4f)',population_decoding(position,1),population_decoding(position,2),extrema);
    text(population_decoding(position,1),population_decoding(position,2),extrema,txt);
    zlabel('Fitness');
end