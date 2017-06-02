#include<stdio.h>

int main() {
  int num = 3;   /* integer */
  int *ptr = &num;  /* pointer to integer */

  /* & - reference operator - returns the address */
  /* * - dereference operator */

  printf("num=%d, %p, %d\n", num, (void *) &num, sizeof(num));
  printf("ptr=%p, %p, %d *p=%d\n", (void *) ptr, (void *) &ptr, sizeof(ptr), *ptr);

  *ptr = 20;
  printf("\n*ptr = 20\n");
  printf("num=%d, %p, %d\n", num, (void *) &num, sizeof(num));
  printf("ptr=%p, %p, %d *p=%d\n", (void *) ptr, (void *) &ptr, sizeof(ptr), *ptr);

  return 0;
}
