FUNCTION_BLOCK fb_DiProtection_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	delay : TIME;
	inTag : BYTE;
	inRunOnStart : BOOL;
END_VAR

VAR_IN_OUT
	str_DIp : struct_DiProtection;
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры  AiProtection          *****)

 Init := FALSE;
    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        str_DIp.delay               := delay;
        str_DIp.inTag               := inTag;
        str_DIp.inRunOnStart        := inRunOnStart;
           
        data_Ini:=FALSE;
        Init := TRUE;
    END_IF;
    IF Init THEN
        delay:= T#0S;
        inTag:= 0;
        inRunOnStart:= FALSE;
    END_IF;   