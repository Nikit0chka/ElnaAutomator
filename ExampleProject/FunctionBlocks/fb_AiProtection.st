FUNCTION_BLOCK fb_AiProtection

VAR_INPUT
	ai : struct_AI;
END_VAR

VAR_IN_OUT
	StrAIp : struct_AiProtection;
END_VAR

VAR
	_sunpackerCommand : fb_sunpackerCommand;
	_signalingTp : TOF;
	_statusAi : TYPE_StatusAi;
	source : BYTE;
	cmd : BYTE;
	lastCmd : BYTE;
	source_for_Status : BYTE;
	cmd_for_Status : BYTE;
	command_error_for_Status : BYTE;
	resetCmdTimer : TON;
	resetCmdTimerPriznak : BOOL;
	signalinTimer : TON;
	timer : TON;
	SignalingTrig : R_TRIG;
	SignalingFTrig : F_TRIG;
	SignalingAi : BOOL;
END_VAR





timer(IN :=(ai.interval=StrAIp.controlLimit) AND (ai.interval >= _statusAi.normal) AND StrAIp.isRunning, PT :=StrAIp.delay);
SignalingTrig(CLK := timer.Q);
IF SignalingTrig.Q THEN
	SignalingAi := TRUE;
END_IF;
SignalingFTrig(CLK := timer.Q);
IF SignalingFTrig.Q THEN
	SignalingAi := FALSE;
END_IF;

StrAIp.Tag := StrAIp.inTag;
StrAIp.RunOnStart := StrAIp.inRunOnStart;

StrAIp.CanRun := StrAIp.inCanRun;

StrAIp.OpcCommandsDisabled := StrAIp.inOpcCommandsDisabled;

(* ---- Если управление с ВУ заблокировано, то передаем команду из алгоритма ---- *)
IF StrAIp.inOpcCommandsDisabled THEN
	StrAIp.inCommand := StrAIp.inCommand_Alg;
ELSE (* иначе передаем команду с АРМа*)
	StrAIp.inCommand := StrAIp.inCommand_ARM;
END_IF;

_sunpackerCommand(command := StrAIp.inCommand);
	source := _sunpackerCommand.source;
	cmd := _sunpackerCommand.cmd;

IF cmd <> 0 AND lastCmd <> cmd AND (((NOT StrAIp.opcCommandsDisabled) AND source > 0) OR source = 0) then
            	
	CASE BYTE_TO_INT(cmd) OF
		(*cmdRun*) 1: 	IF        NOT StrAIp.Remont THEN
					StrAIp.isEnded := FALSE;
					StrAIp.hasError 	:= FALSE;
					StrAIp.isRunning := TRUE;
                                                  
					cmd_for_Status := cmd;
					source_for_Status := source;
					command_error_for_Status := 0;
				ELSE
					StrAIp.isRunning := FALSE;
					StrAIp.isEnded := FALSE;
					StrAIp.hasError 	:= FALSE;

					cmd_for_Status := 0;
					source_for_Status := source;
					command_error_for_Status := cmd;
				END_IF;
                                        StrAIp.inopcCommandsDisabled:=FALSE;
                                        
		(*cmdReset*) 2: 	StrAIp.isRunning := FALSE;
				StrAIp.isEnded := FALSE;
				StrAIp.hasError 	:= FALSE;
				SignalingAi := FALSE;
				StrAIp.Check := FALSE;
                                        (*StrAIp.Remont := FALSE;*)
				cmd_for_Status := cmd;
				source_for_Status := source;
				command_error_for_Status := 0;
                                        StrAIp.inopcCommandsDisabled:=FALSE; 
                                        	
	(*cmd_setRemont*) 4 :	StrAIp.Remont := TRUE;
				(*StrAIp.isRunning := FALSE;*)
	
				cmd_for_Status := cmd;
				source_for_Status := source;
				command_error_for_Status := 0;
	(*cmd_resetRemont*) 5 : 	(*IF (ai.interval=StrAIp.controlLimit) THEN
					cmd_for_Status := 0;
					source_for_Status := 0;
					command_error_for_Status := cmd;
				ELSE*)
					StrAIp.Remont := FALSE;
					(*StrAIp.isRunning := TRUE;*)
	
					cmd_for_Status := cmd;
					source_for_Status := source;
					command_error_for_Status := 0;
				(*END_IF;*)
	(*cmd_setCheck*) 6 : 	StrAIp.Check := TRUE;
	
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

IF StrAIp.isRunning AND NOT StrAIp.Remont AND NOT StrAIp.Check THEN
	StrAIp.Signaling := SignalingAi;
	StrAIp.SignalingTP := _signalingTp.Q;
ELSE
	StrAIp.Signaling := 0;
	StrAIp.SignalingTP := 0;
END_IF;

_signalingTp(in := StrAIp.Signaling, PT := T#1s);

	


StrAIp.status :=  SHL(BYTE_TO_DWORD(source_for_Status), 29) 
			OR SHL(BYTE_TO_DWORD(cmd_for_Status), 26) 
			OR SHL(BYTE_TO_DWORD(command_error_for_Status), 23)
			OR SHL(BOOL_TO_DWORD(StrAIp.OpcCommandsDisabled ), 21)
			OR SHL(BOOL_TO_DWORD(StrAIp.Signaling), 16)
			OR SHL(BOOL_TO_DWORD(StrAIp.RunOnStart ), 15)
			OR SHL(BOOL_TO_DWORD(StrAIp.remont), 6)
			OR SHL(BOOL_TO_DWORD(StrAIp.Check), 5)
			OR SHL(BOOL_TO_DWORD(StrAIp.hasError), 4)
			OR SHL(BOOL_TO_DWORD(StrAIp.SignalingTP), 3)
			OR SHL(BOOL_TO_DWORD(StrAIp.CanRun), 2)
			OR SHL(BOOL_TO_DWORD(StrAIp.isEnded), 1)
			OR BOOL_TO_DWORD(StrAIp.isRunning);


