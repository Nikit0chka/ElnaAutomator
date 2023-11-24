FUNCTION_BLOCK fb_AiSourceMlp

VAR_INPUT
	arAIN : TItemAIN; (*Данные от модуля AI*)
	err_mod : TItemDIN; (*Диагностика от модуля AI*)
END_VAR

VAR_IN_OUT
	strAI : struct_AI; (*Текущие параметры канала AI*)
END_VAR

VAR
	_statusAi : TYPE_StatusAi;
	_commandAnalog : TYPE_CommandAnalog;
	_sunpackerCommand : fb_sunpackerCommand;
	_AnalogLimitFlags : TYPE_AnalogLimitFlags;
	notReliable : BOOL;
	_lastValue : LREAL;
	resetCmdTimer : TON;
	_LastValueTimer : TON;
	resetCmdTimerPriznak : BOOL;
	k : LREAL;
	b : LREAL;
	ap : LREAL;
	raznitsa : LREAL;
	rABS : LREAL;
	h : LREAL;
	mismatch : LREAL;
	parametr : BYTE;
	source : BYTE;
	cmd : BYTE;
	lastCmd : BYTE;
	source_for_Status : BYTE;
	cmd_for_Status : BYTE;
	command_error_for_Status : BYTE;
	onInit : BOOL;
	off_trig : R_TRIG;
	on_trig : R_TRIG;
	remont_trig : R_TRIG;
	LL_trig : R_TRIG;
	HL_trig : R_TRIG;
	Normal_trig : R_TRIG;
	Nedostover_trig : R_TRIG;
END_VAR





strAI.opcCommandsDisabled := strAI.inopcCommandsDisabled ;

(* ---- При первом пуске принимаем значение уставок ---- *)
IF NOT onInit THEN
          
          strAI.LL := strAI.dLL; 
          strAI.HL := strAI.dHL;

          
          IF strAI.ISVALIDREF_HA THEN strAI.HA := strAI.dHA; END_IF;
          
          IF strAI.ISVALIDREF_LA THEN strAI.LA := strAI.dLA; END_IF;
	
          IF strAI.ISVALIDREF_HW THEN strAI.HW := strAI.dHW; END_IF;
	
          IF strAI.ISVALIDREF_LW THEN strAI.LW := strAI.dLW; END_IF;	
          
	onInit  := TRUE;
END_IF;

(* ---- пересчет тока в физ величину ---- *)
k := (strAI.HL - strAI.LL)/(strAI.inpHl - strAI.inpLL);
b := strAI.LL - k * strAI.inpLL;
strAI.value := k * arAIN.dblValue + b;

(* ---- определение обрыва и кз ----- *)

strAI.blConnect :=(*(UINT_TO_WORD(arAIN.wFlags) = 1472) and*) (UINT_TO_WORD(err_mod.wValue) = 20) and (UINT_TO_WORD(err_mod.wFlags) = 192); 
IF NOT strAI.blConnect THEN 
    strAI.interval := _statusAi.NOTDEFINED;
ELSIF ((arAIN.dblValue < strAI.currentBreakCircuit) AND (strAI.currentBreakCircuit > 0.0)) OR ((strAI.interval = _statusAi.LL) AND (arAIN.dblValue < (strAI.currentBreakCircuit + 100.0))) THEN
    strAI.interval := _statusAi.LL;
ELSIF ((arAIN.dblValue > strAI.currentShotCircuit) AND (strAI.currentShotCircuit > 0.0)) OR ((strAI.interval = _statusAi.HL) AND (arAIN.dblValue > (strAI.currentShotCircuit - 100.0))) THEN
    strAI.interval := _statusAi.HL;
ELSE 
    strAI.interval := _statusAi.normal;
END_IF;

IF NOT strAI.imit THEN	
	(* Расчет апертурного фильтра*)
	ap := strAI.aperturFilter * 0.01 * (strAI.HL - strAI.LL);
	IF strAI.aperturFilter <> 0.0 THEN raznitsa := strAI.value- _lastValue;
		IF 	raznitsa < 0.0 	THEN 	rABS := -raznitsa; 		ELSE 	rABS := raznitsa; 		END_IF;
		IF 	rABS > ap 	THEN 	strAI.value := strAI.value;	ELSE 	strAI.value := _lastValue; 	END_IF;
	END_IF;

	(* Расчет экпоненциального фильтра*)
	IF strAI.exponentialFilter <> 0.0 THEN strAI.value := (strAI.exponentialFilter * strAI.value) + ((1.0 - strAI.exponentialFilter) * _lastValue); END_IF;
