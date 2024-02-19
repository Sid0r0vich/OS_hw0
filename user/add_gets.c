#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

#include "user/my_add.h"

int main(int argc, char *argv[]) {
    char buff[BUFF_LEN];

    gets(buff, BUFF_LEN);
    char* p = strchr(buff, (int)'\n');
    *p = '\0';
    
    my_add(buff);

    return 0;
}
