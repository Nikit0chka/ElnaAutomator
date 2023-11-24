FUNCTION AnyAnalogsNs : BOOL

VAR_INPUT
	Ai : AiConfig;
END_VAR

VAR
	statusAi : TYPE_StatusAi;
END_VAR

AnyAnalogsNs := 
((Ai.A1.interval < statusAi.Normal) AND NOT Ai.A1.Remont) OR
((Ai.A2.interval < statusAi.Normal) AND NOT Ai.A2.Remont);