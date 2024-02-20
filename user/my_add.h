#pragma once

#define BUFF_LEN 24

void my_add(char* buff) {
	char* p = strchr(buff, (int)' ');
    if (p == 0) {
        fprintf(2, "There is no space!\n");
        return;
    }
    if (p - buff > 10 || strlen(p + 1) > 10) {
        fprintf(2, "Arguments must be integers!\n");
        return;
    }
    for (int i = 0; buff[i] != '\0'; ++i) {
        if ( buff[i] != 32 && buff[i] != 0 && (buff[i] > 57 || buff[i] < 48) ) {
            fprintf(2, "Arguments must be integers separated with space!\n");
            return;
        }
    }
    if(strchr(p + 1, (int)' ') != 0) {
        fprintf(2, "Function get more than two arguments!");
        return;
    }

    *p = '\0';

    int d1 = atoi(buff);
    int d2 = atoi(p + 1);

	int res = add(d1, d2);
	
    printf("%d\n", res);
}
