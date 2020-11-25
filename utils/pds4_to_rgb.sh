#!/bin/bash
# Cycle-consistent Generative Adversarial Networks for Neural Style Transfer using data from Chang’E-4.
# J. de Curtó i DíAz (decurtoidiaz@ieee.org)
# R. A. Duvall (rduvall@andrew.cmu.edu)
# Iris Lunar Rover. Carnegie Mellon.

# Script to handle conversion from PDS4 to PNG. RGB. Used to convert images from the terrain camera of the lander.
# Important: you may need to adapt file extension (here .2C), image size (here 2352x1728) and probably depth (here 8).
# For the two last parameters (size and depth), refer to the label information (here .2CL).


# To run the script, you need imagemagick on your system:
# sudo apt-get install imagemagick

# First rename the files to .RAW extension
mkdir png
cp *.2C png/
cd png && rename 's/.2C$/.raw/' *.2C

# Then convert to PNG using imagemagick. RGB (no debayer)
for file in *.raw; do convert -size 2352x1728 -depth 8 rgb:$file "`basename $file .raw`.png"; done
rm *.raw
cd ..
