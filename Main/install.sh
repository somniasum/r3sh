#!/bin/bash
#author: somniasum
#

source animate.sh

clear
chmod +x ./*/*.sh

#introduction of project
bash ./intro.sh

#STAGE 1
bash ./stage-1.sh
clear
animate 

#STAGE 2
bash ./stage-2.sh
echo "stage 2 complete"

