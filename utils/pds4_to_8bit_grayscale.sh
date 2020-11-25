#!/bin/bash
# Cycle-consistent Generative Adversarial Networks for Neural Style Transfer using data from Chang’E-4.
# J. de Curtó i DíAz (decurtoidiaz@ieee.org)
# R. A. Duvall (rduvall@andrew.cmu.edu)
# Iris Lunar Rover. Carnegie Mellon.

# Script to handle conversion from PDS4 to PNG. Grayscale. Used to convert images from the landing camera of the lander.
# Important: you may need to adapt file extension (here .2A), image size (here 1176x864) and probably depth (here 8).
# For the two last parameters (size and depth), refer to the label information (here .2AL).

# To run the script, you need imagemagick on your system:
# sudo apt-get install imagemagick

# First rename the files to .RAW extension
mkdir png
cp *.2A png/
cd png && rename 's/.2A$/.raw/' *.2A

# Then convert to PNG using imagemagick. Grayscale (8 bit depth).
for file in *.raw; do convert -size 1024x1024 -depth 8 gray:$file "`basename $file .raw`.png"; done
rm *.raw
cd ..
