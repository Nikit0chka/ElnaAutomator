FUNCTION AnyProtectionInRemont : BOOL

VAR_INPUT
	Protections : ProtectionsConfig;
END_VAR

AnyProtectionInRemont := 
Protections.Ap1.Remont OR
Protections.AiP1.Remont OR
Protections.AiP2.Remont OR
Protections.AiP3.Remont OR
Protections.DiP1.Remont OR
Protections.DiP2.Remont OR
Protections.DiP3.Remont OR
Protections.DiP4.Remont OR
Protections.DiP5.Remont;