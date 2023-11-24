FUNCTION resetDiProtection : BOOL

VAR_IN_OUT
	protection : struct_DiProtection;
END_VAR

VAR CONSTANT
	cmdReset : WORD   := 2;
END_VAR






IF protection.isRunning THEN
                    protection.inOpcCommandsDisabled:=TRUE;
		protection.inCommand_Alg:=cmdReset;
END_IF;