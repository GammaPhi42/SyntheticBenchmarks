#!/bin/bash

thd=1

echo 'knapSeq k120.txt' >> testResults.txt

RESULT1=`./knapSeq k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT2=`./knapSeq k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT3=`./knapSeq k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT4=`./knapSeq k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	
echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt

echo 'knapSeq k240.txt' >> testResults.txt

RESULT1=`./knapSeq k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT2=`./knapSeq k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT3=`./knapSeq k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT4=`./knapSeq k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	
echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt

echo 'knapOMP k120.txt' >> testResults.txt
for thd in {1..8}
do
	export OMP_NUM_THREADS=$thd 
	RESULT1=`./knapOMP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT2=`./knapOMP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT3=`./knapOMP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT4=`./knapOMP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	
	echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt
done
	
echo 'knapOMP k240.txt' >> testResults.txt
for thd in {1..8}
do
	export OMP_NUM_THREADS=$thd 
	RESULT1=`./knapOMP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT2=`./knapOMP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT3=`./knapOMP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT4=`./knapOMP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	
	echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt
done

thd=1
echo 'knapBlock k120.txt' >> testResults.txt
export OMP_NUM_THREADS=$thd 

RESULT1=`./knapBlock k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT2=`./knapBlock k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT3=`./knapBlock k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT4=`./knapBlock k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`

echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt

echo 'knapBlock k240.txt' >> testResults.txt
export OMP_NUM_THREADS=$thd 
RESULT1=`./knapBlock k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT2=`./knapBlock k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT3=`./knapBlock k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
RESULT4=`./knapBlock k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	
echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt


echo 'knapBP k120.txt' >> testResults.txt
for thd in {1..8}
do
	export OMP_NUM_THREADS=$thd 
	RESULT1=`./knapBP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT2=`./knapBP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT3=`./knapBP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT4=`./knapBP k120.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	
	echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt
done

echo 'knapBP k240.txt' >> testResults.txt
for thd in {1..8}
do
	export OMP_NUM_THREADS=$thd 
	RESULT1=`./knapBP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT2=`./knapBP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT3=`./knapBP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	RESULT4=`./knapBP k240.txt | grep 'taken' | cut -d':' -f2 | cut -d'.' -f1,2`
	
	echo '#thd =' $thd ',' $RESULT1 ',' $RESULT2 ',' $RESULT3 ',' $RESULT4 >> testResults.txt
done
