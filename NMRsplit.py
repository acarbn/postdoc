from pymol import cmd
import os
NMRfiles=['1A03','2LGV','7UO6','7R0R','2KB1','7VIL']
os.mkdir("try")
for n in NMRfiles:
    cmd.fetch(n)
    cmd.split_states(n)
    ss=cmd.get_object_list(n+'_*')
    for s in ss:
        cmd.save('./try/'+s+'.pdb',s)
    del s
cmd.quit()