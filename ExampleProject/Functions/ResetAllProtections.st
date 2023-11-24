FUNCTION ResetAllProtections : BOOL

VAR_IN_OUT
	Protections : ProtectionsConfig;
END_VAR

ResetAiProtection(Protections.Ap1);
ResetAiProtection(Protections.AiP1);
ResetAiProtection(Protections.AiP2);
ResetAiProtection(Protections.AiP3);
ResetDiProtection(Protections.DiP1);
ResetDiProtection(Protections.DiP2);
ResetDiProtection(Protections.DiP3);
ResetDiProtection(Protections.DiP4);
ResetDiProtection(Protections.DiP5);
