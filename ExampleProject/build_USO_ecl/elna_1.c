#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <dlfcn.h>

#include <beremiz/beremiz.h>

#include "iec_types.h"

#include "POUS.h"
#include "config1.h"
#include "Im_mplc.h"

void WriteToTItemAIN(TITEMAIN *dest, TItemAIN *src);
void WriteToTItemDIN(TITEMDIN *dest, TItemDIN *src);
void WriteToTDoubleData(TDoubleData *dest, TDOUBLEDATA *src);
void WriteToTWordData(TWordData *dest, TWORDDATA *src);


static TITEMAIN *ai_signals[80] = {0};
static TItemAIN ai[80] = {0};
static TITEMDIN *di_signals[22] = {0};
static TItemDIN di[22] = {0};
static TWORDDATA *do_signals[67] = {0};
static TWordData do_sign[67] = {0};
static TDOUBLEDATA *ao_signals[2] = {0};
static TDoubleData ao[2] = {0};
static TITEMDIN *err_signals[67] = {0};
static TItemDIN err[67] = {0};
static TITEMDIN *relst_signals[1] = {0};
static TItemDIN relst[1] = {0};

static TChanAddr Addr1={0};

inline void WriteToTItemAIN(TITEMAIN *dest, TItemAIN *src) {
    dest->WFLAGS = src->wFlags;
    dest->WRESERVED = src->wReserved;
    dest->DBLVALUE = src->dblValue;
    dest->NANOSEC = src->stTime.nanosec;
    dest->RESERVE = src->stTime.reserve;
}

inline void WriteToTItemDIN(TITEMDIN *dest, TItemDIN *src) {
    dest->WFLAGS = src->wFlags;
    dest->WVALUE = src->wValue;
    dest->NANOSEC = src->stTime.nanosec;
    dest->RESERVE = src->stTime.reserve;
}

inline void WriteToTDoubleData(TDoubleData *dest, TDOUBLEDATA *src) {
    dest->wFlags = src->DBLVALUE;
    dest->dblValue = src->DBLVALUE;
}

inline void WriteToTWordData(TWordData *dest, TWORDDATA *src) {
    dest->wFlags  = src->WVALUE;
    dest->wValue = src->WVALUE;
}


