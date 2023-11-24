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

int __variables_init_(){
  iec_var_t *st;

  PROGRAM0 *p_PROGRAM0;
  DINT *p_DINT;
  REAL *p_REAL;
  BOOL *p_BOOL;
  LREAL *p_LREAL;
  UINT *p_UINT;
  UDINT *p_UDINT;

  { //    1 RESOURCE1.GMAINT_TIME
    st = getVariable(1);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GMAINT_TIME", 21);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__GMAINT_TIME;
    p_REAL = (REAL*)&RESOURCE1__GMAINT_TIME;
    UnpackVar(p_REAL, REAL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    2 RESOURCE1.CUR_CYCLE
    st = getVariable(2);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.CUR_CYCLE", 19);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__CUR_CYCLE;
    p_REAL = (REAL*)&RESOURCE1__CUR_CYCLE;
    UnpackVar(p_REAL, REAL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    3 RESOURCE1.GSTART_TMR
    st = getVariable(3);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GSTART_TMR", 20);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__GSTART_TMR;
    p_REAL = (REAL*)&RESOURCE1__GSTART_TMR;
    UnpackVar(p_REAL, REAL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    4 RESOURCE1.REQ_CYCLE
    st = getVariable(4);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.REQ_CYCLE", 19);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__REQ_CYCLE;
    p_REAL = (REAL*)&RESOURCE1__REQ_CYCLE;
    UnpackVar(p_REAL, REAL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    5 RESOURCE1.GF_T_100MSEC
    st = getVariable(5);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GF_T_100MSEC", 22);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__GF_T_100MSEC;
    p_BOOL = (BOOL*)&RESOURCE1__GF_T_100MSEC;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    6 RESOURCE1.GT_1SEC
    st = getVariable(6);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GT_1SEC", 17);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__GT_1SEC;
    p_BOOL = (BOOL*)&RESOURCE1__GT_1SEC;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    7 RESOURCE1.GF_T_1SEC
    st = getVariable(7);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GF_T_1SEC", 19);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__GF_T_1SEC;
    p_BOOL = (BOOL*)&RESOURCE1__GF_T_1SEC;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    8 RESOURCE1.GT_1MIN
    st = getVariable(8);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GT_1MIN", 17);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__GT_1MIN;
    p_BOOL = (BOOL*)&RESOURCE1__GT_1MIN;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //    9 RESOURCE1.GR_T_1MIN
    st = getVariable(9);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GR_T_1MIN", 19);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__GR_T_1MIN;
    p_BOOL = (BOOL*)&RESOURCE1__GR_T_1MIN;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   10 RESOURCE1.GF_T_1MIN
    st = getVariable(10);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.GF_T_1MIN", 19);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__GF_T_1MIN;
    p_BOOL = (BOOL*)&RESOURCE1__GF_T_1MIN;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   11 RESOURCE1.T_1SEC
    st = getVariable(11);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.T_1SEC", 16);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__T_1SEC;
    p_REAL = (REAL*)&RESOURCE1__T_1SEC;
    UnpackVar(p_REAL, REAL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   12 RESOURCE1.DEL_T
    st = getVariable(12);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DEL_T", 15);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__DEL_T;
    p_REAL = (REAL*)&RESOURCE1__DEL_T;
    UnpackVar(p_REAL, REAL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   13 RESOURCE1.NOTHASREZERVNU
    st = getVariable(13);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.NOTHASREZERVNU", 24);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__NOTHASREZERVNU;
    p_BOOL = (BOOL*)&RESOURCE1__NOTHASREZERVNU;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   14 RESOURCE1.RESET_HASNU
    st = getVariable(14);
    memcpy(st->IEC_TYPE, "BOOL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.RESET_HASNU", 21);
    st->size_data = sizeof(BOOL);
    extern BOOL RESOURCE1__RESET_HASNU;
    p_BOOL = (BOOL*)&RESOURCE1__RESET_HASNU;
    UnpackVar(p_BOOL, BOOL_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   15 RESOURCE1.AI_A1_HA
    st = getVariable(15);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_HA", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_HA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_HA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   16 RESOURCE1.AI_A1_HL
    st = getVariable(16);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_HL", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_HL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_HL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   17 RESOURCE1.AI_A1_HW
    st = getVariable(17);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_HW", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_HW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_HW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   18 RESOURCE1.AI_A1_LA
    st = getVariable(18);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_LA", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_LA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_LA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   19 RESOURCE1.AI_A1_LL
    st = getVariable(19);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_LL", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_LL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_LL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   20 RESOURCE1.AI_A1_LW
    st = getVariable(20);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_LW", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_LW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_LW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   21 RESOURCE1.AI_A1_COMMAND
    st = getVariable(21);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_COMMAND", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__AI_A1_COMMAND;
    p_UINT = (UINT*)&RESOURCE1__AI_A1_COMMAND;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   22 RESOURCE1.AI_A1_NEWHA
    st = getVariable(22);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_NEWHA", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_NEWHA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_NEWHA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   23 RESOURCE1.AI_A1_NEWHL
    st = getVariable(23);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_NEWHL", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_NEWHL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_NEWHL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   24 RESOURCE1.AI_A1_NEWHW
    st = getVariable(24);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_NEWHW", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_NEWHW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_NEWHW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   25 RESOURCE1.AI_A1_NEWLA
    st = getVariable(25);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_NEWLA", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_NEWLA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_NEWLA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   26 RESOURCE1.AI_A1_NEWLL
    st = getVariable(26);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_NEWLL", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_NEWLL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_NEWLL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   27 RESOURCE1.AI_A1_NEWLW
    st = getVariable(27);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_NEWLW", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_NEWLW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_NEWLW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   28 RESOURCE1.AI_A1_STATUS
    st = getVariable(28);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_STATUS", 22);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__AI_A1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__AI_A1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   29 RESOURCE1.AI_A1_VALUE
    st = getVariable(29);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A1_VALUE", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A1_VALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A1_VALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   30 RESOURCE1.AI_A2_HA
    st = getVariable(30);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_HA", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_HA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_HA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   31 RESOURCE1.AI_A2_HL
    st = getVariable(31);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_HL", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_HL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_HL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   32 RESOURCE1.AI_A2_HW
    st = getVariable(32);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_HW", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_HW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_HW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   33 RESOURCE1.AI_A2_LA
    st = getVariable(33);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_LA", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_LA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_LA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   34 RESOURCE1.AI_A2_LL
    st = getVariable(34);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_LL", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_LL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_LL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   35 RESOURCE1.AI_A2_LW
    st = getVariable(35);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_LW", 18);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_LW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_LW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   36 RESOURCE1.AI_A2_COMMAND
    st = getVariable(36);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_COMMAND", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__AI_A2_COMMAND;
    p_UINT = (UINT*)&RESOURCE1__AI_A2_COMMAND;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   37 RESOURCE1.AI_A2_NEWHA
    st = getVariable(37);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_NEWHA", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_NEWHA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_NEWHA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   38 RESOURCE1.AI_A2_NEWHL
    st = getVariable(38);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_NEWHL", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_NEWHL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_NEWHL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   39 RESOURCE1.AI_A2_NEWHW
    st = getVariable(39);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_NEWHW", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_NEWHW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_NEWHW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   40 RESOURCE1.AI_A2_NEWLA
    st = getVariable(40);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_NEWLA", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_NEWLA;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_NEWLA;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   41 RESOURCE1.AI_A2_NEWLL
    st = getVariable(41);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_NEWLL", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_NEWLL;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_NEWLL;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   42 RESOURCE1.AI_A2_NEWLW
    st = getVariable(42);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_NEWLW", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_NEWLW;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_NEWLW;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   43 RESOURCE1.AI_A2_STATUS
    st = getVariable(43);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_STATUS", 22);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__AI_A2_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__AI_A2_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   44 RESOURCE1.AI_A2_VALUE
    st = getVariable(44);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_A2_VALUE", 21);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_A2_VALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_A2_VALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   45 RESOURCE1.A1_10_ERR_MODE
    st = getVariable(45);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_10_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_10_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_10_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   46 RESOURCE1.A1_11_ERR_MODE
    st = getVariable(46);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_11_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_11_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_11_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   47 RESOURCE1.A1_12_ERR_MODE
    st = getVariable(47);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_12_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_12_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_12_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   48 RESOURCE1.A1_13_ERR_MODE
    st = getVariable(48);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_13_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_13_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_13_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   49 RESOURCE1.A1_14_ERR_MODE
    st = getVariable(49);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_14_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_14_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_14_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   50 RESOURCE1.A1_15_ERR_MODE
    st = getVariable(50);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_15_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_15_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_15_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   51 RESOURCE1.A1_1_ERR_MODE
    st = getVariable(51);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_1_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_1_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_1_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   52 RESOURCE1.A1_2_ERR_MODE
    st = getVariable(52);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_2_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_2_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_2_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   53 RESOURCE1.A1_3_ERR_MODE
    st = getVariable(53);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_3_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_3_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_3_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   54 RESOURCE1.A1_4_ERR_MODE
    st = getVariable(54);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_4_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_4_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_4_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   55 RESOURCE1.A1_5_ERR_MODE
    st = getVariable(55);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_5_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_5_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_5_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   56 RESOURCE1.A1_6_ERR_MODE
    st = getVariable(56);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_6_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_6_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_6_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   57 RESOURCE1.A1_7_ERR_MODE
    st = getVariable(57);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_7_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_7_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_7_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   58 RESOURCE1.A1_8_ERR_MODE
    st = getVariable(58);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_8_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_8_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_8_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   59 RESOURCE1.A1_9_ERR_MODE
    st = getVariable(59);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A1_9_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A1_9_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A1_9_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   60 RESOURCE1.A2_10_ERR_MODE
    st = getVariable(60);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_10_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_10_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_10_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   61 RESOURCE1.A2_11_ERR_MODE
    st = getVariable(61);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_11_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_11_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_11_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   62 RESOURCE1.A2_12_ERR_MODE
    st = getVariable(62);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_12_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_12_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_12_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   63 RESOURCE1.A2_13_ERR_MODE
    st = getVariable(63);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_13_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_13_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_13_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   64 RESOURCE1.A2_14_ERR_MODE
    st = getVariable(64);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_14_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_14_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_14_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   65 RESOURCE1.A2_15_ERR_MODE
    st = getVariable(65);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_15_ERR_MODE", 24);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_15_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_15_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   66 RESOURCE1.A2_1_ERR_MODE
    st = getVariable(66);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_1_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_1_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_1_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   67 RESOURCE1.A2_2_ERR_MODE
    st = getVariable(67);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_2_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_2_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_2_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   68 RESOURCE1.A2_3_ERR_MODE
    st = getVariable(68);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_3_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_3_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_3_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   69 RESOURCE1.A2_4_ERR_MODE
    st = getVariable(69);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_4_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_4_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_4_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   70 RESOURCE1.A2_5_ERR_MODE
    st = getVariable(70);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_5_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_5_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_5_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   71 RESOURCE1.A2_6_ERR_MODE
    st = getVariable(71);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_6_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_6_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_6_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   72 RESOURCE1.A2_7_ERR_MODE
    st = getVariable(72);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_7_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_7_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_7_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   73 RESOURCE1.A2_8_ERR_MODE
    st = getVariable(73);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_8_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_8_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_8_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   74 RESOURCE1.A2_9_ERR_MODE
    st = getVariable(74);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.A2_9_ERR_MODE", 23);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__A2_9_ERR_MODE;
    p_UINT = (UINT*)&RESOURCE1__A2_9_ERR_MODE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   75 RESOURCE1.AI_0_DBLVALUE
    st = getVariable(75);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_0_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_0_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_0_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   76 RESOURCE1.AI_10_DBLVALUE
    st = getVariable(76);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_10_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_10_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_10_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   77 RESOURCE1.AI_11_DBLVALUE
    st = getVariable(77);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_11_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_11_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_11_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   78 RESOURCE1.AI_12_DBLVALUE
    st = getVariable(78);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_12_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_12_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_12_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   79 RESOURCE1.AI_13_DBLVALUE
    st = getVariable(79);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_13_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_13_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_13_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   80 RESOURCE1.AI_14_DBLVALUE
    st = getVariable(80);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_14_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_14_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_14_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   81 RESOURCE1.AI_15_DBLVALUE
    st = getVariable(81);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_15_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_15_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_15_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   82 RESOURCE1.AI_16_DBLVALUE
    st = getVariable(82);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_16_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_16_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_16_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   83 RESOURCE1.AI_17_DBLVALUE
    st = getVariable(83);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_17_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_17_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_17_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   84 RESOURCE1.AI_18_DBLVALUE
    st = getVariable(84);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_18_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_18_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_18_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   85 RESOURCE1.AI_19_DBLVALUE
    st = getVariable(85);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_19_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_19_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_19_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   86 RESOURCE1.AI_1_DBLVALUE
    st = getVariable(86);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_1_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_1_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_1_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   87 RESOURCE1.AI_20_DBLVALUE
    st = getVariable(87);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_20_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_20_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_20_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   88 RESOURCE1.AI_21_DBLVALUE
    st = getVariable(88);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_21_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_21_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_21_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   89 RESOURCE1.AI_22_DBLVALUE
    st = getVariable(89);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_22_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_22_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_22_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   90 RESOURCE1.AI_23_DBLVALUE
    st = getVariable(90);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_23_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_23_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_23_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   91 RESOURCE1.AI_24_DBLVALUE
    st = getVariable(91);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_24_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_24_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_24_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   92 RESOURCE1.AI_25_DBLVALUE
    st = getVariable(92);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_25_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_25_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_25_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   93 RESOURCE1.AI_26_DBLVALUE
    st = getVariable(93);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_26_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_26_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_26_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   94 RESOURCE1.AI_27_DBLVALUE
    st = getVariable(94);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_27_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_27_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_27_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   95 RESOURCE1.AI_28_DBLVALUE
    st = getVariable(95);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_28_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_28_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_28_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   96 RESOURCE1.AI_29_DBLVALUE
    st = getVariable(96);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_29_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_29_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_29_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   97 RESOURCE1.AI_2_DBLVALUE
    st = getVariable(97);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_2_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_2_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_2_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   98 RESOURCE1.AI_30_DBLVALUE
    st = getVariable(98);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_30_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_30_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_30_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //   99 RESOURCE1.AI_31_DBLVALUE
    st = getVariable(99);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_31_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_31_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_31_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  100 RESOURCE1.AI_32_DBLVALUE
    st = getVariable(100);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_32_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_32_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_32_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  101 RESOURCE1.AI_33_DBLVALUE
    st = getVariable(101);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_33_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_33_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_33_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  102 RESOURCE1.AI_34_DBLVALUE
    st = getVariable(102);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_34_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_34_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_34_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  103 RESOURCE1.AI_35_DBLVALUE
    st = getVariable(103);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_35_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_35_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_35_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  104 RESOURCE1.AI_36_DBLVALUE
    st = getVariable(104);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_36_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_36_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_36_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  105 RESOURCE1.AI_37_DBLVALUE
    st = getVariable(105);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_37_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_37_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_37_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  106 RESOURCE1.AI_38_DBLVALUE
    st = getVariable(106);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_38_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_38_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_38_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  107 RESOURCE1.AI_39_DBLVALUE
    st = getVariable(107);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_39_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_39_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_39_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  108 RESOURCE1.AI_3_DBLVALUE
    st = getVariable(108);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_3_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_3_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_3_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  109 RESOURCE1.AI_40_DBLVALUE
    st = getVariable(109);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_40_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_40_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_40_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  110 RESOURCE1.AI_41_DBLVALUE
    st = getVariable(110);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_41_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_41_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_41_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  111 RESOURCE1.AI_42_DBLVALUE
    st = getVariable(111);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_42_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_42_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_42_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  112 RESOURCE1.AI_43_DBLVALUE
    st = getVariable(112);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_43_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_43_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_43_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  113 RESOURCE1.AI_44_DBLVALUE
    st = getVariable(113);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_44_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_44_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_44_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  114 RESOURCE1.AI_45_DBLVALUE
    st = getVariable(114);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_45_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_45_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_45_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  115 RESOURCE1.AI_46_DBLVALUE
    st = getVariable(115);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_46_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_46_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_46_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  116 RESOURCE1.AI_47_DBLVALUE
    st = getVariable(116);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_47_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_47_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_47_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  117 RESOURCE1.AI_48_DBLVALUE
    st = getVariable(117);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_48_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_48_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_48_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  118 RESOURCE1.AI_49_DBLVALUE
    st = getVariable(118);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_49_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_49_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_49_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  119 RESOURCE1.AI_4_DBLVALUE
    st = getVariable(119);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_4_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_4_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_4_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  120 RESOURCE1.AI_50_DBLVALUE
    st = getVariable(120);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_50_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_50_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_50_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  121 RESOURCE1.AI_51_DBLVALUE
    st = getVariable(121);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_51_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_51_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_51_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  122 RESOURCE1.AI_52_DBLVALUE
    st = getVariable(122);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_52_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_52_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_52_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  123 RESOURCE1.AI_53_DBLVALUE
    st = getVariable(123);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_53_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_53_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_53_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  124 RESOURCE1.AI_54_DBLVALUE
    st = getVariable(124);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_54_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_54_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_54_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  125 RESOURCE1.AI_55_DBLVALUE
    st = getVariable(125);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_55_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_55_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_55_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  126 RESOURCE1.AI_56_DBLVALUE
    st = getVariable(126);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_56_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_56_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_56_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  127 RESOURCE1.AI_57_DBLVALUE
    st = getVariable(127);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_57_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_57_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_57_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  128 RESOURCE1.AI_58_DBLVALUE
    st = getVariable(128);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_58_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_58_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_58_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  129 RESOURCE1.AI_59_DBLVALUE
    st = getVariable(129);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_59_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_59_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_59_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  130 RESOURCE1.AI_5_DBLVALUE
    st = getVariable(130);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_5_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_5_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_5_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  131 RESOURCE1.AI_60_DBLVALUE
    st = getVariable(131);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_60_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_60_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_60_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  132 RESOURCE1.AI_61_DBLVALUE
    st = getVariable(132);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_61_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_61_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_61_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  133 RESOURCE1.AI_62_DBLVALUE
    st = getVariable(133);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_62_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_62_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_62_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  134 RESOURCE1.AI_63_DBLVALUE
    st = getVariable(134);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_63_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_63_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_63_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  135 RESOURCE1.AI_64_DBLVALUE
    st = getVariable(135);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_64_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_64_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_64_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  136 RESOURCE1.AI_65_DBLVALUE
    st = getVariable(136);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_65_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_65_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_65_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  137 RESOURCE1.AI_66_DBLVALUE
    st = getVariable(137);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_66_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_66_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_66_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  138 RESOURCE1.AI_67_DBLVALUE
    st = getVariable(138);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_67_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_67_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_67_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  139 RESOURCE1.AI_68_DBLVALUE
    st = getVariable(139);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_68_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_68_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_68_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  140 RESOURCE1.AI_69_DBLVALUE
    st = getVariable(140);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_69_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_69_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_69_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  141 RESOURCE1.AI_6_DBLVALUE
    st = getVariable(141);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_6_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_6_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_6_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  142 RESOURCE1.AI_70_DBLVALUE
    st = getVariable(142);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_70_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_70_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_70_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  143 RESOURCE1.AI_71_DBLVALUE
    st = getVariable(143);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_71_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_71_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_71_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  144 RESOURCE1.AI_72_DBLVALUE
    st = getVariable(144);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_72_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_72_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_72_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  145 RESOURCE1.AI_73_DBLVALUE
    st = getVariable(145);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_73_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_73_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_73_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  146 RESOURCE1.AI_74_DBLVALUE
    st = getVariable(146);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_74_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_74_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_74_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  147 RESOURCE1.AI_75_DBLVALUE
    st = getVariable(147);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_75_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_75_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_75_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  148 RESOURCE1.AI_76_DBLVALUE
    st = getVariable(148);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_76_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_76_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_76_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  149 RESOURCE1.AI_77_DBLVALUE
    st = getVariable(149);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_77_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_77_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_77_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  150 RESOURCE1.AI_78_DBLVALUE
    st = getVariable(150);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_78_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_78_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_78_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  151 RESOURCE1.AI_79_DBLVALUE
    st = getVariable(151);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_79_DBLVALUE", 24);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_79_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_79_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  152 RESOURCE1.AI_7_DBLVALUE
    st = getVariable(152);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_7_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_7_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_7_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  153 RESOURCE1.AI_8_DBLVALUE
    st = getVariable(153);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_8_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_8_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_8_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  154 RESOURCE1.AI_9_DBLVALUE
    st = getVariable(154);
    memcpy(st->IEC_TYPE, "LREAL", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.AI_9_DBLVALUE", 23);
    st->size_data = sizeof(LREAL);
    extern LREAL RESOURCE1__AI_9_DBLVALUE;
    p_LREAL = (LREAL*)&RESOURCE1__AI_9_DBLVALUE;
    UnpackVar(p_LREAL, LREAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  155 RESOURCE1.BS_CORE1
    st = getVariable(155);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.BS_CORE1", 18);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__BS_CORE1;
    p_REAL = (REAL*)&RESOURCE1__BS_CORE1;
    UnpackVar(p_REAL, REAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  156 RESOURCE1.BS_CORE2
    st = getVariable(156);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.BS_CORE2", 18);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__BS_CORE2;
    p_REAL = (REAL*)&RESOURCE1__BS_CORE2;
    UnpackVar(p_REAL, REAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  157 RESOURCE1.BS_CORE3
    st = getVariable(157);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.BS_CORE3", 18);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__BS_CORE3;
    p_REAL = (REAL*)&RESOURCE1__BS_CORE3;
    UnpackVar(p_REAL, REAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  158 RESOURCE1.BS_CORE4
    st = getVariable(158);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.BS_CORE4", 18);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__BS_CORE4;
    p_REAL = (REAL*)&RESOURCE1__BS_CORE4;
    UnpackVar(p_REAL, REAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  159 RESOURCE1.BS_FREEMEMORY
    st = getVariable(159);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.BS_FREEMEMORY", 23);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__BS_FREEMEMORY;
    p_REAL = (REAL*)&RESOURCE1__BS_FREEMEMORY;
    UnpackVar(p_REAL, REAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  160 RESOURCE1.BS_TEMP1
    st = getVariable(160);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.BS_TEMP1", 18);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__BS_TEMP1;
    p_REAL = (REAL*)&RESOURCE1__BS_TEMP1;
    UnpackVar(p_REAL, REAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  161 RESOURCE1.BS_TEMP2
    st = getVariable(161);
    memcpy(st->IEC_TYPE, "REAL", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.BS_TEMP2", 18);
    st->size_data = sizeof(REAL);
    extern REAL RESOURCE1__BS_TEMP2;
    p_REAL = (REAL*)&RESOURCE1__BS_TEMP2;
    UnpackVar(p_REAL, REAL_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  162 RESOURCE1.DI_0_1_WVALUE
    st = getVariable(162);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_0_1_WVALUE", 23);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_0_1_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_0_1_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  163 RESOURCE1.DI_10_11_WVALUE
    st = getVariable(163);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_10_11_WVALUE", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_10_11_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_10_11_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  164 RESOURCE1.DI_12_13_WVALUE
    st = getVariable(164);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_12_13_WVALUE", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_12_13_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_12_13_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  165 RESOURCE1.DI_14_15_WVALUE
    st = getVariable(165);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_14_15_WVALUE", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_14_15_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_14_15_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  166 RESOURCE1.DI_16_17_WVALUE
    st = getVariable(166);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_16_17_WVALUE", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_16_17_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_16_17_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  167 RESOURCE1.DI_18_19_WVALUE
    st = getVariable(167);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_18_19_WVALUE", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_18_19_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_18_19_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  168 RESOURCE1.DI_20_21_WVALUE
    st = getVariable(168);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_20_21_WVALUE", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_20_21_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_20_21_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  169 RESOURCE1.DI_2_3_WVALUE
    st = getVariable(169);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_2_3_WVALUE", 23);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_2_3_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_2_3_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  170 RESOURCE1.DI_4_5_WVALUE
    st = getVariable(170);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_4_5_WVALUE", 23);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_4_5_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_4_5_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  171 RESOURCE1.DI_6_7_WVALUE
    st = getVariable(171);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_6_7_WVALUE", 23);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_6_7_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_6_7_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  172 RESOURCE1.DI_8_9_WVALUE
    st = getVariable(172);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DI_8_9_WVALUE", 23);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__DI_8_9_WVALUE;
    p_UDINT = (UDINT*)&RESOURCE1__DI_8_9_WVALUE;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  173 RESOURCE1.DO_0_WVALUE
    st = getVariable(173);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DO_0_WVALUE", 21);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__DO_0_WVALUE;
    p_UINT = (UINT*)&RESOURCE1__DO_0_WVALUE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  174 RESOURCE1.DO_1_WVALUE
    st = getVariable(174);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DO_1_WVALUE", 21);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__DO_1_WVALUE;
    p_UINT = (UINT*)&RESOURCE1__DO_1_WVALUE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  175 RESOURCE1.DO_2_WVALUE
    st = getVariable(175);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DO_2_WVALUE", 21);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__DO_2_WVALUE;
    p_UINT = (UINT*)&RESOURCE1__DO_2_WVALUE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  176 RESOURCE1.DO_3_WVALUE
    st = getVariable(176);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DO_3_WVALUE", 21);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__DO_3_WVALUE;
    p_UINT = (UINT*)&RESOURCE1__DO_3_WVALUE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  177 RESOURCE1.DO_4_WVALUE
    st = getVariable(177);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DO_4_WVALUE", 21);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__DO_4_WVALUE;
    p_UINT = (UINT*)&RESOURCE1__DO_4_WVALUE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  178 RESOURCE1.DO_5_WVALUE
    st = getVariable(178);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.DO_5_WVALUE", 21);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__DO_5_WVALUE;
    p_UINT = (UINT*)&RESOURCE1__DO_5_WVALUE;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  179 RESOURCE1.IM_AVOM1_INCOMMAND_ARM
    st = getVariable(179);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM1_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_AVOM1_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_AVOM1_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  180 RESOURCE1.IM_AVOM1_STATUS
    st = getVariable(180);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM1_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_AVOM1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_AVOM1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  181 RESOURCE1.IM_AVOM2_INCOMMAND_ARM
    st = getVariable(181);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM2_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_AVOM2_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_AVOM2_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  182 RESOURCE1.IM_AVOM2_STATUS
    st = getVariable(182);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM2_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_AVOM2_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_AVOM2_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  183 RESOURCE1.IM_AVOM3_INCOMMAND_ARM
    st = getVariable(183);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM3_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_AVOM3_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_AVOM3_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  184 RESOURCE1.IM_AVOM3_STATUS
    st = getVariable(184);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM3_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_AVOM3_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_AVOM3_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  185 RESOURCE1.IM_AVOM4_INCOMMAND_ARM
    st = getVariable(185);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM4_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_AVOM4_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_AVOM4_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  186 RESOURCE1.IM_AVOM4_STATUS
    st = getVariable(186);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_AVOM4_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_AVOM4_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_AVOM4_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  187 RESOURCE1.IM_KRAN1_INCOMMAND_ARM
    st = getVariable(187);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN1_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_KRAN1_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_KRAN1_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  188 RESOURCE1.IM_KRAN1_STATUS
    st = getVariable(188);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN1_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_KRAN1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_KRAN1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  189 RESOURCE1.IM_KRAN2_INCOMMAND_ARM
    st = getVariable(189);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN2_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_KRAN2_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_KRAN2_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  190 RESOURCE1.IM_KRAN2_STATUS
    st = getVariable(190);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN2_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_KRAN2_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_KRAN2_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  191 RESOURCE1.IM_KRAN3_INCOMMAND_ARM
    st = getVariable(191);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN3_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_KRAN3_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_KRAN3_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  192 RESOURCE1.IM_KRAN3_STATUS
    st = getVariable(192);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN3_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_KRAN3_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_KRAN3_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  193 RESOURCE1.IM_KRAN4_INCOMMAND_ARM
    st = getVariable(193);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN4_INCOMMAND_ARM", 32);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_KRAN4_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_KRAN4_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  194 RESOURCE1.IM_KRAN4_STATUS
    st = getVariable(194);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_KRAN4_STATUS", 25);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_KRAN4_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_KRAN4_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  195 RESOURCE1.IM_MV_INCOMMAND_ARM
    st = getVariable(195);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_MV_INCOMMAND_ARM", 29);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_MV_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_MV_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  196 RESOURCE1.IM_MV_STATUS
    st = getVariable(196);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_MV_STATUS", 22);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_MV_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_MV_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  197 RESOURCE1.IM_NU2_INCOMMAND_ARM
    st = getVariable(197);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_NU2_INCOMMAND_ARM", 30);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_NU2_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_NU2_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  198 RESOURCE1.IM_NU2_STATUS
    st = getVariable(198);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_NU2_STATUS", 23);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_NU2_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_NU2_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  199 RESOURCE1.IM_NU_INCOMMAND_ARM
    st = getVariable(199);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_NU_INCOMMAND_ARM", 29);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_NU_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_NU_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  200 RESOURCE1.IM_NU_STATUS
    st = getVariable(200);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_NU_STATUS", 22);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_NU_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_NU_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  201 RESOURCE1.IM_SECTIONSWITCH1_INCOMMAND_ARM
    st = getVariable(201);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SECTIONSWITCH1_INCOMMAND_ARM", 41);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__IM_SECTIONSWITCH1_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__IM_SECTIONSWITCH1_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  202 RESOURCE1.IM_SECTIONSWITCH1_STATUS
    st = getVariable(202);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SECTIONSWITCH1_STATUS", 34);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SECTIONSWITCH1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SECTIONSWITCH1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  203 RESOURCE1.IM_SINGLESIGNALS_SI0_STATUS
    st = getVariable(203);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SINGLESIGNALS_SI0_STATUS", 37);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SINGLESIGNALS_SI0_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SINGLESIGNALS_SI0_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  204 RESOURCE1.IM_SINGLESIGNALS_SI1_STATUS
    st = getVariable(204);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SINGLESIGNALS_SI1_STATUS", 37);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SINGLESIGNALS_SI1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SINGLESIGNALS_SI1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  205 RESOURCE1.IM_SINGLESIGNALS_SI2_STATUS
    st = getVariable(205);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SINGLESIGNALS_SI2_STATUS", 37);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SINGLESIGNALS_SI2_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SINGLESIGNALS_SI2_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  206 RESOURCE1.IM_SINGLESIGNALS_SI3_STATUS
    st = getVariable(206);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SINGLESIGNALS_SI3_STATUS", 37);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SINGLESIGNALS_SI3_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SINGLESIGNALS_SI3_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  207 RESOURCE1.IM_SINGLESIGNALS_SI4_STATUS
    st = getVariable(207);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SINGLESIGNALS_SI4_STATUS", 37);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SINGLESIGNALS_SI4_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SINGLESIGNALS_SI4_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  208 RESOURCE1.IM_SINGLESIGNALS_SI5_STATUS
    st = getVariable(208);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SINGLESIGNALS_SI5_STATUS", 37);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SINGLESIGNALS_SI5_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SINGLESIGNALS_SI5_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  209 RESOURCE1.IM_SINGLESIGNALS_SI6_STATUS
    st = getVariable(209);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.IM_SINGLESIGNALS_SI6_STATUS", 37);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__IM_SINGLESIGNALS_SI6_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__IM_SINGLESIGNALS_SI6_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  210 RESOURCE1.PROTECTIONS_AIP1_INCOMMAND_ARM
    st = getVariable(210);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AIP1_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_AIP1_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_AIP1_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  211 RESOURCE1.PROTECTIONS_AIP1_STATUS
    st = getVariable(211);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AIP1_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_AIP1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_AIP1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  212 RESOURCE1.PROTECTIONS_AIP2_INCOMMAND_ARM
    st = getVariable(212);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AIP2_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_AIP2_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_AIP2_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  213 RESOURCE1.PROTECTIONS_AIP2_STATUS
    st = getVariable(213);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AIP2_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_AIP2_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_AIP2_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  214 RESOURCE1.PROTECTIONS_AIP3_INCOMMAND_ARM
    st = getVariable(214);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AIP3_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_AIP3_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_AIP3_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  215 RESOURCE1.PROTECTIONS_AIP3_STATUS
    st = getVariable(215);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AIP3_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_AIP3_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_AIP3_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  216 RESOURCE1.PROTECTIONS_AP1_INCOMMAND_ARM
    st = getVariable(216);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AP1_INCOMMAND_ARM", 39);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_AP1_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_AP1_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  217 RESOURCE1.PROTECTIONS_AP1_STATUS
    st = getVariable(217);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_AP1_STATUS", 32);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_AP1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_AP1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  218 RESOURCE1.PROTECTIONS_DIP1_INCOMMAND_ARM
    st = getVariable(218);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP1_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_DIP1_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_DIP1_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  219 RESOURCE1.PROTECTIONS_DIP1_STATUS
    st = getVariable(219);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP1_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_DIP1_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_DIP1_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  220 RESOURCE1.PROTECTIONS_DIP2_INCOMMAND_ARM
    st = getVariable(220);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP2_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_DIP2_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_DIP2_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  221 RESOURCE1.PROTECTIONS_DIP2_STATUS
    st = getVariable(221);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP2_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_DIP2_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_DIP2_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  222 RESOURCE1.PROTECTIONS_DIP3_INCOMMAND_ARM
    st = getVariable(222);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP3_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_DIP3_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_DIP3_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  223 RESOURCE1.PROTECTIONS_DIP3_STATUS
    st = getVariable(223);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP3_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_DIP3_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_DIP3_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  224 RESOURCE1.PROTECTIONS_DIP4_INCOMMAND_ARM
    st = getVariable(224);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP4_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_DIP4_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_DIP4_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  225 RESOURCE1.PROTECTIONS_DIP4_STATUS
    st = getVariable(225);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP4_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_DIP4_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_DIP4_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  226 RESOURCE1.PROTECTIONS_DIP5_INCOMMAND_ARM
    st = getVariable(226);
    memcpy(st->IEC_TYPE, "UINT", 4);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP5_INCOMMAND_ARM", 40);
    st->size_data = sizeof(UINT);
    extern UINT RESOURCE1__PROTECTIONS_DIP5_INCOMMAND_ARM;
    p_UINT = (UINT*)&RESOURCE1__PROTECTIONS_DIP5_INCOMMAND_ARM;
    UnpackVar(p_UINT, UINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }
  { //  227 RESOURCE1.PROTECTIONS_DIP5_STATUS
    st = getVariable(227);
    memcpy(st->IEC_TYPE, "UDINT", 5);
    memcpy(st->IEC_VAR_NAME, "RESOURCE1.PROTECTIONS_DIP5_STATUS", 33);
    st->size_data = sizeof(UDINT);
    extern UDINT RESOURCE1__PROTECTIONS_DIP5_STATUS;
    p_UDINT = (UDINT*)&RESOURCE1__PROTECTIONS_DIP5_STATUS;
    UnpackVar(p_UDINT, UDINT_O_ENUM, &st->value_p, &st->f_value_p, &st->flags);
  }

  return 0;
}

// clang-format on
