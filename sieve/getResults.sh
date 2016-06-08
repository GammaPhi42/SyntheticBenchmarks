#!/bin/bash

echo 'sieve1' >> testResultsSieve12.txt
for n in {500000000..1500000000..500000000}
do
        echo 'n = '$n >> testResultsSieve12.txt
	for i in {1..3}
	do
		./sieve1 $n | grep 'elapsed' >> testResultsSieve12.txt
	done
done

echo 'sieve2' >> testResultsSieve12.txt
for thread in {1..8}
do
	export OMP_NUM_THREADS=$thread
	echo 'omp_num_threads='$thread >> testResultsSieve12.txt
	for n in {500000000..1500000000..500000000}
	do
		echo 'n = '$n >> testResultsSieve12.txt
		for i in {1..3}
		do
			./sieve2 $n | grep 'elapsed' >> testResultsSieve12.txt
		done
	done
done	
