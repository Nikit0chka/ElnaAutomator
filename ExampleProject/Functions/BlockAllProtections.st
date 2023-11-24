FUNCTION BlockAllProtections : BOOL

VAR_IN_OUT
	Protections : ProtectionsConfig;
END_VAR

Protections.Ap1.inOpcCommandsDisabled := TRUE;
Protections.AiP1.inOpcCommandsDisabled := TRUE;
Protections.AiP2.inOpcCommandsDisabled := TRUE;
Protections.AiP3.inOpcCommandsDisabled := TRUE;
Protections.DiP1.inOpcCommandsDisabled := TRUE;
Protections.DiP2.inOpcCommandsDisabled := TRUE;
Protections.DiP3.inOpcCommandsDisabled := TRUE;
Protections.DiP4.inOpcCommandsDisabled := TRUE;
Protections.DiP5.inOpcCommandsDisabled := TRUE;
