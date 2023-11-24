FUNCTION runDiProtection : BOOL

VAR_IN_OUT
	protection : struct_DiProtection;
END_VAR

VAR CONSTANT
	cmdRun : WORD   := 1;
END_VAR






IF NOT protection.isRunning THEN
                    protection.inOpcCommandsDisabled:=TRUE;
		protection.inCommand_Alg:=cmdRun;
END_IF;