int __init_1(start_args_t *args)
{
  ext_library = dlopen("/usr/lib64/elna/libelpk4.64.so",RTLD_LAZY );

  if (!ext_library){
      fprintf(stderr,"dlopen() error: %s\n", dlerror());
      return -1;
  }
  pMPLC_ReadWords=0;
  pMPLC_ReadWords = dlsym(ext_library,"MPLC_ReadWords");

  if(pMPLC_ReadWords)
      printf("Return of pMPLC_ReadWords =[%p]\n",pMPLC_ReadWords);
  pMPLC_ReadsDoubles=0;
  pMPLC_ReadsDoubles=dlsym(ext_library,"MPLC_ReadDoubles");

  if(pMPLC_ReadsDoubles)
      printf("Return of pMPLC_ReadsDoubles =[%p]\n",pMPLC_ReadsDoubles);
  pMPLC_WriteWords=0;
  pMPLC_WriteWords=dlsym(ext_library,"MPLC_WriteWords");

  if(pMPLC_WriteWords)
      printf("Return of pMPLC_WriteWords =[%p]\n",pMPLC_WriteWords);
  pMPLC_WriteDoubles=0;
  pMPLC_WriteDoubles=dlsym(ext_library,"MPLC_WriteDoubles");

  if(pMPLC_WriteDoubles)
      printf("Return of pMPLC_WriteDoubles =[%p]\n",pMPLC_WriteDoubles);
  //+10.06.2021
  pMPLC_GetSizeDim=0;
  pMPLC_GetSizeDim=dlsym(ext_library,"MPLC_GetSizeDim");

  if(pMPLC_GetSizeDim)
      printf("Return of pMPLC_GetSizeDim =[%p]\n",pMPLC_GetSizeDim);

	ai_signals[0] = __GET_GLOBAL_ARAIN_0();
	ai_signals[1] = __GET_GLOBAL_ARAIN_1();
	ai_signals[2] = __GET_GLOBAL_ARAIN_2();
	ai_signals[3] = __GET_GLOBAL_ARAIN_3();
	ai_signals[4] = __GET_GLOBAL_ARAIN_4();
	ai_signals[5] = __GET_GLOBAL_ARAIN_5();
	ai_signals[6] = __GET_GLOBAL_ARAIN_6();
	ai_signals[7] = __GET_GLOBAL_ARAIN_7();
	ai_signals[8] = __GET_GLOBAL_ARAIN_8();
	ai_signals[9] = __GET_GLOBAL_ARAIN_9();
	ai_signals[10] = __GET_GLOBAL_ARAIN_10();
	ai_signals[11] = __GET_GLOBAL_ARAIN_11();
	ai_signals[12] = __GET_GLOBAL_ARAIN_12();
	ai_signals[13] = __GET_GLOBAL_ARAIN_13();
	ai_signals[14] = __GET_GLOBAL_ARAIN_14();
	ai_signals[15] = __GET_GLOBAL_ARAIN_15();
	ai_signals[16] = __GET_GLOBAL_ARAIN_16();
	ai_signals[17] = __GET_GLOBAL_ARAIN_17();
	ai_signals[18] = __GET_GLOBAL_ARAIN_18();
	ai_signals[19] = __GET_GLOBAL_ARAIN_19();
	ai_signals[20] = __GET_GLOBAL_ARAIN_20();
	ai_signals[21] = __GET_GLOBAL_ARAIN_21();
	ai_signals[22] = __GET_GLOBAL_ARAIN_22();
	ai_signals[23] = __GET_GLOBAL_ARAIN_23();
	ai_signals[24] = __GET_GLOBAL_ARAIN_24();
	ai_signals[25] = __GET_GLOBAL_ARAIN_25();
	ai_signals[26] = __GET_GLOBAL_ARAIN_26();
	ai_signals[27] = __GET_GLOBAL_ARAIN_27();
	ai_signals[28] = __GET_GLOBAL_ARAIN_28();
	ai_signals[29] = __GET_GLOBAL_ARAIN_29();
	ai_signals[30] = __GET_GLOBAL_ARAIN_30();
	ai_signals[31] = __GET_GLOBAL_ARAIN_31();
	ai_signals[32] = __GET_GLOBAL_ARAIN_32();
	ai_signals[33] = __GET_GLOBAL_ARAIN_33();
	ai_signals[34] = __GET_GLOBAL_ARAIN_34();
	ai_signals[35] = __GET_GLOBAL_ARAIN_35();
	ai_signals[36] = __GET_GLOBAL_ARAIN_36();
	ai_signals[37] = __GET_GLOBAL_ARAIN_37();
	ai_signals[38] = __GET_GLOBAL_ARAIN_38();
	ai_signals[39] = __GET_GLOBAL_ARAIN_39();
	ai_signals[40] = __GET_GLOBAL_ARAIN_40();
	ai_signals[41] = __GET_GLOBAL_ARAIN_41();
	ai_signals[42] = __GET_GLOBAL_ARAIN_42();
	ai_signals[43] = __GET_GLOBAL_ARAIN_43();
	ai_signals[44] = __GET_GLOBAL_ARAIN_44();
	ai_signals[45] = __GET_GLOBAL_ARAIN_45();
	ai_signals[46] = __GET_GLOBAL_ARAIN_46();
	ai_signals[47] = __GET_GLOBAL_ARAIN_47();
	ai_signals[48] = __GET_GLOBAL_ARAIN_48();
	ai_signals[49] = __GET_GLOBAL_ARAIN_49();
	ai_signals[50] = __GET_GLOBAL_ARAIN_50();
	ai_signals[51] = __GET_GLOBAL_ARAIN_51();
	ai_signals[52] = __GET_GLOBAL_ARAIN_52();
	ai_signals[53] = __GET_GLOBAL_ARAIN_53();
	ai_signals[54] = __GET_GLOBAL_ARAIN_54();
	ai_signals[55] = __GET_GLOBAL_ARAIN_55();
	ai_signals[56] = __GET_GLOBAL_ARAIN_56();
	ai_signals[57] = __GET_GLOBAL_ARAIN_57();
	ai_signals[58] = __GET_GLOBAL_ARAIN_58();
	ai_signals[59] = __GET_GLOBAL_ARAIN_59();
	ai_signals[60] = __GET_GLOBAL_ARAIN_60();
	ai_signals[61] = __GET_GLOBAL_ARAIN_61();
	ai_signals[62] = __GET_GLOBAL_ARAIN_62();
	ai_signals[63] = __GET_GLOBAL_ARAIN_63();
	ai_signals[64] = __GET_GLOBAL_ARAIN_64();
	ai_signals[65] = __GET_GLOBAL_ARAIN_65();
	ai_signals[66] = __GET_GLOBAL_ARAIN_66();
	ai_signals[67] = __GET_GLOBAL_ARAIN_67();
	ai_signals[68] = __GET_GLOBAL_ARAIN_68();
	ai_signals[69] = __GET_GLOBAL_ARAIN_69();
	ai_signals[70] = __GET_GLOBAL_ARAIN_70();
	ai_signals[71] = __GET_GLOBAL_ARAIN_71();
	ai_signals[72] = __GET_GLOBAL_ARAIN_72();
	ai_signals[73] = __GET_GLOBAL_ARAIN_73();
	ai_signals[74] = __GET_GLOBAL_ARAIN_74();
	ai_signals[75] = __GET_GLOBAL_ARAIN_75();
	ai_signals[76] = __GET_GLOBAL_ARAIN_76();
	ai_signals[77] = __GET_GLOBAL_ARAIN_77();
	ai_signals[78] = __GET_GLOBAL_ARAIN_78();
	ai_signals[79] = __GET_GLOBAL_ARAIN_79();
	di_signals[0] = __GET_GLOBAL_ARDIN_0();
	di_signals[1] = __GET_GLOBAL_ARDIN_1();
	di_signals[2] = __GET_GLOBAL_ARDIN_2();
	di_signals[3] = __GET_GLOBAL_ARDIN_3();
	di_signals[4] = __GET_GLOBAL_ARDIN_4();
	di_signals[5] = __GET_GLOBAL_ARDIN_5();
	di_signals[6] = __GET_GLOBAL_ARDIN_6();
	di_signals[7] = __GET_GLOBAL_ARDIN_7();
	di_signals[8] = __GET_GLOBAL_ARDIN_8();
	di_signals[9] = __GET_GLOBAL_ARDIN_9();
	di_signals[10] = __GET_GLOBAL_ARDIN_10();
	di_signals[11] = __GET_GLOBAL_ARDIN_11();
	di_signals[12] = __GET_GLOBAL_ARDIN_12();
	di_signals[13] = __GET_GLOBAL_ARDIN_13();
	di_signals[14] = __GET_GLOBAL_ARDIN_14();
	di_signals[15] = __GET_GLOBAL_ARDIN_15();
	di_signals[16] = __GET_GLOBAL_ARDIN_16();
	di_signals[17] = __GET_GLOBAL_ARDIN_17();
	di_signals[18] = __GET_GLOBAL_ARDIN_18();
	di_signals[19] = __GET_GLOBAL_ARDIN_19();
	di_signals[20] = __GET_GLOBAL_ARDIN_20();
	di_signals[21] = __GET_GLOBAL_ARDIN_21();
	ao_signals[0] = __GET_GLOBAL_ARAOUT_0();
	ao_signals[1] = __GET_GLOBAL_ARAOUT_1();
	do_signals[0] = __GET_GLOBAL_ARDOUT_0();
	do_signals[1] = __GET_GLOBAL_ARDOUT_1();
	do_signals[2] = __GET_GLOBAL_ARDOUT_2();
	do_signals[3] = __GET_GLOBAL_ARDOUT_3();
	do_signals[4] = __GET_GLOBAL_ARDOUT_4();
	do_signals[5] = __GET_GLOBAL_ARDOUT_5();
	do_signals[6] = __GET_GLOBAL_ARDOUT_6();
	do_signals[7] = __GET_GLOBAL_ARDOUT_7();
	do_signals[8] = __GET_GLOBAL_ARDOUT_8();
	do_signals[9] = __GET_GLOBAL_ARDOUT_9();
	do_signals[10] = __GET_GLOBAL_ARDOUT_10();
	do_signals[11] = __GET_GLOBAL_ARDOUT_11();
	do_signals[12] = __GET_GLOBAL_ARDOUT_12();
	do_signals[13] = __GET_GLOBAL_ARDOUT_13();
	do_signals[66] = __GET_GLOBAL_ARDOUT_66();
	err_signals[0] = __GET_GLOBAL_ARERR_0();
	err_signals[1] = __GET_GLOBAL_ARERR_1();
	err_signals[2] = __GET_GLOBAL_ARERR_2();
	err_signals[3] = __GET_GLOBAL_ARERR_3();
	err_signals[4] = __GET_GLOBAL_ARERR_4();
	err_signals[5] = __GET_GLOBAL_ARERR_5();
	err_signals[6] = __GET_GLOBAL_ARERR_6();
	err_signals[7] = __GET_GLOBAL_ARERR_7();
	err_signals[8] = __GET_GLOBAL_ARERR_8();
	err_signals[9] = __GET_GLOBAL_ARERR_9();
	err_signals[10] = __GET_GLOBAL_ARERR_10();
	err_signals[11] = __GET_GLOBAL_ARERR_11();
	err_signals[12] = __GET_GLOBAL_ARERR_12();
	err_signals[13] = __GET_GLOBAL_ARERR_13();
	err_signals[14] = __GET_GLOBAL_ARERR_14();
	err_signals[15] = __GET_GLOBAL_ARERR_15();
	err_signals[16] = __GET_GLOBAL_ARERR_16();
	err_signals[17] = __GET_GLOBAL_ARERR_17();
	err_signals[18] = __GET_GLOBAL_ARERR_18();
	err_signals[19] = __GET_GLOBAL_ARERR_19();
	err_signals[20] = __GET_GLOBAL_ARERR_20();
	err_signals[21] = __GET_GLOBAL_ARERR_21();
	err_signals[22] = __GET_GLOBAL_ARERR_22();
	err_signals[23] = __GET_GLOBAL_ARERR_23();
	err_signals[24] = __GET_GLOBAL_ARERR_24();
	err_signals[25] = __GET_GLOBAL_ARERR_25();
	err_signals[66] = __GET_GLOBAL_ARERR_66();
	relst_signals[0] = __GET_GLOBAL_ARRELST_0();

  return 0;
}

