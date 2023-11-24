FUNCTION AnyAnalogsPs : BOOL

VAR_INPUT
	Ai : AiConfig;
END_VAR

VAR
	statusAi : TYPE_StatusAi;
END_VAR

AnyAnalogsPs := 
Ai.A1.interval = statusAi.HW OR
Ai.A2.interval = statusAi.HW OR
Ai.A1.interval = statusAi.LW OR
Ai.A2.interval = statusAi.LW;