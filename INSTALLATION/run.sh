#!/bin/bash
source /etc/profile.d/modules.sh
#source install.sh rhpc
export OMP_NUM_THREADS=16
module load scalasca
make -f Makefile all
cd ./../ext/bin
#rm -rf scorep*
#perf_off 
#scalasca -analyze  mpirun -n 4 zombie_model zombie_config.props zombie_model.props
#cd ./../../INSTALLATION/
