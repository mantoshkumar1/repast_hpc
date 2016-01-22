module add scalasca/2.2
module add png
export OMP_NUM_THREADS=16
export SCOREP_TOTAL_MEMORY=1638400000
export EPK_METRICS=PAPI_FP_OPS
export SCOREP_METRIC_PAPI=PAPI_FP_OPS
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./../lib
export SCOREP_ENABLE_TRACING=false
export SCOREP_PROFILING_MAX_CALLPATH_DEPTH=300
export SCOREP_MPI_ENABLE_GROUPS=all
perf_off
scan mpirun -n 4 ./zombie_model zombie_config.props zombie_model.props
square scorep_zombie_model_4_sum
