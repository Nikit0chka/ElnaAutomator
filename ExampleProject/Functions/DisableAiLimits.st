FUNCTION DisableAiLimits : BOOL

VAR_IN_OUT
	Ai : AiConfig;
END_VAR

Ai.A1.Disabled_LA := TRUE;
Ai.A2.Disabled_LA := TRUE;
Ai.A1.Disabled_LW := TRUE;
Ai.A2.Disabled_LW := TRUE;
