FUNCTION_BLOCK fb_DO_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	imit : BOOL   := FALSE; (*Действие при неисправности канала AI.*)
END_VAR

VAR_IN_OUT
	strDO : struct_DO; (*Дескриптор DO-канала.*)
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры-дескриптора канала дискретного ввода.            *****)
 Init := FALSE;


    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        strDO.imit       := imit;
        data_Ini:=FALSE;
        Init := TRUE;
    END_IF;
  IF Init THEN  
imit:=FALSE;
   END_IF;