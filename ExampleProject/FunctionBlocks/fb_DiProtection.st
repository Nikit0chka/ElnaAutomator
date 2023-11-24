FUNCTION_BLOCK fb_DiProtection

VAR_INPUT
	di : struct_singleSignal;
END_VAR

VAR_IN_OUT
	StrDIp : struct_DiProtection;
END_VAR

VAR
	_sunpackerCommand : fb_sunpackerCommand;
	_ProtectionTags : TYPE_ProtectionTags;
	_signalingTp : TOF;
	timer : TON;
	SignalingTrig : R_TRIG;
	SignalingFTrig : F_TRIG;
	SignalingDi : BOOL;
	source : BYTE;
	cmd : BYTE;
	lastCmd : BYTE;
	source_for_Status : BYTE;
	cmd_for_Status : BYTE;
	command_error_for_Status : BYTE;
	resetCmdTimer : TON;
	resetCmdTimerPriznak : BOOL;
	signalinTimer : TON;
	runOnStart_Trig : R_TRIG;
END_VAR





timer(IN := di.Q AND StrDIp.isRunning  , PT := StrDIp.delay);
SignalingTrig(CLK := timer.Q);
IF SignalingTrig.Q THEN
	SignalingDi := TRUE;
END_IF;
SignalingFTrig(CLK := timer.Q);
IF SignalingFTrig.Q THEN
	SignalingDi := FALSE;
END_IF;

StrDIp.Tag := StrDIp.inTag;
StrDIp.RunOnStart := StrDIp.inRunOnStart;

StrDIp.CanRun := StrDIp.inCanRun;

StrDIp.OpcCommandsDisabled := StrDIp.inOpcCommandsDisabled;

(* ---- Если управление с ВУ заблокировано, то передаем команду из алгоритма ---- *)
IF StrDIp.inOpcCommandsDisabled THEN
	StrDIp.inCommand := StrDIp.inCommand_Alg;
ELSE (* иначе передаем команду с АРМа*)
	StrDIp.inCommand := StrDIp.inCommand_ARM;
END_IF;

_sunpackerCommand(command := StrDIp.inCommand);
	source := _sunpackerCommand.source;
	cmd := _sunpackerCommand.cmd;
          
IF cmd <> 0 AND lastCmd <> cmd AND (((NOT StrDIp.opcCommandsDisabled) AND source > 0) OR source = 0) then
             	
	CASE BYTE_TO_INT(cmd) OF
	        (*cmdRun*) 1: 	IF        NOT StrDIp.Remont THEN
					StrDIp.isEnded := FALSE;
					StrDIp.hasError 	:= FALSE;
					StrDIp.isRunning := TRUE;
					cmd_for_Status := cmd;
					source_for_Status := source;
					command_error_for_Status := 0;
				ELSE
					StrDIp.isRunning := FALSE;
					StrDIp.isEnded := FALSE;
					StrDIp.hasError 	:= FALSE;

					cmd_for_Status := 0;
					source_for_Status := source;
					command_error_for_Status := cmd;
				END_IF;
                                        StrDIp.inOpcCommandsDisabled:=FALSE;
                                        
                (*cmdReset*) 2: 	StrDIp.isRunning := FALSE;
				StrDIp.isEnded := FALSE;
				StrDIp.hasError 	:= FALSE;
				SignalingDi:= FALSE;
				StrDIp.Check := FALSE;
				cmd_for_Status := cmd;
				source_for_Status := source;
				command_error_for_Status := 0;
                                       StrDIp.inOpcCommandsDisabled:=FALSE;	
                                        
	(*cmd_setRemont*) 4 :	StrDIp.Remont := TRUE;
				(*StrDIp.isRunning := FALSE;*)
	
				cmd_for_Status := cmd;
				source_for_Status := source;
				command_error_for_Status := 0;
        (*cmd_resetRemont*) 5 : 	(*IF di.Q THEN
					cmd_for_Status := 0;
					source_for_Status := 0;
					command_error_for_Status := cmd;
				ELSE*)
					StrDIp.Remont := FALSE;
					(*StrDIp.isRunning := TRUE;*)
	
					cmd_for_Status := cmd;
					source_for_Status := source;
					command_error_for_Status := 0;
				(*END_IF;*)
	(*cmd_setCheck*) 6 : 	StrDIp.Check := TRUE;
	
				cmd_for_Status := cmd;
				source_for_Status := source;
				command_error_for_Status := 0;
	END_CASE;			
	resetCmdTimer(IN := false);
	resetCmdTimerPriznak := TRUE;
END_IF;
lastCmd := cmd;

resetCmdTimer(IN := resetCmdTimerPriznak);
IF resetCmdTimer.Q THEN
	resetCmdTimerPriznak := FALSE;
	source_for_Status := 0;
	cmd_for_Status := 0;
	command_error_for_Status := 0;
END_IF; 

IF StrDIp.isRunning AND NOT StrDIp.Remont AND NOT StrDIp.Check THEN
	StrDIp.Signaling := SignalingDi;
	StrDIp.SignalingTP := _signalingTp.Q;
ELSE
	StrDIp.Signaling := 0;
	StrDIp.SignalingTP := 0;
END_IF;

_signalingTp(in := StrDIp.Signaling, PT := T#1s);



StrDIp.status :=  SHL(BYTE_TO_DWORD(source_for_Status), 29) 
			OR SHL(BYTE_TO_DWORD(cmd_for_Status), 26) 
			OR SHL(BYTE_TO_DWORD(command_error_for_Status), 23)
			OR SHL(BOOL_TO_DWORD(StrDIp.OpcCommandsDisabled ), 21)
			OR SHL(BOOL_TO_DWORD(StrDIp.Signaling), 16)
			OR SHL(BOOL_TO_DWORD(StrDIp.RunOnStart ), 15)
			OR SHL(BOOL_TO_DWORD(StrDIp.remont), 6)
			OR SHL(BOOL_TO_DWORD(StrDIp.Check), 5)
			OR SHL(BOOL_TO_DWORD(StrDIp.hasError), 4)
			OR SHL(BOOL_TO_DWORD(StrDIp.SignalingTP), 3)
			OR SHL(BOOL_TO_DWORD(StrDIp.CanRun), 2)
			OR SHL(BOOL_TO_DWORD(StrDIp.isEnded), 1)
			OR BOOL_TO_DWORD(StrDIp.isRunning);	                                                                            