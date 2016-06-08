#!/bin/bash

echo "schedule: Static" >> mat_vec_OMP_times.txt
export OMP_SCHEDULE=static
for i in {1..10}
do
	./mat_vec_OMP 25000 10000 >> mat_vec_OMP_times.txt
done

echo "Schedule: guided" >> mat_vec_OMP_times.txt
export OMP_SCHEDULE=guided
for i in {1..10}
do
	./mat_vec_OMP 25000 10000 >> mat_vec_OMP_times.txt
done

echo "schedule: dynamic, 3125" >> mat_vec_OMP_times.txt
export OMP_SCHEDULE=dynamic,3125
for i in {1..10}
do
	./mat_vec_OMP 25000 10000 >> mat_vec_OMP_times.txt
done
