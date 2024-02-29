#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

#include "user/my_add.c"

#define LEN 24

int main(int argc, char *argv[]) {
    char buff[LEN];

    // read
    int n = 0;
    char c;
    for (int i = 0; i < LEN - 1; ++i) {
    	n = read(0, &c, 1);
    	if (n <= 0) break;
    	buff[i] = c;
    	if (c == '\n' || c == '\r') {
    	    buff[i] = '\n';
    	    break;
    	}
    }
   
    if (n < 0) {
    	fprintf(2, "Read error!");
    	return 0;
    }

    if (n > 0) *strchr(buff, (int)'\n') = '\0';
    else printf("\n");
    
    my_add(buff);

    return 0;
}
