clear all
fname1='4O4B';
%f1=getpdb(fname1);
%f2=getpdb('4O4B');
fname2='/Users/acarb/Dropbox (The Francis Crick)/DeBenedictisE/burcin/crick_biodesign/postdoc/test_e62db.result/test_e62db_relaxed_rank_1_model_1.pdb';
%[Dist, RMSD, Transf, PDB2TX] = pdbsuperpose(f1, f2,'SEGMENT',{'B', 'A'});
%fname2=PDB2TX;
%pdbwrite('try.pdb',PDB2TX)
chain1='AB';
chain2='A';
[resnum,ndvs,dvs,MSF1f,MSF2f]=difvecPDBseg(fname1,chain1,fname2,chain2);
mode_beg=1;
mode_max=10;
%[MSFi,MSFa,resnum2]=GNM(fname1,[mode_beg:mode_max],chain1);

for kk=mode_beg:mode_max
    ovM(1,kk)=dot(MSF1f(kk,:),ndvs)/(norm(MSF1f(kk,:))*norm(ndvs));
end
    
