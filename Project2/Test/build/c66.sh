#!/bin/bash

# Problem:2 - Hybrid vs MPI Only Performance!

#PBS -N compare
#PBS -A ntnu603
#PBS -l walltime=00:02:00
#PBS -l select=3:ncpus=32:mpiprocs=2:ompthreads=6

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 6 omplace -nt 6 ./poisson 16384 >> Compare