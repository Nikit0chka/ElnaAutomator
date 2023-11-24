// clang-format off

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "POUS.h"
#include <beremiz/beremiz.h>

#include "iec_types_all.h"
#include "config1.h"

extern PROGRAM0 RESOURCE1__INSTANCE0;

#ifdef DEBUG_PLC
#define err(_PRNTMSG, ...) fprintf(stderr, "[VARIABLES][err][%s:%d]: " _PRNTMSG "\n", __func__, __LINE__, ##__VA_ARGS__)
#else
#define err(_PRNTMSG, ...) fprintf(stderr, "[VARIABLES][err]: " _PRNTMSG "\n", ##__VA_ARGS__)
#endif // DEBUG_PLC

void UnpackVar(void* varp, __IEC_types_enum vartype, void **value_p, void **f_value_p, uint8_t **flags);

int __variables_init_PROGRAM0(){
  iec_var_t *st;

  PROGRAM0 *p_PROGRAM0;
  DINT *p_DINT;
  REAL *p_REAL;
  BOOL *p_BOOL;
  LREAL *p_LREAL;
  UINT *p_UINT;
  UDINT *p_UDINT;

  { //    0 PROGRAM0.VAR0
    st = getVariable(0);
    memcpy(st->IEC_TYPE, "DINT", 4);
    memcpy(st->IEC_VAR_NAME, "PROGRAM0.VAR0", 13);
    st->size_data = sizeof(DINT);
    p_PROGRAM0 = &RESOURCE1__INSTANCE0;
    p_DINT = (DINT*)&p_PROGRAM0->VAR0;
    UnpackVar(p_DINT, DINT_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }

  return 0;
}

// clang-format on