ELSE
	strAI.interval := _statusAi.normal;
END_IF;

IF notReliable THEN strAI.interval := _statusAi.NOTRELIABLE; END_IF;

IF NOT notReliable THEN
	IF strAI.interval >= _statusAi.normal THEN		
		strAI.interval := _statusAi.NOTDEFINED;
		h := strAI.histeresis* 0.01 * (strAI.HL-strAI.LL);
		(*определение выхода за аппаратные границы вынесено в GetData.здесь только для нужд имитации*)
		IF strAI.imit THEN
			mismatch := strAI.rassoglasovanie * 0.01 * (strAI.HL - strAI.LL);	
			IF ( strAI.value < strAI.LL - mismatch)   THEN strAI.interval := _statusAi.LL;
			ELSIF  (strAI.value > strAI.Hl + mismatch) THEN strAI.interval := _statusAi.HL; END_IF;
		ELSE
			strAI.interval := _statusAi.normal;
			IF strAI.ISVALIDREF_LA AND NOT strAI.Disabled_LA AND (strAI.interval = _statusAi.normal) THEN
				IF (strAI.value  < strAI.LA) OR ((strAI.interval = _statusAi.LA)  AND ((strAI.value - h) < strAI.LA))  THEN 
					strAI.interval := _statusAi.LA;
				END_IF;
			END_IF;
			IF strAI.ISVALIDREF_HA  AND NOT strAI.Disabled_HA AND (strAI.interval = _statusAi.normal)  THEN
				IF (strAI.value > strAI.HA) OR ((strAI.interval = _statusAi.HA)  AND ((strAI.value + h) > strAI.HA))  THEN 
					strAI.interval := _statusAi.HA;
				END_IF;
			END_IF;
			IF strAI.ISVALIDREF_LW AND NOT strAI.Disabled_LW AND (strAI.interval = _statusAi.normal)  THEN
				IF (strAI.value < strAI.LW) OR ((strAI.interval = _statusAi.LW)  AND ((strAI.value - h) < strAI.LW)) THEN 
					strAI.interval := _statusAi.LW;
				END_IF;
			END_IF;
			IF strAI.ISVALIDREF_HW AND NOT strAI.Disabled_HW  AND (strAI.interval = _statusAi.normal) THEN
				IF (strAI.value > strAI.HW)  OR ((strAI.interval = _statusAi.HW)  AND ((strAI.value + h) > strAI.HW))   THEN 
					strAI.interval := _statusAi.HW;
				END_IF;
			END_IF;	
		END_IF;
	END_IF;
ELSE
	strAI.interval := _statusAi.NOTRELIABLE;
END_IF;

IF strAI.remont THEN strAI.interval := _statusAi.NOTDEFINED; END_IF;

(* ---- Если управление с ВУ заблокировано, то  передаем команду из алгоритма ---- *)
IF strAI.inOpcCommandsDisabled THEN
	strAI.inCommand := strAI.inCommand_Alg;
ELSE (* иначе передаем команду с АРМа*)
	strAI.inCommand := strAI.inCommand_ARM;
END_IF;

_sunpackerCommand(command := strAI.inCommand);
	source := _sunpackerCommand.source;
	parametr := _sunpackerCommand.parametr;
	cmd := _sunpackerCommand.cmd;
	
