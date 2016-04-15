#!/bin/bash

#PBS -N hybrid2
#PBS -A ntnu603
#PBS -l walltime=00:40:00
#PBS -l select=2:ncpus=32:mpiprocs=16:ompthreads=2

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

echo "Hybrid with 2 Threads per Process"
mpiexec_mpt -n 1 omplace -nt 2 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 2 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 2 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 2 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 2 ./poisson 1024 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 2 ./poisson 1024 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 2 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 2 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 2 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 2 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 2 ./poisson 2048 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 2 ./poisson 2048 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 2 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 2 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 2 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 2 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 2 ./poisson 4096 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 2 ./poisson 4096 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 2 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 2 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 2 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 2 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 2 ./poisson 8192 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 2 ./poisson 8192 >> Hybrid2

mpiexec_mpt -n 1 omplace -nt 2 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 2 omplace -nt 2 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 4 omplace -nt 2 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 8 omplace -nt 2 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 16 omplace -nt 2 ./poisson 16384 >> Hybrid2
mpiexec_mpt -n 32 omplace -nt 2 ./poisson 16384 >> Hybrid2

