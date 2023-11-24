FUNCTION_BLOCK fb_Switch

VAR_INPUT
	statOn : BOOL;
	statOff : BOOL;
	statOn_reliability : BOOL;
	statOff_reliability : BOOL;
END_VAR

VAR_IN_OUT
	StrSw : struct_Switch;
END_VAR

VAR_INPUT
	inNs : TYPE_ReliableBit;
	inAccident : TYPE_ReliableBit;
	inAuto : TYPE_ReliableBit;
	inManual : TYPE_ReliableBit;
	inLocal : TYPE_ReliableBit;
	inDistance : TYPE_ReliableBit;
	inErrorPowerOff : TYPE_ReliableBit;
	inErrorBlock : TYPE_ReliableBit;
	inBreakCmdOn : TYPE_ReliableBit;
	inBreakCmdOff : TYPE_ReliableBit;
END_VAR

VAR
	onInit : BOOL   := FALSE;
	_statOn : BOOL;
	_statOff : BOOL;
	lastOnStatus : BYTE;
	cmd : BYTE;
	source : BYTE;
	lastCmd : BYTE;
	source_for_Status : BYTE;
	cmd_for_Status : BYTE;
	command_error_for_Status : BYTE;
	_sunpackerCommand : fb_sunpackerCommand;
	_statusDualInput : TYPE_statusDualInput;
	_commandDualInput : TYPE_commandDualInput;
	_commandErrorTimer : BOOL;
	resetErrorTimer : BOOL;
	getSdvig : BOOL;
	_changWithoutCommand : BOOL;
	errorCMDTimer : TON;
	sdvigReset : TON;
	_errorReset : TON;
	outputsSets : TOF;
END_VAR

VAR_IN_OUT
	cmdOn : BOOL;
	cmdOff : BOOL;
END_VAR





IF NOT onInit THEN
IF StrSw.ISVALIDREF_cmdOn XOR StrSw.ISVALIDREF_cmdOff THEN
	IF 	StrSw.ISVALIDREF_cmdOn THEN
		lastCmd:= 2; (*baseCmdOff*) 
	ELSE
		lastCmd:= 1; (*baseCmdOn*) 
	END_IF;
END_IF;
onInit:=TRUE;
END_IF;

(* ---- Если управление с ВУ заблокировано, то в ИМ передаем команду из алгоритма ---- *)
IF StrSw.inOpcCommandsDisabled THEN
	StrSw.inCommand := StrSw.inCommand_Alg;
ELSE (* иначе передаем команду с АРМа*)
	StrSw.inCommand := StrSw.inCommand_ARM;
END_IF;

(* ---- Формирование состояния механизма ---- *)

IF (StrSw.ISVALIDREF_statOn) OR (StrSw.ISVALIDREF_statOff) THEN
	IF (StrSw.ISVALIDREF_statOn) AND (StrSw.ISVALIDREF_statOff) THEN
	StrSw.reliability:= statOn_reliability AND statOff_reliability;
		_statOn  := statOn;
		_statOff := statOff;
	ELSIF (StrSw.ISVALIDREF_statOn) THEN
                     StrSw.reliability:= statOn_reliability;	
		_statOn  := statOn;
		_statOff := NOT statOn; 
	ELSIF (StrSw.ISVALIDREF_statOff) THEN
		 StrSw.reliability:= statOff_reliability;	
		_statOn  := NOT statOff;
		_statOff :=statOff; 
	END_IF;

	IF StrSw.reliability THEN
		IF _statOn AND NOT _statOff 		THEN 	StrSw.onStatus := _statusDualInput.STATUS_ON;
		ELSIF _statOff AND NOT _statOn 	THEN 	StrSw.onStatus := _statusDualInput.Status_OFF;
		ELSIF NOT _statOn AND NOT _statOff 	THEN 	StrSw.onStatus := _statusDualInput.STATUS_TRANSITIONAL;
		ELSE					StrSw.onStatus := _statusDualInput.STATUS_ERROR;
                    END_IF;
		
	ELSE
		StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;
		
	END_IF;
ELSE
	CASE BYTE_TO_INT(lastCmd) OF	
		(*baseCmdOn*) 1: StrSw.onStatus  := _statusDualInput.STATUS_ON; 
		(*baseCmdOff*) 2: StrSw.onStatus  := _statusDualInput.STATUS_OFF;
		
	ELSE
		 StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;
		
	END_CASE;
END_IF;


StrSw.Accident := inAccident.value AND inAccident.reliability;
StrSw.Ns := inNs.value AND inNs.reliability;
StrSw.Auto := inAuto.value AND inAuto.reliability;
StrSw.Manual := inManual.value AND inManual.reliability;
StrSw.Local := inLocal.value AND inLocal.reliability;
StrSw.Distance := inDistance.value AND inDistance.reliability;
StrSw.ErrorPowerOff := inErrorPowerOff.value AND inErrorPowerOff.reliability;
StrSw.ErrorBlock := inErrorBlock.value AND inErrorBlock.reliability;
StrSw.OpcCommandsDisabled := StrSw.inOpcCommandsDisabled;

(* ---- Формирование признака сдвига ---- *)	
getSdvig := FALSE;
IF (StrSw.ISVALIDREF_cmdOn OR StrSw.ISVALIDREF_cmdOff) AND NOT StrSw.Local THEN
	IF NOT (StrSw.CmdOn OR StrSw.CmdOff) THEN
                     IF (lastOnStatus <> StrSw.onStatus AND 
		(StrSw.onStatus <> _statusDualInput.STATUS_NOTDEFINED AND
                     StrSw.onStatus <> _statusDualInput.STATUS_ERROR)     AND
		(lastOnStatus <> _statusDualInput.STATUS_NOTDEFINED   AND
                     lastOnStatus <> _statusDualInput.STATUS_ERROR))      
                    THEN
			getSdvig   := TRUE;
		END_IF;
	END_IF;
