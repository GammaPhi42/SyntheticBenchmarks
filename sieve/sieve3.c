/*/////////////////////////////////////////////////////////////////////////////
//
// File name : sieve.c
// Author    : Nissa Osheim
// Date      : 2010/19/10
// Desc      : Finds the primes up to N
//
// updated Wim Bohm
/////////////////////////////////////////////////////////////////////////////*/


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "timer.h"
#include <omp.h>
#define DEBUG 0

#define MIN(a,b) ((a) < (b) ? a : b)
#define BLKSIZE 1000000
int main(int argc, char **argv) {

   long N  = 100;

   char *mark;

   long   size;
   long   curr;
   long   i, j,n, sqrtN;
   long   count;
   long* primes;
   int num_primes = 0;
   /* Time */

   double time;

   if ( argc > 1 ) N  = atoi(argv[1]);

   /* Start Timer */

   initialize_timer ();
   start_timer();

   /* if N is odd then store odd elements below N, and include N 
    * if N is even then store odd elements below N 
    */
   if(N % 2 == 0)
   {
      size = ((N/2)+1)*sizeof(char);
   }
   else 
   {
      size = ((N/2)+2)*sizeof(char);
   }
   mark = (char *)malloc(size);
   /* initialize the array */
   for (i=0; i<= (N%2 ? (N/2)+1 : (N/2)); i=i+1){
     mark[i]=0;
   }

   curr=3;       /*first prime*/
   sqrtN = floor(sqrt(N));
/********************************************/

   long* candidate_list;
   j = 2;
   i = 2;
   int prime;
   num_primes = 0;
   int approx_num_primes = sqrtN / (floor(log(sqrtN)-1));
   candidate_list = malloc(approx_num_primes * sizeof(long));
   for(i = 0; i < approx_num_primes; i++)
   {
      candidate_list[i] = 0;
   }
   for(i = 3; i <= sqrtN; ++i)
   {
      prime = 1;
      for(j = 2; j < i; j++)
      {
         if(i%j ==0)
         {
            prime = 0;
            break;
         }
      }
      if(prime)
      {
         #if DEBUG
            printf("approx_num_primes=%d, num_primes=%d\n", approx_num_primes, num_primes);
         #endif
         candidate_list[num_primes++] = j;
         #if DEBUG
            printf("num_primes=%d\n", num_primes);
         #endif
      }
   }

   primes = malloc(num_primes * sizeof(long));

   for(i = 0; i < num_primes; i++)
   {
      primes[i] = candidate_list[i];
   }
   free(candidate_list);

/*********************************************/
   #if DEBUG
   printf("found primes: ");
   for( i = 0 ; i < num_primes; i++)
   {
      printf("%ld ", primes[i]);
   }
   #endif
   
/**************************************/
   int ii;
   int start;
   int block_start = sqrtN;
   for(ii = 0; ii <= N; ii+=BLKSIZE) // for each block, starting at 1st block
   {
      for(j = 0; j < num_primes; ++j) // for each prime < sqrtN
      {
         start = primes[j] * primes[j];
         while(start < ii )/* set start equal to first odd multiple of k >= k^2 greater than first index of current block */
         {
	    start += primes[j] + primes[j];
         }  

         for(i = start; i<= MIN(ii + BLKSIZE, N); i+= primes[j] + primes[j])
         {
            mark[i/2] = 1;
         }
      }
   }

/* while (curr<=sqrtN) {
   
   for (i=curr*curr; i<=N; i+= curr+curr)
     if (i%curr == 0) 
         mark[i/2]=1;
   curr+=2;
   while (mark[curr/2]) curr+=2;
  * now index has the first unmarked number, so ... *
   }
*/

/************************************/
   /* stop timer */
   stop_timer();
   time=elapsed_time ();

   /*number of primes*/
   count = 1;
   for(i = 3; i <= N; i+=2){
        if(mark[i/2] == 0) {
        	/* printf("\t prime %ld  \n",i ); */
        	++count;
        }

   }
   printf("There are %ld primes less than or equal to %ld\n", count, N);
   /* print results */
   printf("First three primes:");
   j = 1;
   printf("%d ", 2);
   for ( i=3 ; i <= N && j < 3; i+=2 ) {
      if (mark[i/2]==0){
            printf("%ld ", i);
            ++j;
      }
   }
   printf("\n");

   printf("Last three primes:");
   j = 0;
   n=(N%2?N:N-1);
   for (i = n; i > 1 && j < 3; i-=2){
     if (mark[i/2]==0){
        printf("%ld ", i);
        j++;
     }
   }
   printf("\n");


   printf("elapsed time = %lf (sec)\n", time);

   free(mark);
   free(primes);
   return 0;
}
