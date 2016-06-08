#/bin/bash

for i in {100000..300000..100000}
do
	for trial in {1..3}
	do
		echo 'sieve n='$i >> testResultsSieve01.txt
		./sieve $i >> testResultsSieve01.txt
		echo 'sieve1 n='$i >> testResultsSieve01.txt
		./sieve1 $i >> testResultsSieve01.txt
	done
done