void __retrieve_1(void)
{
	Addr1.wTypeIO=EIO_AIN;
	Addr1.wIndex=0;
	pMPLC_ReadsDoubles(Addr1,&ai[0],80,sizeof(TItemAIN));

	for (int i = 0; i < 80; i++) {

		if (ai_signals[i] != NULL){
			WriteToTItemAIN(ai_signals[i], &ai[i]);
		}
	}
	Addr1.wTypeIO=EIO_DIN;
	Addr1.wIndex=0;
	pMPLC_ReadWords(Addr1,&di[0],22,sizeof(TItemDIN));

	for (int i = 0; i < 22; i++) {

		if (di_signals[i] != NULL){
			WriteToTItemDIN(di_signals[i], &di[i]);
		}
	}
	Addr1.wTypeIO=EIO_ERR;
	Addr1.wIndex=0;
	pMPLC_ReadWords(Addr1,&err[0],67,sizeof(TItemDIN));

	for (int i = 0; i < 67; i++) {

		if (err_signals[i] != NULL){
			WriteToTItemDIN(err_signals[i], &err[i]);
		}
	}
	Addr1.wTypeIO=EIO_CHECK;
	Addr1.wIndex=0;
	pMPLC_ReadWords(Addr1,&relst[0],1,sizeof(TItemDIN));

	for (int i = 0; i < 1; i++) {

		if (relst_signals[i] != NULL){
			WriteToTItemDIN(relst_signals[i], &relst[i]);
		}
	}
}

