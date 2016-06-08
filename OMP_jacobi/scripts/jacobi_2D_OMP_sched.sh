#!/bin/bash

export OMP_NUM_THREADS=8

export OMP_SCHEDULE=static
echo "static" >> jacobi_2D_OMP_times.txt
for i in {1..10}
do
	./jacobi_2D_OMP 800 2000 >> jacobi_2D_OMP_times_inner.txt
done

export OMP_SCHEDULE=guided
echo "guided" >> jacobi_2D_OMP_times.txt
for i in {1..10}
do
	./jacobi_2D_OMP 800 2000 >> jacobi_2D_OMP_times_inner.txt
done

export OMP_SCHEDULE=dynamic,80000
echo "dynamic, 80000" >> jacobi_2D_OMP_times.txt
for i in {1..10}
do
	./jacobi_2D_OMP 800 2000 >> jacobi_2D_OMP_times_inner.txt
done

