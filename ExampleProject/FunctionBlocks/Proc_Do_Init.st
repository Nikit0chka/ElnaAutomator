FUNCTION_BLOCK Proc_Do_Init

VAR_INPUT
	init : BOOL;
END_VAR

VAR
	stDO_Ini : fb_DO_Init;
	inits : UINT;
END_VAR

VAR_INPUT
	initiales : UINT;
END_VAR

VAR_EXTERNAL
	od : DoConfig;
END_VAR

inits := 0;

stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do1);
inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do2);
inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do3);
inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do4);
inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do5);
inits := inits + BOOL_TO_UINT(stDO_Ini.Init);


initiales := 0;
IF init THEN initiales := inits; END_IF;