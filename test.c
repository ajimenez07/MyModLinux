#include <sys/syscall.h>
#include <linux/types.h>
#include <unistd.h>

#include <stdio.h>

#define SYS_GETFREERAM 470

int
main ()
{
  __kernel_ulong_t freeram;
  syscall(SYS_GETFREERAM, &freeram);

  printf("Free ram: %lu bytes\n", (unsigned long) freeram);
}
