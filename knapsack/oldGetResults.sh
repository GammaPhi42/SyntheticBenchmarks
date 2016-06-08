#!/bin/bash

echo 'knapSeq' >> testResults.txt

echo 'knapSeq k120.txt' >> testResults.txt
for i in {1..4}
do
	./knapSeq k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt
done


echo 'knapSeq k240.txt' >> testResults.txt
for i in {1..4}
do
	./knapSeq k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt
done

echo 'knapOMP' >> testResults.txt
for thd in {1..8}
do
	export OMP_NUM_THREADS=$thd
	echo 'OMP_NUM_THREADS=' $OMP_NUM_THREADS >> testResults.txt
	echo 'knapOMP k120.txt' >> testResults.txt
	for i in {1..4} #4 trials
	do
		./knapOMP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt
	done
	echo 'knapOMP k240.txt' >> testResults.txt
	for i in {1..4}
	do
		
		./knapOMP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt
	done 
done

echo 'knapBlock' >> testResults.txt
for thd in {1..8}
do
	export OMP_NUM_THREADS=$thd
	echo 'OMP_NUM_THREADS=' $OMP_NUM_THREADS >> testResults.txt
	echo 'knapBlock k120.txt' >> testResults.txt
	for i in {1..4} #4 trials
	do
		./knapBlock k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt
	done
	echo 'knapBlock k240.txt' >> testResults.txt
	for i in {1..4}
	do
		
		./knapBlock k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt 
	done
done

echo 'knapBP' >> testResults.txt
for thd in {1..8}
do
	export OMP_NUM_THREADS=$thd
	echo 'OMP_NUM_THREADS=' $OMP_NUM_THREADS >> testResults.txt
	echo 'knapBP k120.txt' >> testResults.txt
	for i in {1..4} #4 trials
	do
		./knapBP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt
	done
	echo 'knapBP k240.txt' >> testResults.txt
	for i in {1..4}
	do
		./knapBP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2 >> testResults.txt 
	done
done