END_IF;

IF getSdvig THEN StrSw.sdvig:= TRUE; END_IF;

sdvigReset(IN:=StrSw.sdvig, PT:=T#15S);

IF sdvigReset.Q THEN StrSw.sdvig:=FALSE; END_IF;

lastOnStatus := StrSw.onStatus;

(* ---- Распаковка команды ---- *)
_sunpackerCommand(command := StrSw.inCommand);
	cmd := _sunpackerCommand.cmd;
	source := _sunpackerCommand.source;

(* ---- Обработка команды ---- *)
IF cmd <> 0 AND lastCmd <> cmd and (((NOT StrSw.opcCommandsDisabled) AND source > 0) OR source = 0) then
	CASE BYTE_TO_INT(cmd) OF
	(*cmd_open*) 1 : 
			IF  StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := TRUE;
				IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE; END_IF;
			ELSIF  StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE;  END_IF;
                              lastCmd := cmd;
			errorCMDTimer(IN := false);
			_commandErrorTimer := true;
			StrSw.lastCmdIsOn := true;
	(*cmd_close*) 2 : 
			IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := TRUE;
				IF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
			ELSIF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
                              lastCmd := cmd;
			errorCMDTimer(IN := false);
			_commandErrorTimer := true;
			StrSw.lastCmdIsOn := false;
	(*cmd_reset*) 3 :    IF StrSw.ISVALIDREF_statOn OR StrSw.ISVALIDREF_statOff THEN
			StrSw.CmdOn := FALSE;
			StrSw.CmdOff := FALSE;
                              lastCmd :=0;
			_commandErrorTimer := false;
			StrSw.lastCmdIsOn := false;
                               END_IF;
	END_CASE;	
	source_for_Status := source;
	cmd_for_Status := cmd;
	command_error_for_Status := 0;
END_IF;


errorCMDTimer(In := _commandErrorTimer, PT :=T#10s);

(* ---- алгоритм  для команды ВКЛючить ---- *)
IF (StrSw.onStatus = _statusDualInput.STATUS_ON) and StrSw.lastCmdIsOn then
	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOn := false; END_IF;
	 
	 errorCMDTimer(In := false); 
	 _commandErrorTimer := false;
	 cmd_for_Status := 0;
	 source_for_Status := 0;
END_IF;

(* ---- off ---- *)
IF (StrSw.onStatus = _statusDualInput.STATUS_OFF) and (NOT StrSw.lastCmdIsOn) then
	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOff := false; END_IF;
	 
	 errorCMDTimer(In := false); 
	 _commandErrorTimer := false;
	 cmd_for_Status := 0;
	 source_for_Status := 0;
END_IF;

(* ---- ошибка исполнения команды ---- *)
if errorCMDTimer.Q and (cmd_for_Status <> 0) then
	command_error_for_Status :=  cmd_for_Status;
	_commandErrorTimer := false;
	StrSw.CmdOn := false;
	StrSw.CmdOff := false;
	lastCmd := 0;
end_if;

(* ---- сброс ошибки команды ---- *)
StrSw.CommandFault := command_error_for_Status <> 0;
_errorReset(IN := command_error_for_Status <> 0, PT := T#5S);
IF _errorReset.Q THEN
	cmd_for_Status := 0;
	source_for_Status := 0;
	command_error_for_Status := 0;
END_IF;

outputsSets(in := (StrSw.ISVALIDREF_cmdOn and StrSw.cmdOn ) OR (StrSw.ISVALIDREF_cmdOff and StrSw.cmdOff), PT := T#2S);
	IF NOT outputsSets.Q THEN
		StrSw.BreakCmdOn := inBreakCmdOn._inversed AND
                    inBreakCmdOn.reliability AND StrSw.ISVALIDREF_inBreakCmdOn;
                    
		StrSw.BreakCmdOff := inBreakCmdOff._inversed
                    AND inBreakCmdOff.reliability AND StrSw.ISVALIDREF_inBreakCmdOff;
	END_IF;

cmdOn := StrSw.cmdOn;
cmdOff:= StrSw.cmdOff;  
                              
(* ---- формирование зашифрованного статуса для АРМа ---- *)
StrSw.status := shl(BYTE_TO_DWORD(source_for_Status), 29) 
		OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
		OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
		OR shl(bool_to_DWORD(StrSw.sdvig), 22)
		OR shl(bool_to_DWORD(StrSw.OpcCommandsDisabled), 21)
                    OR shl(bool_to_DWORD(StrSw.lastCmdIsOn), 14)
                    OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOff), 13) 
		OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOn), 12)
		OR shl(BOOL_TO_DWORD(StrSw.ErrorBlock), 11) 
		OR shl(BOOL_TO_DWORD(StrSw.ErrorPowerOff), 10) 
		OR shl(BOOL_TO_DWORD(StrSw.Manual), 8) 
		OR shl(BOOL_TO_DWORD(StrSw.Auto), 7) 
		OR shl(BOOL_TO_DWORD(StrSw.Distance), 6) 
		OR shl(BOOL_TO_DWORD(StrSw.Local), 5) 
		OR shl(BOOL_TO_DWORD(StrSw.Ns), 4) 
                	OR shl(BOOL_TO_DWORD(StrSw.Accident ),3)
		OR BYTE_TO_DWORD(StrSw.onStatus);
