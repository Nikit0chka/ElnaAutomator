FUNCTION AnyProtectionSignaling : BOOL

VAR_INPUT
	Protections : ProtectionsConfig;
END_VAR

AnyProtectionSignaling := 
Protections.Ap1.Signaling OR
Protections.AiP1.Signaling OR
Protections.AiP2.Signaling OR
Protections.AiP3.Signaling OR
Protections.DiP1.Signaling OR
Protections.DiP2.Signaling OR
Protections.DiP3.Signaling OR
Protections.DiP4.Signaling OR
Protections.DiP5.Signaling;