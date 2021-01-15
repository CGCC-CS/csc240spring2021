#include<stdio.h>
#include<string.h>

#define LENGTH 15

typedef struct {
	int x;
	char n[LENGTH];
} csc240_t;

int main() {
	int num = 0;
	int array[10] = {1,2,3,4,5,6,7,8,9,10};
	char c = 'A';

	char str1[] = "CSC240";

	int * iPtr;
	char * cPtr;

	csc240_t structVar = {40, "Struct"};
	csc240_t * structPtr = &structVar;

	for(int ii=0;ii<10;ii++) {
		printf("Number %d = %d\n", ii, array[ii]);
		num += ii;
	}
	printf("\n");

	printf("num=%d %o %x %X\n", num, num, num, num);
	printf("\n");

	printf("char = %c  %d %X\n", c, c, c);
	printf("char+10 = %c %d\n", c+10, c+10);
	printf("'I' + '!' = %c %d\n", 'I' + '!', 'I' + '!');
	for(int ii=0;ii<=10;ii++) {
		printf("%c ", c + ii);
	}
	printf("\n\n");

	/* Printing a string */
	printf("As a character: %c\n", str1[0]);
	printf("As a string: %s\n", str1);

	/* Pointers */
	iPtr = &num;
	printf("iPtr=%p  address=%p   *iPtr=%d\n", (void*) iPtr, (void*) &iPtr, *iPtr);
	printf("\n");

	/* Use a char pointer to go through a string */
	cPtr = str1;
	printf("Print string using a pointer: ");
	while(*cPtr != '\0') {
		putchar(*cPtr);
		cPtr ++;
	}
	printf("\n\n");
	

	/* Working with structs */
	printf("Structure: %d %s\n", structVar.x, structVar.n);
	printf("Structure(using pointer): %d %s\n", structPtr->x, structPtr->n);

	printf("\nChanging a structure with a variable:\n");
	structVar.x = 30;
	/* structVar.n = "NewString"; */
	strncpy(structVar.n, "NewString", LENGTH);
	printf("structVar: %d %s\n", structVar.x, structVar.n);

	printf("\nChanging a structure with a variable:\n");
	structPtr->x = 75;
	strncpy(structPtr->n, "PointerFun", LENGTH);
	printf("structVar: %d %s\n", structVar.x, structVar.n);

	cPtr = str1;
	for (int ii=0;ii<40;ii++) {
		printf("[%d] *cPtr=%c %d \n", ii, *cPtr, *cPtr);
		cPtr ++;
	}

	return 0;
}
