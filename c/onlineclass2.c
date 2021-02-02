#include<stdio.h>
#include<string.h>

#define LENGTH 15

typedef struct {
	int x;
	char n[LENGTH];
} csc240_t;

int main() {

    int num = 0;
	char str1[] = "CSC240";

	int * iPtr;
	char * cPtr;

	csc240_t structVar = {40, "Struct"};
	csc240_t * structPtr = &structVar;

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
