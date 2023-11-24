FUNCTION_BLOCK fb_AiProtection_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	controlLimit : BYTE;
	delay : TIME;
	inTag : BYTE;
	inRunOnStart : BOOL;
END_VAR

VAR_IN_OUT
	str_AIp : struct_AiProtection;
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры  AiProtection          *****)

 Init := FALSE;
    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        str_AIp.controlLimit        := controlLimit;
        str_AIp.delay               := delay;
        str_AIp.inTag               := inTag;
        str_AIp.inRunOnStart        := inRunOnStart;
           
        data_Ini:=FALSE;
        Init := TRUE;
    END_IF;
    IF Init THEN
        controlLimit:= 0;
        delay:= T#0S;
        inTag:= 0;
        inRunOnStart:= FALSE;
    END_IF;    