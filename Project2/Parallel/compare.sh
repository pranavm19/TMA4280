#!/bin/bash

# Problem:2 - Hybrid vs MPI Only Performance!

#PBS -N compare
#PBS -A ntnu603
#PBS -l walltime=00:25:00
#PBS -l select=3:ncpus=32:mpiprocs=16:ompthreads=18

module load intelcomp
module load mpt

cd $PBS_O_WORKDIR

mpiexec_mpt -n 1 omplace -nt 36 ./myprog >> Compare
mpiexec_mpt -n 2 omplace -nt 18 ./myprog >> Compare
mpiexec_mpt -n 3 omplace -nt 12 ./myprog >> Compare
mpiexec_mpt -n 4 omplace -nt 9 ./myprog >> Compare
mpiexec_mpt -n 6 omplace -nt 6 ./myprog >> Compare
mpiexec_mpt -n 9 omplace -nt 4 ./myprog >> Compare
mpiexec_mpt -n 12 omplace -nt 3 ./myprog >> Compare
mpiexec_mpt -n 18 omplace -nt 2 ./myprog >> Compare
mpiexec_mpt -n 36 omplace -nt 1 ./myprog >> Compare