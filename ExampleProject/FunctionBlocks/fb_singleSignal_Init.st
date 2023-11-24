FUNCTION_BLOCK fb_singleSignal_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	inverse : BOOL;
	DelayOn : TIME;
	DelayOff : TIME;
END_VAR

VAR_IN_OUT
	str_SS : struct_singleSignal; (*Дескриптор AI-канала.*)
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры  singleSignal          *****)
Init := FALSE;

    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        str_SS.inverse                := inverse;
        str_SS.DelayOn                := DelayOn;
        str_SS.DelayOff               := DelayOff;
              
        data_Ini:=FALSE;
        Init := TRUE;
    END_IF;
 IF Init THEN 
        inverse := FALSE;
        DelayOn := T#0S;
        DelayOff:= T#0S;
 END_IF;