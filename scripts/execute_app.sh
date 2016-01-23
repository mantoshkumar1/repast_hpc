#!/bin/bash
source /etc/profile.d/modules.sh
rm -rf scorep_zombie_model_4_sum
module add scalasca/2.2
module add png
#module load scorep
#module load cube
export OMP_NUM_THREADS=16
export SCOREP_TOTAL_MEMORY=163840000
#export EPK_METRICS='PAPI_FP_OPS'
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
#scalasca -analyze mpiexec -n 4 ./zombie_model zombie_config.props zombie_model.props
#square scorep_zombie_model_4_sum