void __publish_1(void) {


	for (int i = 0; i < 67; i++) {

		if (do_signals[i] != NULL){
			WriteToTWordData(&do_sign[i], do_signals[i]);
		}
	}
	Addr1.wTypeIO=EIO_DOUT;
	Addr1.wIndex=0;

	int res_w = -1;
	res_w = pMPLC_WriteWords(Addr1,&do_sign[0],67,sizeof(TWordData));

	#ifdef ELNA_DEBUG
	printf("pMPLC_WriteWords res_w = %d\n", res_w);

	#endif ELNA_DEBUG

	for (int i = 0; i < 2; i++) {

		if (ao_signals[i] != NULL){
			WriteToTDoubleData(&ao[i], ao_signals[i]);
		}
	}
	Addr1.wTypeIO=EIO_AOUT;
	Addr1.wIndex=0;

	int res_d = -1;
	res_d = pMPLC_WriteDoubles(Addr1,&ao[0],2,sizeof(TDoubleData));

	#ifdef ELNA_DEBUG
	printf("pMPLC_WriteDoubles res_d = %d\n", res_d);

	#endif ELNA_DEBUG

//   ai_signals[1]->wFlags = x++;
//   ai_signals[1]->dblValue = 1.33;

}

void __cleanup_1(void) {

    if(ext_library) {
        dlclose(ext_library);
    }

}
