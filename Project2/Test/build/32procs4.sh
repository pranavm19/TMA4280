#!/bin/bash

#PBS -N hybrid4
#PBS -A ntnu603
#PBS -l walltime=00:03:00
#PBS -l select=16:ncpus=32:mpiprocs=2:ompthreads=4

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 32 omplace -nt 4 ./poisson 1024 >> Hybrid4
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 2048 >> Hybrid4
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 4096 >> Hybrid4
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 8192 >> Hybrid4
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 16384 >> Hybrid4