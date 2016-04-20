#!/bin/bash

#PBS -N hybrid8
#PBS -A ntnu603
#PBS -l walltime=00:03:00
#PBS -l select=2:ncpus=32:mpiprocs=2:ompthreads=8

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 4 omplace -nt 8 ./poisson 1024 >> Hybrid8
mpiexec_mpt -n 4 omplace -nt 8 ./poisson 2048 >> Hybrid8
mpiexec_mpt -n 4 omplace -nt 8 ./poisson 4096 >> Hybrid8
mpiexec_mpt -n 4 omplace -nt 8 ./poisson 8192 >> Hybrid8
mpiexec_mpt -n 4 omplace -nt 8 ./poisson 16384 >> Hybrid8