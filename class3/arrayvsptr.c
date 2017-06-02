#include<stdio.h>

int main () {

  int arr[] = {1, 2, 3, 4, 5};
  int * ptr;
  int ii;

  ptr = arr;

  /* array indexing */
  printf("array indexing:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", arr[ii]);
  }
  printf("\n");

  /* pointer arithmetic */
  printf("pointer arithmetic:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", *(ptr+ii));
  }
  printf("\n");

  /* array indexing with a pointer variable*/
  printf("array indexing with a pointer variable:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", ptr[ii]);
  }
  printf("\n");

  /* pointer arithmetic with an array name*/
  printf("pointer arithmetic with an array name:\n  ");
  for(ii=0;ii<5;ii++) {
    printf("%d ", *(arr+ii));
  }
  printf("\n");

  printf("Are arrays and pointers the same?\n");
  printf("  size of arr=%d\n", sizeof(arr));
  printf("  size of ptr=%d\n", sizeof(ptr));

  ptr=&ii;
  /*  arr=&ii; */

  return 0;
}
