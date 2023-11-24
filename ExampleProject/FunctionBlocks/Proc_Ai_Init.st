FUNCTION_BLOCK Proc_Ai_Init

VAR_INPUT
	init : BOOL;
END_VAR

VAR
	stAI_Ini : fb_AI_Init;
	inits : UINT;
END_VAR

VAR_INPUT
	initiales : UINT;
END_VAR

VAR_EXTERNAL
	Ai : AiConfig;
END_VAR

inits := 0;

stAI_Ini(data_Ini := TRUE, dLL := 0.0, dHL := 100.0,
ISVALIDREF_LW := TRUE, dLW := 20.0,
ISVALIDREF_HW := TRUE, dHW := 80.0,
ISVALIDREF_LA := TRUE, dLA := 10.0,
ISVALIDREF_HA := TRUE, dHA := 90.0,
strAI := Ai.A1);
inits := inits + BOOL_TO_UINT(stAI_Ini.Init);

stAI_Ini(data_Ini := TRUE, dLL := 0.0, dHL := 100.0,
ISVALIDREF_LW := TRUE, dLW := 20.0,
ISVALIDREF_HW := TRUE, dHW := 80.0,
ISVALIDREF_LA := TRUE, dLA := 10.0,
ISVALIDREF_HA := TRUE, dHA := 90.0,
strAI := Ai.A2);
inits := inits + BOOL_TO_UINT(stAI_Ini.Init);


initiales := 0;
IF init THEN initiales := inits; END_IF;