#!/bin/bash

#PBS -N hybrid1
#PBS -A ntnu603
#PBS -l walltime=00:45:00
#PBS -l select=2:ncpus=32:mpiprocs=16:ompthreads=1

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

echo "Hybrid with 1 Threads per Process"
mpiexec_mpt -n 1 omplace -nt 1 ./poisson 1024 >> Hybrid1
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 1024 >> Hybrid1
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 1024 >> Hybrid1
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 1024 >> Hybrid1
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 1024 >> Hybrid1
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 1024 >> Hybrid1

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 2048 >> Hybrid1
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 2048 >> Hybrid1
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 2048 >> Hybrid1
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 2048 >> Hybrid1
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 2048 >> Hybrid1
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 2048 >> Hybrid1

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 4096 >> Hybrid1
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 4096 >> Hybrid1
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 4096 >> Hybrid1
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 4096 >> Hybrid1
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 4096 >> Hybrid1
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 4096 >> Hybrid1

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 8192 >> Hybrid1
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 8192 >> Hybrid1
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 8192 >> Hybrid1
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 8192 >> Hybrid1
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 8192 >> Hybrid1
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 8192 >> Hybrid1

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 16384 >> Hybrid1
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 16384 >> Hybrid1
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 16384 >> Hybrid1
mpiexec_mpt -n 8 omplace -nt 1 ./poisson 16384 >> Hybrid1
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 16384 >> Hybrid1
mpiexec_mpt -n 32 omplace -nt 1 ./poisson 16384 >> Hybrid1

