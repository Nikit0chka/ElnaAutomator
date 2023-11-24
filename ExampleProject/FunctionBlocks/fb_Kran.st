FUNCTION_BLOCK fb_Kran

VAR_INPUT
	statOn : BOOL;
	statOff : BOOL;
	statOn_reliability : BOOL;
	statOff_reliability : BOOL;
END_VAR

VAR_IN_OUT
	strKr : struct_Kran;
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
	inSo : TYPE_ReliableBit;
	inSz : TYPE_ReliableBit;
	inDp : TYPE_ReliableBit;
END_VAR

VAR
	onInit : BOOL   := FALSE;
	_statOn : BOOL;
	_statOff : BOOL;
	getSdvig : BOOL;
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
	_changWithoutCommand : BOOL;
	BlockedOpenControl : BOOL;
	errorCMDTimer : TON;
	_errorReset : TON;
	sdvigReset : TON;
	continueHoldCommandTimer : TON;
	outputsSets : TOF;
	dP_Trig : R_TRIG;
	dP_Trig_reliability : R_TRIG;
	resetBlockedOpenControl_Trig : R_TRIG;
END_VAR

VAR_IN_OUT
	cmdOn : BOOL;
	cmdOff : BOOL;
END_VAR






IF NOT onInit THEN
IF strKr.ISVALIDREF_cmdOn XOR strKr.ISVALIDREF_cmdOff THEN
	IF 	strKr.ISVALIDREF_cmdOn THEN
		lastCmd:= 2; (*baseCmdOff*) 
	ELSE
		lastCmd:= 1; (*baseCmdOn*) 
	END_IF;
END_IF;
onInit:=TRUE;
END_IF;

(* ---- Если управление с ВУ заблокировано, то в ИМ передаем команду из алгоритма ---- *)
IF strKr.inOpcCommandsDisabled THEN
	strKr.inCommand := strKr.inCommand_Alg;
ELSE (* иначе передаем команду с АРМа*)
	strKr.inCommand := strKr.inCommand_ARM;
END_IF;

(* ---- Формирование состояния механизма ---- *)

IF (strKr.ISVALIDREF_statOn) OR (strKr.ISVALIDREF_statOff) THEN
	IF (strKr.ISVALIDREF_statOn) AND (strKr.ISVALIDREF_statOff) THEN
	strKr.reliability:= statOn_reliability AND statOff_reliability;
		_statOn  := statOn;
		_statOff := statOff;
	ELSIF (strKr.ISVALIDREF_statOn) THEN
                     strKr.reliability:= statOn_reliability;	
		_statOn  := statOn;
		_statOff := NOT statOn; 
	ELSIF (strKr.ISVALIDREF_statOff) THEN
		 strKr.reliability:= statOff_reliability;	
		_statOn  := NOT statOff;
		_statOff :=statOff; 
	END_IF;

	IF strKr.reliability THEN 
		IF _statOn AND NOT _statOff 		THEN 	strKr.onStatus := _statusDualInput.STATUS_ON;
		ELSIF _statOff AND NOT _statOn 	THEN 	strKr.onStatus := _statusDualInput.Status_OFF;
		ELSIF NOT _statOn AND NOT _statOff 	THEN 	strKr.onStatus := _statusDualInput.STATUS_TRANSITIONAL;
		ELSE					strKr.onStatus := _statusDualInput.STATUS_ERROR;
                    END_IF;
		
	ELSE
		strKr.onStatus := _statusDualInput.STATUS_NOTDEFINED; 
		
	END_IF;
ELSE
	CASE BYTE_TO_INT(lastCmd) OF	
		(*baseCmdOn*)  1: strKr.onStatus  := _statusDualInput.STATUS_ON; 
		(*baseCmdOff*) 2: strKr.onStatus  := _statusDualInput.STATUS_OFF;
		
	ELSE
		 strKr.onStatus := _statusDualInput.STATUS_NOTDEFINED;
		 
	END_CASE;
END_IF;


