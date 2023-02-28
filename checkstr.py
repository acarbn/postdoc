from pymol import cmd
import os
#altfiles=['1A03','2LGV','7UO6','7R0R','2KB1','7VIL']
#altfiles=['8F4V','7ZE0','4TRX','1CIS','2ABD']
altfiles=['4AKE', '1AKE', '1CFD', '1CKK', '1DPE', '1DPP', '1URP', '2DRI', '1GGG', '1WDN', '1GRU', '1KP8', '8OHM', '1CU1', '1BP5', '1A8E', '2LAO', '1LST', '1PVU', '1EYU']

#path="firstchainsalt"
#isExist = os.path.exists(path)
#if not isExist:

   # Create a new directory because it does not exist
 #  os.makedirs(path)

for n in altfiles:
    cmd.fetch(n)
  #  chs=cmd.get_chains(n)
  #  crm="+".join((chs[1:len(chs)]))
  #  if len(crm)>0:
  #      cmd.remove("chain "+crm)
  #  cmd.split_states(n)
  #  ss=cmd.get_object_list(n+'_*')
  #  for s in ss:
  #      cmd.save('./'+path+'/'+s+'.pdb',s)
  #  del s
#cmd.quit()
