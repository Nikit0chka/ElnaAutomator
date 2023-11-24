FUNCTION_BLOCK fb_singleOutput_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	inOpcCommandsDisabled : BOOL;
	wait_time : TIME;
END_VAR

VAR_IN_OUT
	str_SO : struct_singleOutput; (*Дескриптор AI-канала.*)
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры  singleOutput          *****)

Init := FALSE;
    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        str_SO.inOpcCommandsDisabled    := inOpcCommandsDisabled;
        str_SO.wait_time                := wait_time;
     
         data_Ini:=FALSE;
        Init := TRUE;
    END_IF;
 IF Init THEN 
        inOpcCommandsDisabled := FALSE;
        wait_time := T#0S;
   END_IF;