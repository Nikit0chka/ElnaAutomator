FUNCTION RemontAllProtections : BOOL

VAR_IN_OUT
	Protections : ProtectionsConfig;
END_VAR

VAR CONSTANT
	cmdRemont : WORD := 4;
END_VAR

Protections.Ap1.inCommand_Alg := cmdRemont;
Protections.AiP1.inCommand_Alg := cmdRemont;
Protections.AiP2.inCommand_Alg := cmdRemont;
Protections.AiP3.inCommand_Alg := cmdRemont;
Protections.DiP1.inCommand_Alg := cmdRemont;
Protections.DiP2.inCommand_Alg := cmdRemont;
Protections.DiP3.inCommand_Alg := cmdRemont;
Protections.DiP4.inCommand_Alg := cmdRemont;
Protections.DiP5.inCommand_Alg := cmdRemont;
