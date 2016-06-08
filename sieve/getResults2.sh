#!/bin/bash

echo 'sieve3' >> testResultsSieve34.txt
for n in {500000000..1500000000..500000000}
do
	echo 'n = '$n >> testResultsSieve34.txt
	for i in {1..3}
	do
		./sieve3 $n | grep 'elapsed' >> testResultsSieve34.txt
	done
done

echo 'sieve4' >> testResultsSieve34.txt
for thread in {1..8}
do
	export OMP_NUM_THREADS=$thread
	echo 'omp_num_threads='$thread >> testResultsSieve34.txt
	for n in {500000000..1500000000..500000000}
	do
		echo 'n = '$n >> testResultsSieve34.txt
		for i in {1..3}
		do
			./sieve4 $n | grep 'elapsed' >> testResultsSieve34.txt
		done
	done
done
