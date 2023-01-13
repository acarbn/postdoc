%% This code compares the modes derived from the complex with the
% allosteric modes of the monomer.
%% Initialize
clear all; clc; close all;
monomodeset=[1 3];
monof='1OMP'; % apo structure 
complexf1='3OSQ';
complexf2='3OSR';

[MSF1,resnum]=GNM(monof,monomodeset(1),monomodeset(1),'A');
[MSF2,resnum]=GNM(monof,monomodeset(2),monomodeset(2),'A');

% merge 173 & 427 for 3OSQ
% merge 311 & 564 for 3OSR 

[MSFc1,resnum2]=GNM(complexf1,1,10,'A');
[MSFc2,resnum3]=GNM(complexf2,1,10,'A');

for kk=1:10
    MSFc1m(kk,:)=MSFc1(kk,[1:173-1 422-6-1-3:resnum2]);
    MSFc2m(kk,:)=MSFc2(kk,[5:311+4 561-17-3+4:resnum3]);
    ov1(kk)=dot(MSFc1m(kk,:),MSF1(2:369))/(norm(MSFc1m(kk,:))*norm(MSF1(2:369)))
end


