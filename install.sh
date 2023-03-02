#!/bin/bash
clear
chmod +x stage-1.sh stage-2.sh intro.sh

#introduction of project
bash ./intro.sh

#STAGE 1
bash ./stage-1.sh
echo "stage 1 complete"

#STAGE 2
bash ./stage-2.sh
echo "stage 2 complete"

