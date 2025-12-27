#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    FILE *fp;
    int res;

    openlog(NULL, 0, LOG_USER);

    if( argc < 3 )
    {
        printf("Usage: %s <writefile> <writestr>\n", argv[0]);
        syslog(LOG_ERR, "Invalid number of argument");
        return 1;
    }

    fp = fopen( argv[1], "wa");
    if( fp == NULL)
    {
        printf("Unable to open or create %s", argv[1]);
        syslog(LOG_ERR, "Unable to open or creawte %s", argv[1]);
        return 1;
    }

    res = fputs(argv[2], fp);
    if( res == EOF)
    {
        printf("unable to write to file");
        syslog(LOG_ERR, "Unable to write file.");
        return 1;
    }

    res = fclose(fp);
    if( res == EOF)
    {
        printf("Unable to close file");
        syslog(LOG_ERR, "Unable to close file");
        return 1;
    }

    return 0;
}