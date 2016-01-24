#!/bin/bash
source /etc/profile.d/modules.sh
cp ../../src/zombies/config.props zombie_config.props
cp ../../src/zombies/model.props zombie_model.props
rm -rf scorep_zombie_model*
rm -rf corep_zombie_model*
rm -rf logs/*
rm -rf output/*
module add scalasca/2.2
module add png
#module load scorep
#module load cube
export OMP_NUM_THREADS=16
export SCOREP_TOTAL_MEMORY=163840000
#export EPK_METRICS='PAPI_FP_INS'
export EPK_METRICS=PAPI_FP_OPS
#export EPK_METRICS=PAPI_TOT_INS:PAPI_FP_OPS:PAPI_L2_TCM:PAPI_TOT_CYC
#export SCOREP_METRIC_PAPI=PAPI_FP_INS
#export SCOREP_METRIC_PAPI=0x80000066
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./../lib
export SCOREP_ENABLE_TRACING=false
export SCOREP_PROFILING_MAX_CALLPATH_DEPTH=300
export SCOREP_MPI_ENABLE_GROUPS=all
export SCOREP_OVERWRITE_EXPERIMENT_DIRECTORY=true
perf_off
#scalasca -analyze mpirun -n 4 ./zombie_model zombie_config.props zombie_model.props
scalasca -analyze mpirun -n $1 ./zombie_model zombie_config.props zombie_model.props

#saving collecting data
cus_dir_name=collected_data/$(date +%Y%m%d_%H%M%S)
mkdir -p "$cus_dir_name"
shopt -s nullglob  # this line is so that it does not compain when no files are found
#cp -R corep_zombie_model_4_sum* ./"$cus_dir_name"/
cp -R scorep_zombie_model* ./"$cus_dir_name"/
cp -R logs ./"$cus_dir_name"/
cp -R output ./"$cus_dir_name"/
cp  zombie_config.props ./"$cus_dir_name"/
cp  zombie_model.props ./"$cus_dir_name"/
cp  Zombies.csv ./"$cus_dir_name"/
#scalasca -analyze mpiexec -n 4 ./zombie_model zombie_config.props zombie_model.props
#square scorep_zombie_model_4_sum

