#!/bin/bash

#jacobi 1d correctness comparison seq/omp

export OMP_NUM_THREADS=8
	echo 'jacobi_1D_SEQ:'
	./jacobi_1D_SEQ 4000 200000
	echo 'jacobi_1D_OMP:'
	./jacobi_1D_OMP 4000 200000

