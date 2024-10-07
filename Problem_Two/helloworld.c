#include <stdio.h>
#include <stdlib.h>

// Matthew Dingman
// Helloworld Script
//
// This script takes one argument, and prints "Hello World!" that many times with a for loop.
//
// Example Invocation: ./helloworld 3

int main(int argc, char *argv[]){
	if (atoi(argv[1]) < 0) {
		printf("This is an invalid argument.");
		return 1;
	}
	for (int i = 0; i < atoi(argv[1]); i++)
		printf("Hello World!\n");
	return 0;
}
