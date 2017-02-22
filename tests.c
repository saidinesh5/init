#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

static unsigned int decode_uid(const char *name);

int main(int argc, char *argv[])
{
    printf("decode_uid(\"system\") == 1000 %s\n",
            decode_uid("system") == 1000? "true" : "false");
    printf("decode_uid(\"media\") == 1013 %s\n",
            decode_uid("media") == 1013? "true" : "false");

    return 0;
}
