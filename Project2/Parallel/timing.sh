#!/bin/bash

#Timing with respect to scaling!

#PBS -N timing
#PBS -A ntnu603
#PBS -l walltime=00:25:00
#PBS -l select=3:ncpus=32:mpiprocs=16:ompthreads=1

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 1024 >> Timing
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 1024 >> Timing
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 1024 >> Timing
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 1024 >> Timing
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 1024 >> Timing
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 1024 >> Timing

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 2048 >> Timing
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 2048 >> Timing
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 2048 >> Timing
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 2048 >> Timing
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 2048 >> Timing
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 2048 >> Timing

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 4096 >> Timing
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 4096 >> Timing
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 4096 >> Timing
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 4096 >> Timing
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 4096 >> Timing
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 4096 >> Timing

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 8192 >> Timing
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 8192 >> Timing
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 8192 >> Timing
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 8192 >> Timing
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 8192 >> Timing
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 8192 >> Timing

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 16384 >> Timing
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 16384 >> Timing
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 16384 >> Timing
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 16384 >> Timing
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 16384 >> Timing
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 16384 >> Timing
