FUNCTION_BLOCK Proc_Di_Init

VAR_INPUT
	init : BOOL;
END_VAR

VAR
	stDI_Ini : fb_DI_Init;
	inits : UINT;
END_VAR

VAR_INPUT
	initiales : UINT;
END_VAR

VAR_EXTERNAL
	di : DiConfig;
END_VAR

inits := 0;

stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di);
inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di1);
inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di2);
inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di3);
inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di4);
inits := inits + BOOL_TO_UINT(stDI_Ini.Init);


initiales := 0;
IF init THEN initiales := inits; END_IF;