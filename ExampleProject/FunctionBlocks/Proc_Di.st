FUNCTION_BLOCK Proc_Di

VAR
	fb_Di : fb_DiSourceMlp;
	fb_Di1 : fb_DiSourceMlp;
	fb_Di2 : fb_DiSourceMlp;
	fb_Di3 : fb_DiSourceMlp;
	fb_Di4 : fb_DiSourceMlp;
END_VAR

VAR_EXTERNAL
	di : DiConfig;
	arDIN_0 : TItemDIN;
	arDIN_1 : TItemDIN;
	arDIN_2 : TItemDIN;
	arDIN_3 : TItemDIN;
	arDIN_4 : TItemDIN;
	DI_0_1_wValue : UDINT;
	DI_2_3_wValue : UDINT;
	arERR_1 : TItemDIN;;
	arERR_2 : TItemDIN;;
	arERR_3 : TItemDIN;;
	arERR_4 : TItemDIN;;
	arERR_5 : TItemDIN;;
END_VAR

fb_Di(arDIN := arDIN_0, strDI := di.Di, err_mod := arERR_1);
fb_Di1(arDIN := arDIN_1, strDI := di.Di1, err_mod := arERR_2);
DI_0_1_wValue := DIwValue_Diag(arDIN_0.wValue, arDIN_1.wValue);

fb_Di2(arDIN := arDIN_2, strDI := di.Di2, err_mod := arERR_3);
fb_Di3(arDIN := arDIN_3, strDI := di.Di3, err_mod := arERR_4);
DI_2_3_wValue := DIwValue_Diag(arDIN_2.wValue, arDIN_3.wValue);

fb_Di4(arDIN := arDIN_4, strDI := di.Di4, err_mod := arERR_5);