IF cmd <> 0 AND lastCmd <> cmd and (((NOT strAI.opcCommandsDisabled) AND source > 0) OR source = 0) then
	CASE BYTE_TO_INT(cmd) OF
	(*cmd_SetUstavki*) 1 : 
				IF ((parametr AND _AnalogLimitFlags.LL) <> 0)		             	THEN 	strAI.LL := strAI.dLL; END_IF;
				IF ((parametr AND _AnalogLimitFlags.HL) <> 0)		 	          THEN	strAI.HL := strAI.dHL; END_IF;
				IF ((parametr AND _AnalogLimitFlags.LA) <> 0) AND strAI.ISVALIDREF_LA 	THEN	strAI.LA := strAI.dLA; END_IF;
				IF ((parametr AND _AnalogLimitFlags.HA) <> 0) AND strAI.ISVALIDREF_HA 	THEN	strAI.HA := strAI.dHA; END_IF;
				IF ((parametr AND _AnalogLimitFlags.LW) <> 0) AND strAI.ISVALIDREF_LW 	THEN	strAI.LW := strAI.dLW; END_IF;
				IF ((parametr AND _AnalogLimitFlags.HW) <> 0) AND strAI.ISVALIDREF_HW 	THEN	strAI.HW := strAI.dHW; END_IF;
	(*cmd_SetRemont*) 6 : 
				strAI.remont := TRUE;
	(*cmd_ResetRemont*) 7 : 
				strAI.remont := FALSE;
	(*cmd_kvitNotReliable*) 4 : 
				notReliable := FALSE;
	END_CASE;
	source_for_Status := source;
	cmd_for_Status := cmd;
	command_error_for_Status := 0;
	resetCmdTimer(IN := FALSE);
	resetCmdTimerPriznak := TRUE;
END_IF;
lastCmd := cmd;

resetCmdTimer(IN := resetCmdTimerPriznak, PT := T#5S);
IF resetCmdTimer.Q THEN
	resetCmdTimerPriznak := FALSE;
	source_for_Status := 0;
	cmd_for_Status := 0;
	command_error_for_Status := 0;
END_IF;
 
strAI.NS_Min := (strAI.value < strAI.minValue) AND strAI.minValue_ISVALIDREF;
strAI.NS_Max := (strAI.value > strAI.maxValue) AND strAI.maxValue_ISVALIDREF;

strAI.NS := (strAI.interval <= _statusAi.normal) AND NOT strAI.remont;

Normal_trig(CLK := strAI.interval >= _statusAi.normal);

IF NOT Normal_trig.Q THEN
	_LastValueTimer(PT := T#1S);
	IF (strAI.value<>_lastValue) OR _LastValueTimer.Q THEN
		IF (_LastValueTimer.ET>T#0MS) THEN
			strAI.ChangeSpeed:=(strAI.value-_lastValue)/(TIME_TO_LREAL(_LastValueTimer.ET));
		END_IF;
		_LastValueTimer(IN:=FALSE);
		
		_LastValueTimer(IN:=TRUE);
	END_IF;
END_IF;
_lastValue := strAI.value;

IF ((strAI.maxChangeSpeed<>0.0) OR  (strAI.maxChangeSpeedDown<>0.0)) AND ( strAI.interval>=_statusAi.normal) THEN	
		IF (strAI.ChangeSpeed>0.0) THEN
		    IF (strAI.ChangeSpeed > strAI.maxChangeSpeed) AND (strAI.maxChangeSpeed>0.0000001) THEN
			 notReliable:=TRUE;
		    END_IF;
		ELSE
		    IF (ABS(strAI.ChangeSpeed)>strAI.maxChangeSpeedDown) AND (strAI.maxChangeSpeedDown>0.0000001)  THEN
                               notReliable:=TRUE; 
		    END_IF;
		END_IF;
	
END_IF;

strAI.status := SHL(BYTE_TO_DWORD(source_for_Status), 29) 		              (* Источник команды *)
			OR SHL(BYTE_TO_DWORD(cmd_for_Status), 26) 	    (* Команда *)
			OR SHL(BYTE_TO_DWORD(command_error_for_Status), 23)   (* Ошибка команды *)
			OR SHL(BOOL_TO_DWORD(strAI.OpcCommandsDisabled ), 21) (* Управление в ВУ заблокировано *)
			OR SHL(BOOL_TO_DWORD(strAI.Disabled_HA), 9)		    (* ВА исключена из формирования интервала *)
			OR SHL(BOOL_TO_DWORD(strAI.Disabled_LA), 8)		    (* НА исключена из формирования интервала *)
			OR SHL(BOOL_TO_DWORD(strAI.Disabled_HW), 7)		    (* ВП исключена из формирования интервала *)
			OR SHL(BOOL_TO_DWORD(strAI.Disabled_LW), 6)	              (* НП исключена из формирования интервала *)
			OR SHL(BOOL_TO_DWORD(strAI.NS), 5)			    (* неиспарвность сигнала *)
			OR SHL(BOOL_TO_DWORD(strAI.remont), 4)	              (* Выведен в ремонт *)
			OR BYTE_TO_DWORD(strAI.interval);	              (* интервал *)

			
