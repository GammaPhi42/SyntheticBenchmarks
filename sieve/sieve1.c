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

int main(int argc, char **argv) {

   long N  = 100;

   char *mark;

   long   size;
   long   curr;
   long   i, j,n, sqrtN;
   long   count;

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
   for (i=0; i<= (N%2 ? (N/2)+2 : (N/2)+1); i=i+1){
     mark[i]=0;
   }

   curr=3;       /*first prime*/
   sqrtN = sqrt(N);
   while (curr<=sqrtN) {
   for (i=curr*curr; i<=N; i+= curr+curr)
     if (i%curr == 0) 
         mark[i/2]=1;
   curr+=2;
   while (mark[curr/2]) curr+=2;
   /* now index has the first unmarked number, so ... */
   }

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
   return 0;
}


