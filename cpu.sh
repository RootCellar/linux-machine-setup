#!/bin/bash

# Sets the maximum clock rate of all CPUs to the given argument
# Many CPUs have a minimum of how low you can set this.
# For example: './cpu.sh 3GHz'

cpu_count=$(nproc --all)

#For loop all logical CPUs and set clock rate to supplied argument
for i in $(eval echo {0..$cpu_count}); do
	echo $i
	cpufreq-set --cpu $1 -u $1
done
