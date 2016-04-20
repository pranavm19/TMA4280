#!/bin/bash

# Problem:2 - Hybrid vs MPI Only Performance!

#PBS -N compare
#PBS -A ntnu603
#PBS -l walltime=00:02:00
#PBS -l select=1:ncpus=32:mpiprocs=3:ompthreads=12

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 3 omplace -nt 12 ./poisson 16384

