#!/bin/bash
# Cycle-consistent Generative Adversarial Networks for Neural Style Transfer using data from Chang’E-4.
# J. de Curtó i DíAz (decurtoidiaz@ieee.org)
# R. A. Duvall (rduvall@andrew.cmu.edu)
# Iris Lunar Rover. Carnegie Mellon.

# Script to handle conversion from PDS4 to PNG. Grayscale. Used to convert images from PCAML-Q and PCAMR-Q.
# Important: you may need to adapt file extension (here .2B), image size (here 1176x864) and probably depth (here 16).
# For the two last parameters (size and depth), refer to the label information (here .2BL).

# First rename the files to .RAW extension
mkdir png
cp *.2B png/
cd png && rename 's/.2B$/.raw/' *.2B

# Then convert to PNG using imagemagick. Grayscale.
for file in *.raw; do convert -size 1176x864 -depth 16 gray:$file -evaluate AddModulus 50% -auto-level "`basename $file .raw`.png"; done
cd ..
