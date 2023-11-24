FUNCTION AutoRunProtections : BOOL

VAR_IN_OUT
	Protections : ProtectionsConfig;
END_VAR

RunAiProtection(Protections.Ap1);
RunAiProtection(Protections.AiP2);
RunDiProtection(Protections.DiP1);
RunDiProtection(Protections.DiP2);
RunDiProtection(Protections.DiP3);
