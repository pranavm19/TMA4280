#!/bin/bash

# Problem:2 - Hybrid vs MPI Only Performance!

#PBS -N compare
#PBS -A ntnu603
#PBS -l walltime=00:02:00
#PBS -l select=6:ncpus=32:mpiprocs=2:ompthreads=3

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 12 omplace -nt 3 ./poisson 16384 >> Compare