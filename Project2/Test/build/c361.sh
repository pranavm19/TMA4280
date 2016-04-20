#!/bin/bash

# Problem:2 - Hybrid vs MPI Only Performance!

#PBS -N compare
#PBS -A ntnu603
#PBS -l walltime=00:01:00
#PBS -l select=18:ncpus=32:mpiprocs=2:ompthreads=1

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 36 omplace -nt 1 ./poisson 16384 >> Compare