strKr.Accident := inAccident.value AND inAccident.reliability;
strKr.Ns := inNs.value AND inNs.reliability;
strKr.Auto := inAuto.value AND inAuto.reliability;
strKr.Manual := inManual.value AND inManual.reliability;
strKr.Local := inLocal.value AND inLocal.reliability;
strKr.Distance := inDistance.value AND inDistance.reliability;
strKr.ErrorPowerOff := inErrorPowerOff.value AND inErrorPowerOff.reliability;
strKr.ErrorBlock := inErrorBlock.value AND inErrorBlock.reliability;
strKr.OpcCommandsDisabled := strKr.inOpcCommandsDisabled;

(* ---- Формирование признака блокировки Открытия крана по высокому давлению ---- *)
	IF strKr.ISVALIDREF_inDp THEN
		
		strKr.Dp := NOT inDp.value AND inDp.reliability;

		dP_Trig(CLK := strKr.Dp );
		dP_Trig_reliability(CLK :=NOT inDp.reliability);

		IF dP_Trig.Q OR dP_Trig_reliability.Q THEN  
			BlockedOpenControl := TRUE; 
		END_IF;
		(* ---- автоматический сброс *)
		resetBlockedOpenControl_Trig(CLK := (inDp.value) AND inDp.reliability);
		IF resetBlockedOpenControl_Trig.Q THEN 
			BlockedOpenControl := FALSE;
		END_IF;
	ELSE
		strKr.Dp  := FALSE;
		BlockedOpenControl := FALSE;
	END_IF;
          
(* ---- Формирование признака сдвига ---- *)	
getSdvig := FALSE;
IF (strKr.ISVALIDREF_cmdOn OR strKr.ISVALIDREF_cmdOff) AND NOT strKr.Local THEN
	IF NOT (strKr.CmdOn OR strKr.CmdOff) THEN
		IF (lastOnStatus <> strKr.onStatus AND 
		(strKr.onStatus <> _statusDualInput.STATUS_NOTDEFINED AND strKr.onStatus <> _statusDualInput.STATUS_ERROR) AND
		(lastOnStatus <> _statusDualInput.STATUS_NOTDEFINED AND lastOnStatus <> _statusDualInput.STATUS_ERROR)) THEN
			strKr.sdvig   := TRUE;
		END_IF;
	END_IF;
END_IF;

IF getSdvig THEN strKr.sdvig:= TRUE; END_IF;

