FUNCTION_BLOCK Proc_Do

VAR
	fb_Do1 : fb_DOSourceMlp;
	fb_Do2 : fb_DOSourceMlp;
	fb_Do3 : fb_DOSourceMlp;
	fb_Do4 : fb_DOSourceMlp;
	fb_Do5 : fb_DOSourceMlp;
END_VAR

VAR_EXTERNAL
	od : DoConfig;
	arDOUT_0 : TWordData;
	arDOUT_1 : TWordData;
	arDOUT_2 : TWordData;
	arDOUT_3 : TWordData;
	arDOUT_4 : TWordData;
	DO_0_wValue : UINT;
	DO_1_wValue : UINT;
	DO_2_wValue : UINT;
	DO_3_wValue : UINT;
	DO_4_wValue : UINT;
	arERR_1 : TItemDIN;;
	arERR_2 : TItemDIN;;
	arERR_3 : TItemDIN;;
	arERR_4 : TItemDIN;;
	arERR_5 : TItemDIN;;
END_VAR

fb_Do1(arDout := arDOUT_0, strDO := od.Do1, err_mod := arERR_1);
DO_0_wValue := arDOUT_0.wValue;

fb_Do2(arDout := arDOUT_1, strDO := od.Do2, err_mod := arERR_2);
DO_1_wValue := arDOUT_1.wValue;

fb_Do3(arDout := arDOUT_2, strDO := od.Do3, err_mod := arERR_3);
DO_2_wValue := arDOUT_2.wValue;

fb_Do4(arDout := arDOUT_3, strDO := od.Do4, err_mod := arERR_4);
DO_3_wValue := arDOUT_3.wValue;

fb_Do5(arDout := arDOUT_4, strDO := od.Do5, err_mod := arERR_5);
DO_4_wValue := arDOUT_4.wValue;

(*gpio_out not initialized*)