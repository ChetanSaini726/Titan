#include <Titan.hpp>

#include <stdio.h>

int main()
{
    printf("Editor Initialized!");

    Titan::TitanApp TitanEditor;
    TitanEditor.TitanMain();

    printf("Editor Shutdown!");
    return 0;
}