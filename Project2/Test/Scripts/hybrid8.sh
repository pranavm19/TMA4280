#!/bin/bash

cd $PBS_O_WORKDIR

echo "Hybrid8 Performance" >> Hybrid8
sh 4procs8.sh >> Hybrid8
sh 8procs8.sh >> Hybrid8
sh 16procs8.sh >> Hybrid8
sh 32procs8.sh >> Hybrid8
