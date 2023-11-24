FUNCTION_BLOCK fb_SectionSwitch_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	ISVALIDREF_statOn : BOOL;
	ISVALIDREF_statOff : BOOL;
	ISVALIDREF_cmdOn : BOOL;
	ISVALIDREF_cmdOff : BOOL;
	ISVALIDREF_inBreakCmdOn : BOOL;
	ISVALIDREF_inBreakCmdOff : BOOL;
	ISVALIDREF_basketRolledIn : BOOL;
	ISVALIDREF_basketRolledOut : BOOL;
	ISVALIDREF_basketTest : BOOL;
END_VAR

VAR_IN_OUT
	str_Sw : struct_SectionSwitch; (*Дескриптор AI-канала.*)
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры  МВ          *****)

 Init := FALSE;
    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        str_Sw.ISVALIDREF_statOn                := ISVALIDREF_statOn;
        str_Sw.ISVALIDREF_statOff               := ISVALIDREF_statOff;
        str_Sw.ISVALIDREF_cmdOn                 := ISVALIDREF_cmdOn;
        str_Sw.ISVALIDREF_cmdOff                := ISVALIDREF_cmdOff;
        str_Sw.ISVALIDREF_inBreakCmdOn          := ISVALIDREF_inBreakCmdOn;
        str_Sw.ISVALIDREF_inBreakCmdOff         := ISVALIDREF_inBreakCmdOff;      
        str_Sw.ISVALIDREF_basketRolledIn        := ISVALIDREF_basketRolledIn;
        str_Sw.ISVALIDREF_basketRolledOut       := ISVALIDREF_basketRolledOut;   
        str_Sw.ISVALIDREF_basketTest            := ISVALIDREF_basketTest;
        data_Ini:=FALSE;
        Init := TRUE;
    END_IF;
IF Init THEN 
        ISVALIDREF_statOn:= FALSE;
        ISVALIDREF_statOff:= FALSE;
        ISVALIDREF_cmdOn:= FALSE;
        ISVALIDREF_cmdOff:= FALSE;
        ISVALIDREF_inBreakCmdOn:= FALSE;
        ISVALIDREF_inBreakCmdOff:= FALSE;
        ISVALIDREF_basketRolledIn:= FALSE;
        ISVALIDREF_basketRolledOut:= FALSE;   
        ISVALIDREF_basketTest:= FALSE;
END_IF;