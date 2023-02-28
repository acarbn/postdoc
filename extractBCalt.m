%% This code extracts BCs for various webnma outputs.
clear all; clc;close all;

path=['/Users/acarb/Dropbox (The Francis Crick)/DeBenedictisE/' ...
'burcin/crick_biodesign/postdoc/dynamic_score/WEBnma_analyses_results/'...
'firstchainsalt'];

%NMRfiles=["1A03","7UO6","7R0R","2KB1","7VIL","8F4V","7ZE0","4TRX","1CIS","2ABD"]; % excluded'2LGV' as it gave
                                              % errors.
NMRfiles=["1BP5", "1CFD",	"1DPE",	"1GGG",	"1GRU",	"1PVU",	"1URP",	"2LAO",	"4AKE",	"8OHM"];

                                              
%NMRfiles=["1A03"];                        
count=0;                                        
for n=NMRfiles
    count=count+1;
    newpath=strcat(path,'/',n,'/WEBnma_analyses_results/covariance/BC.txt');
    %fprintf(newpath)
    fid = fopen(newpath,'rt');
    
    % Initialize the data matrix
    data = [];

    % Read each line of the file
    while ~feof(fid)
        line = fgets(fid);  % Read a line from the file
    
        % Check if the line is a numeric value
        if ~isnan(str2double(line(1:4)))
            % Parse the line and extract the numeric values
            values = textscan(line, '%f');
            row = cat(2, values{:});  % Convert the cell array of values to a row vector
        
        % Append the row vector to the data matrix
        data = [data; row'];
        end
    end
    data(find(eye(size(data))))=0;
    figure(1)
   % Outt = repmat(count, 1,numel(nonzeros(tril(data))));
    x_axes1= repmat(n, 1,numel(nonzeros(tril(data))));
    C = categorical(x_axes1)
    plot(C,nonzeros(tril(data)),'.k','MarkerSize',20);
    set(gca,'Fontsize',24)
    hold on
    fclose(fid);
    ylim([0.6 1])
    xlabel('NMR structure (PDB code)')
    ylabel('Bhattacharyya coeefficient')
    
    figure(2)
    x_axes2=repmat("ALL", 1,numel(nonzeros(tril(data))));
    C2 = categorical(x_axes2)
    plot(C2,nonzeros(tril(data)),'.k','MarkerSize',20);
    set(gca,'Fontsize',24)
    hold on
    ylim([0 1])
    xlabel('NMR structures (All)')
    ylabel('Bhattacharyya coeefficient')
    
    
end
axis square
grid on
hold off
% Close the file


