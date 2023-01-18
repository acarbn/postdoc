%% This code compares GNM modes with the dif vector between two states of a protein
% and plot the overlaps.
%%
clear all; clc;close all;
%addpath '/Users/acarb/Dropbox (The Francis Crick)/DeBenedictisE/burcin/crick_biodesign/postdoc/trymatlab'
addpath '/Users/burcinacar/Dropbox (The Francis Crick)/DeBenedictisE/burcin/crick_biodesign/postdoc/trymatlab'
%%Input Data
fname1='1OMP';
fname2='1ANF';
chain1='A';
chain2='A';

%% Calculate Dif Vec
[resnum,ndvs,dvs]=difvecPDB(fname1,chain1,fname2,chain2);
close all
% Plot dif vec
plot(dvs,'LineWidth',3,'Color','k')
xlim([0 resnum+1])
set(gca,'FontSize',24)
grid on
axis square
xlabel('Residue Number')
ylabel('Position Change (Angstrom)')
close all

mode_max=10;
mode_beg=1;

% Smooth data
windowSize = 1; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
ndvsf=filter(b,a,ndvs);
% figure(1)
% plot(ndvs)
% hold on
% plot(ndvsf)
%% Calculate MSF and overlaps

for kk=resnum-mode_max:resnum-mode_beg
    [MSFDUM,MSF,resnum]=GNM(fname1,[resnum-kk],chain1);
    MSFf=filter(b,a,MSF);

    ovM(1,resnum-kk)=dot(MSFf,ndvsf)/(norm(MSFf)*norm(ndvsf)); % regular overlap
    ovX(1,resnum-kk)=dot(MSF,ndvs)/(norm(MSF)*norm(ndvs)); 
  
    figure(1)
    subplot(2,5,resnum-kk)
    plot(MSFf,'LineWidth',3)
    hold on
    plot(ndvsf,'LineWidth',3,'Color','k')
    set(gca,'FontSize',24)
    grid on
    axis square
    xlabel('Residue Number')
    ylabel('Fluctuation')
    legend('Mode Shape','Difference Vector')
end


