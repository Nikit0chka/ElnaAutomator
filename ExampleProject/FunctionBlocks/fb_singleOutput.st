FUNCTION_BLOCK fb_singleOutput

VAR_IN_OUT
	signal : BOOL;
	str_SO : struct_singleOutput;
END_VAR

VAR
	pulseTimer : TON;
	resetCmdTimer : TON;
	TON_Command : TON;
	source : BYTE;
	cmd : BYTE;
	lastCmd : BYTE;
	source_for_Status : BYTE;
	cmd_for_Status : BYTE;
	command_error_for_Status : BYTE;
	pulseTimerPriznak : BOOL;
	resetCmdTimerPriznak : BOOL;
	_sunpackerCommand : fb_sunpackerCommand;
END_VAR






str_SO.OpcCommandsDisabled := str_SO.inOpcCommandsDisabled;

(* ---- Если управление с ВУ заблокировано, то передаем команду из алгоритма ---- *)
IF str_SO.inOpcCommandsDisabled THEN
	str_SO.inCommand := str_SO.inCommand_Alg;
ELSE (* иначе передаем команду с АРМа*)
	str_SO.inCommand := str_SO.inCommand_ARM;
END_IF;

(*Распаковка команды*)
_sunpackerCommand(command := str_SO.inCommand);
	cmd := _sunpackerCommand.cmd;
	source := _sunpackerCommand.source;
          
(*Обработка команды*)
IF cmd <> 0 AND lastCmd <> cmd and (((NOT str_SO.OpcCommandsDisabled) AND source > 0) OR source = 0) then
	CASE BYTE_TO_INT(cmd) OF
	(*cmd_on*) 1 : 
			str_SO.Q := TRUE; 
			pulseTimer(IN := FALSE);
			pulseTimerPriznak := FALSE;
			resetCmdTimer(IN := FALSE);
			resetCmdTimerPriznak := TRUE;
	(*cmd_off*) 2 : 
			str_SO.Q := FALSE; 
			pulseTimer(IN := FALSE);
			pulseTimerPriznak := FALSE;
			resetCmdTimer(IN := FALSE);
			resetCmdTimerPriznak := TRUE;
	(*cmd_pulse*) 3 :
			str_SO.Q := TRUE;
                              pulseTimer(IN := FALSE); 
                              pulseTimerPriznak := TRUE;
			resetCmdTimer(IN := FALSE);
                              resetCmdTimerPriznak := FALSE;
	END_CASE;	
	source_for_Status := source;
	cmd_for_Status := cmd;
	command_error_for_Status := 0;
END_IF;
lastCmd := cmd;

pulseTimer(IN := pulseTimerPriznak, PT := str_SO.wait_time);
pulseTimer();
IF pulseTimer.Q THEN
	pulseTimer(IN := FALSE);
	pulseTimerPriznak := FALSE;
	
	str_SO.Q := FALSE;
	
	source_for_Status := 0;
	cmd_for_Status := 0;
	command_error_for_Status := 0;
END_IF;

resetCmdTimer(IN := resetCmdTimerPriznak, PT := T#10S);
resetCmdTimer();
IF resetCmdTimer.Q THEN
	resetCmdTimer(IN := FALSE);
	resetCmdTimerPriznak := FALSE;
	
	source_for_Status := 0;
	cmd_for_Status := 0;
	command_error_for_Status := 0;
END_IF;

signal:= str_SO.Q;

(*TON_Command(IN:= (inCommand <> 0) AND (source = 0), PT:= T#2S);*)
    (*IF TON_Command.Q THEN*)
        (*inCommand := 0;*)
    (*END_IF;*)
str_SO.status :=                           shl(BYTE_TO_DWORD(source_for_Status), 29) 
				OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
				OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
				OR shl(BOOL_TO_DWORD(str_SO.OpcCommandsDisabled), 21)		
				OR BOOL_TO_DWORD(str_SO.Q);