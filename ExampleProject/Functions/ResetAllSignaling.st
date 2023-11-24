FUNCTION ResetAllSignaling : BOOL

VAR_IN_OUT
	Protections : ProtectionsConfig;
END_VAR

IF Protections.Ap1.Signaling THEN
	ResetAiProtection(Protections.Ap1); END_IF;
IF Protections.AiP1.Signaling THEN
	ResetAiProtection(Protections.AiP1); END_IF;
IF Protections.AiP2.Signaling THEN
	ResetAiProtection(Protections.AiP2); END_IF;
IF Protections.AiP3.Signaling THEN
	ResetAiProtection(Protections.AiP3); END_IF;
IF Protections.DiP1.Signaling THEN
	ResetDiProtection(Protections.DiP1); END_IF;
IF Protections.DiP2.Signaling THEN
	ResetDiProtection(Protections.DiP2); END_IF;
IF Protections.DiP3.Signaling THEN
	ResetDiProtection(Protections.DiP3); END_IF;
IF Protections.DiP4.Signaling THEN
	ResetDiProtection(Protections.DiP4); END_IF;
IF Protections.DiP5.Signaling THEN
	ResetDiProtection(Protections.DiP5); END_IF;
