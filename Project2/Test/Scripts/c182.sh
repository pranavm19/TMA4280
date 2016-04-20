#!/bin/bash

# Problem:2 - Hybrid vs MPI Only Performance!

#PBS -N compare
#PBS -A ntnu603
#PBS -l walltime=00:02:00
#PBS -l select=9:ncpus=32:mpiprocs=2:ompthreads=2

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 18 omplace -nt 2 ./poisson 16384