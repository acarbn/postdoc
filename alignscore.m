clear all
f1=getpdb('4O4B');
%f2=getpdb('4O4B');
f2=pdbread('/Users/acarb/Dropbox (The Francis Crick)/DeBenedictisE/burcin/crick_biodesign/postdoc/test_e62db.result/test_e62db_relaxed_rank_1_model_1.pdb');
[Dist, RMSD, Transf, PDB2TX] = pdbsuperpose(f1, f2,'SEGMENT',{'B', 'A'});
pdbwrite('try.pdb',PDB2TX)
