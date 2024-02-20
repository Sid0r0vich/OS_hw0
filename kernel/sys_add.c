#include "types.h"
#include "riscv.h"
#include "defs.h"

uint64 sys_add(void) {
	int arg1, arg2;
	argint(0, &arg1);
	argint(1, &arg2);

	return arg1 + arg2;
}
