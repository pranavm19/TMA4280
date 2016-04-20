#!/bin/bash

cd $PBS_O_WORKDIR

echo "Compare Performance" >> Compare
sh c136.sh >> Compare
sh c218.sh >> Compare
sh c312.sh >> Compare
sh c49.sh >> Compare
sh c66.sh >> Compare
sh c94.sh >> Compare
sh c123.sh >> Compare
sh c182.sh >> Compare
sh c361.sh >> Compare

