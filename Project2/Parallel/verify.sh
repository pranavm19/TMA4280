#!/bin/bash

# Problem:1 - MPI Only Performance!

#PBS -N Verify
#PBS -A ntnu603
#PBS -l walltime=00:25:00
#PBS -l select=3:ncpus=32:mpiprocs=16:ompthreads=1

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 1 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 2 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 3 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 4 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 5 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 7 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 9 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 11 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 13 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 15 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 16 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 17 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 19 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 21 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 23 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 25 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 27 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 31 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 33 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 35 omplace -nt 1 ./poisson 1024 >> Verify
mpiexec_mpt -n 36 omplace -nt 1 ./poisson 1024 >> Verify