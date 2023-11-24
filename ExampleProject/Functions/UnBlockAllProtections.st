FUNCTION UnBlockAllProtections : BOOL

VAR_IN_OUT
	Protections : ProtectionsConfig;
END_VAR

protections.Ap1.inOpcCommandsDisabled := FALSE;
protections.AiP1.inOpcCommandsDisabled := FALSE;
protections.AiP2.inOpcCommandsDisabled := FALSE;
protections.AiP3.inOpcCommandsDisabled := FALSE;
protections.DiP1.inOpcCommandsDisabled := FALSE;
protections.DiP2.inOpcCommandsDisabled := FALSE;
protections.DiP3.inOpcCommandsDisabled := FALSE;
protections.DiP4.inOpcCommandsDisabled := FALSE;
protections.DiP5.inOpcCommandsDisabled := FALSE;
