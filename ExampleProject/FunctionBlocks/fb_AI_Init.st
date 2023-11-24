FUNCTION_BLOCK fb_AI_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	dLL : LREAL;
	dHL : LREAL;
	dLA : LREAL;
	dHA : LREAL;
	dLW : LREAL;
	dHW : LREAL;
	ISVALIDREF_LA : BOOL   := False;
	ISVALIDREF_HA : BOOL   := False;
	ISVALIDREF_LW : BOOL   := False;
	ISVALIDREF_HW : BOOL   := False;
	delayLA : TIME   := T#0S;
	delayLW : TIME   := T#0S;
	delayHW : TIME   := T#0S;
	delayHA : TIME   := T#0S;
	inpLL : LREAL   := 4000.0;
	inpHL : LREAL   := 20000.0;
	CurrentShotCircuit : LREAL   := 21000.0;
	CurrentBreakCircuit : LREAL   := 3700.0;
	maxChangeSpeed : LREAL;
	maxChangeSpeedDown : LREAL;
	histeresis : LREAL;
	aperturFilter : LREAL;
	exponentialFilter : LREAL;
	rassoglasovanie : LREAL;
	inOpcCommandsDisabled : BOOL;
END_VAR

VAR_IN_OUT
	strAI : struct_AI; (*Дескриптор AI-канала.*)
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры-дескриптора канала аналогового ввода.            *****)
     Init := false;

    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        strAI.dLL                := dLL;
        strAI.dHL                := dHL;
        strAI.dLA                := dLA;
        strAI.dHA                := dHA;
        strAI.dLW                := dLW;
        strAI.dHW                := dHW;
        strAI.ISVALIDREF_LA      := ISVALIDREF_LA;
        strAI.ISVALIDREF_HA      := ISVALIDREF_HA;
        strAI.ISVALIDREF_LW      := ISVALIDREF_LW;
        strAI.ISVALIDREF_HW      := ISVALIDREF_HW;
        strAI.delayLA            := delayLA;
        strAI.delayLW            := delayLW;
        strAI.delayHW            := delayHW;
        strAI.delayHA            := delayHA;
        strAI.inpLL              := inpLL;
        strAI.inpHL              := inpHL;
        strAI.CurrentShotCircuit := CurrentShotCircuit;
        strAI.CurrentBreakCircuit:= CurrentBreakCircuit;
        strAI.maxChangeSpeed     := maxChangeSpeed;
        strAI.maxChangeSpeedDown := maxChangeSpeedDown;
        strAI.histeresis         := histeresis;
        strAI.aperturFilter      := aperturFilter;
        strAI.exponentialFilter  := exponentialFilter;
        strAI.rassoglasovanie    := rassoglasovanie;
        strAI.rassoglasovanie    := rassoglasovanie;
        
        data_Ini:=false;
        Init := TRUE;
     END_IF; 
  IF Init THEN     
        dLL:= 0.0;
        dHL:= 0.0;
        dLA:= 0.0;
        dHA:= 0.0;
        dLW:= 0.0;
        dHW:= 0.0;
        inpLL:= 4000.0;
        inpHL:= 20000.0;
        CurrentShotCircuit:= 21000.0;
        CurrentBreakCircuit:= 3700.0;
        ISVALIDREF_LA:= false;
        ISVALIDREF_HA:= false;
        ISVALIDREF_LW:= false;
        ISVALIDREF_HW:= false;
        delayLA:= T#0S;
        delayLW:= T#0S;
        delayHW:= T#0S;
        delayHA:= T#0S; 
        maxChangeSpeed:= 0.0;
        maxChangeSpeedDown:= 0.0;
        histeresis:= 0.0;
        aperturFilter:= 0.0;
        exponentialFilter:= 0.0;
        rassoglasovanie:= 0.0;
      END_IF;

