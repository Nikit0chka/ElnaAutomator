FUNCTION_BLOCK fb_OilPump_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	ISVALIDREF_statOn : BOOL;
	ISVALIDREF_statOff : BOOL;
	ISVALIDREF_cmdOn : BOOL;
	ISVALIDREF_cmdOff : BOOL;
	ISVALIDREF_inBreakCmdOn : BOOL;
	ISVALIDREF_inBreakCmdOff : BOOL;
END_VAR

VAR_IN_OUT
	str_Op : struct_OilPump;
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры  НУ          *****)


 Init := FALSE;
    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        str_Op.ISVALIDREF_statOn                := ISVALIDREF_statOn;
        str_Op.ISVALIDREF_statOff               := ISVALIDREF_statOff;
        str_Op.ISVALIDREF_cmdOn                 := ISVALIDREF_cmdOn;
        str_Op.ISVALIDREF_cmdOff                := ISVALIDREF_cmdOff;
        str_Op.ISVALIDREF_inBreakCmdOn          := ISVALIDREF_inBreakCmdOn;
        str_Op.ISVALIDREF_inBreakCmdOff         := ISVALIDREF_inBreakCmdOff;      
        data_Ini:=FALSE;
        Init := TRUE;
    END_IF;

        ISVALIDREF_statOn:= FALSE;
        ISVALIDREF_statOff:= FALSE;
        ISVALIDREF_cmdOn:= FALSE;
        ISVALIDREF_cmdOff:= FALSE;
        ISVALIDREF_inBreakCmdOn:= FALSE;
        ISVALIDREF_inBreakCmdOff:= FALSE;