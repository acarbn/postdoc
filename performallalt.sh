#!/bin/bash

# Define an array of NMR files
# altfiles=('1A03' '2LGV' '7UO6' '7R0R' '2KB1' '7VIL')
#altfiles=('8F4V' '7ZE0' '4TRX' '1CIS' '2ABD')
altfiles=('4AKE 1AKE' '1CFD 1CKK' '1DPE 1DPP' '1URP 2DRI' '1GGG 1WDN' '1GRU 1KP8' '8OHM 1CU1' '1BP5 1A8E' '2LAO 1LST' '1PVU 1EYU')

# Loop through each NMR file in the array
for file in "${altfiles[@]}"
do
  # Perform a function on each NMR file
  # In this example, we'll just print the filename to the console
  echo "Processing PDB files $file"
  if [ ! -d ${file:0:4} ]; then
  # Create the directory if it doesn't exist
  	mkdir -p ${file:0:4}
  fi
  webnma ca -s -p "${file:0:4}" "${file:0:4}"_0001.pdb "${file:5:4}"_0001.pdb 
done
