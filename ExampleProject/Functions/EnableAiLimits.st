FUNCTION EnableAiLimits : BOOL

VAR_IN_OUT
	Ai : AiConfig;
END_VAR

Ai.A1.Disabled_LA := FALSE;
Ai.A2.Disabled_LA := FALSE;
Ai.A1.Disabled_LW := FALSE;
Ai.A2.Disabled_LW := FALSE;
