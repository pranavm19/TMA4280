#!/bin/bash

cd $PBS_O_WORKDIR

echo "Hybrid4 Performance" >> Hybrid4
sh 4procs4.sh >> Hybrid4
sh 8procs4.sh >> Hybrid4
sh 16procs4.sh >> Hybrid4
sh 32procs4.sh >> Hybrid4
