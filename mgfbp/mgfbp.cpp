// mgfbp.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "FbpClass.cuh"


int main(int argc, char* argv[])
{
	namespace mg = mango;

	if (argc == 1)
	{
		fprintf(stderr, "No config files!\n");
		return -1;
	}

	for (int idx = 1; idx < argc; idx++)
	{
		mg::FbpClass fbp;
		fbp.ReadConfigFile(argv[idx]);

		fbp.InitParam();
	}




	printf("Press any key to continue.\n");
	_getch();
    return 0;
}

