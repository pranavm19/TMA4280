#!/bin/bash

# Problem:3 - Hybrid2 with respect to scaling!

#PBS -N hybrid2
#PBS -A ntnu603
#PBS -l walltime=00:25:00
#PBS -l select=3:ncpus=32:mpiprocs=16:ompthreads=4

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 1 omplace -nt 4 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 4 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 4 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 4 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 4 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 1024 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 4 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 4 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 4 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 4 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 4 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 2048 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 4 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 4 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 4 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 4 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 4 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 4096 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 4 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 4 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 4 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 4 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 4 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 8192 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 4 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 4 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 4 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 4 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 4 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 4 ./poisson 16384 >> Hybrid2