sdvigReset(IN:=strKr.sdvig, PT:=T#15S);

IF sdvigReset.Q THEN strKr.sdvig:=FALSE; END_IF;

lastOnStatus := strKr.onStatus;

(* ---- Распаковка команды ---- *)
_sunpackerCommand(command := strKr.inCommand);
	cmd := _sunpackerCommand.cmd;
	source := _sunpackerCommand.source;

(* ---- Обработка команды ---- *)
IF cmd <> 0 AND lastCmd <> cmd and (((NOT strKr.opcCommandsDisabled) AND source > 0) OR source = 0) then
	CASE BYTE_TO_INT(cmd) OF
	(*cmd_open*) 1 : 
			IF NOT BlockedOpenControl THEN
                              IF  strKr.ISVALIDREF_cmdOn THEN strKr.CmdOn := TRUE;
				IF strKr.ISVALIDREF_cmdOff THEN strKr.CmdOff := FALSE; END_IF;
			ELSIF  strKr.ISVALIDREF_cmdOff THEN strKr.CmdOff := FALSE;  END_IF;
			errorCMDTimer(IN := false);
                              
			_commandErrorTimer := true;
			strKr.lastCmdIsOn := true;
                              END_IF;
	(*cmd_close*) 2 : 
			IF strKr.ISVALIDREF_cmdOff THEN strKr.CmdOff := TRUE;
				IF strKr.ISVALIDREF_cmdOn THEN strKr.CmdOn := FALSE; END_IF;
			ELSIF strKr.ISVALIDREF_cmdOn THEN strKr.CmdOn := FALSE; END_IF;
			errorCMDTimer(IN := false);
                              
			_commandErrorTimer := true;
			strKr.lastCmdIsOn := false;
	(*cmd_reset*) 3 :   IF (strKr.ISVALIDREF_statOn) OR (strKr.ISVALIDREF_statOff) THEN
			strKr.CmdOn := FALSE;
			strKr.CmdOff := FALSE;
                              lastCmd := 0;
			_commandErrorTimer := false;
			strKr.lastCmdIsOn := false;
                              END_IF;
                              
	END_CASE;	
	source_for_Status := source;
	cmd_for_Status := cmd;
	command_error_for_Status := 0;
END_IF;
lastCmd := cmd;

errorCMDTimer(In := _commandErrorTimer, PT :=T#90s);


continueHoldCommandTimer(IN:=(strKr.onStatus = _statusDualInput.STATUS_ON) OR
(strKr.onStatus = _statusDualInput.STATUS_OFF), PT:=strKr.continueHoldCommand);


(* ---- алгоритм  для команды ВКЛючить ---- *)
IF (strKr.onStatus = _statusDualInput.STATUS_ON) and strKr.lastCmdIsOn  then
	IF strKr.ISVALIDREF_cmdOn AND strKr.ISVALIDREF_cmdOff then  
          IF continueHoldCommandTimer.Q THEN 
          strKr.cmdOn := false; END_IF;
          END_IF;
	 errorCMDTimer(In := false); 
	 _commandErrorTimer := false;
	 cmd_for_Status := 0;
	 source_for_Status := 0;
END_IF;

(* ---- off ---- *)
IF (strKr.onStatus = _statusDualInput.STATUS_OFF) and  (NOT strKr.lastCmdIsOn) then
	IF strKr.ISVALIDREF_cmdOn AND strKr.ISVALIDREF_cmdOff then
          IF continueHoldCommandTimer.Q THEN
          strKr.cmdOff := false; END_IF;
          END_IF;
	 errorCMDTimer(In := false); 
	 _commandErrorTimer := false;
	 cmd_for_Status := 0;
	 source_for_Status := 0;
END_IF;

(* ---- ошибка исполнения команды ---- *)
if errorCMDTimer.Q and (cmd_for_Status <> 0) then
	command_error_for_Status :=  cmd_for_Status;
	_commandErrorTimer := false;
	strKr.CmdOn := false;
	strKr.CmdOff := false;
	(*lastCmd := 0;*)
END_IF;

(* ---- сброс ошибки команды ---- *)
strKr.CommandFault := command_error_for_Status <> 0;
_errorReset(IN := command_error_for_Status <> 0, PT := T#5S);
IF _errorReset.Q THEN
	cmd_for_Status := 0;
	source_for_Status := 0;
	command_error_for_Status := 0;
         
END_IF;

outputsSets(in := (strKr.ISVALIDREF_cmdOn and strKr.cmdOn ) OR (strKr.ISVALIDREF_cmdOff and strKr.cmdOff), PT := T#2S);
	IF NOT outputsSets.Q THEN
		strKr.So := inSo._inversed AND inSo.reliability AND strKr.ISVALIDREF_inSo;
		strKr.Sz := inSz._inversed AND inSz.reliability AND strKr.ISVALIDREF_inSz;
	END_IF;

cmdOn := strKr.cmdOn;
cmdOff:= strKr.cmdOff;       
                              
(* ---- формирование зашифрованного статуса для АРМа ---- *)
strKr.status := shl(BYTE_TO_DWORD(source_for_Status), 29) 
		OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
		OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
		OR shl(bool_to_DWORD(strKr.sdvig), 22)
		OR shl(bool_to_DWORD(strKr.OpcCommandsDisabled), 21)
                    OR shl(bool_to_DWORD(strKr.Dp), 14) 
                    OR shl(BOOL_TO_DWORD(strKr.Sz), 13) 
		OR shl(BOOL_TO_DWORD(strKr.So), 12)
		OR shl(BOOL_TO_DWORD(strKr.ErrorBlock), 11) 
		OR shl(BOOL_TO_DWORD(strKr.ErrorPowerOff), 10) 
		OR shl(BOOL_TO_DWORD(strKr.Manual), 8) 
		OR shl(BOOL_TO_DWORD(strKr.Auto), 7) 
		OR shl(BOOL_TO_DWORD(strKr.Distance), 6) 
		OR shl(BOOL_TO_DWORD(strKr.Local), 5) 
		OR shl(BOOL_TO_DWORD(strKr.Ns), 4) 
                	OR shl(BOOL_TO_DWORD(strKr.Accident ),3)
		OR BYTE_TO_DWORD(strKr.onStatus);
 
