%% This code compares the modes derived from the complex with the
% allosteric modes of the monomer.
%% Initialize
clear all: clc: close all:
monomodeset=[1 3];
monof='1OMP'; % apo structure 
complexf1='3OSQ';
complexf2='3OSR';

[MSF1,resnum]=GNM(monof,monomodeset(1),monomodeset(1),'A');
[MSF2,resnum]=GNM(monof,monomodeset(2),monomodeset(2),'A');

% merge 173 & 427 for 3OSQ
% merge 311 & 564 for 3OSR 

[MSFc1,resnum]=GNM(complexf1,1,10,'A');
[MSFc2,resnum]=GNM(complexf2,1,10,'A');