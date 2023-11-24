FUNCTION_BLOCK fb_Kran_Init

VAR_INPUT
	data_Ini : BOOL; (*Флаг необходимости инициализации параметров.*)
	ISVALIDREF_statOn : BOOL;
	ISVALIDREF_statOff : BOOL;
	ISVALIDREF_cmdOn : BOOL;
	ISVALIDREF_cmdOff : BOOL;
	ISVALIDREF_inSo : BOOL;
	ISVALIDREF_inSz : BOOL;
	ISVALIDREF_inDp : BOOL   := False;
	continueHoldCommand : TIME;
END_VAR

VAR_IN_OUT
	str_Kr : struct_Kran; (*Дескриптор AI-канала.*)
END_VAR

VAR_OUTPUT
	Init : BOOL   := FALSE; (*Флаг успешно выполненной инициализации.*)
END_VAR





(*****            Функциональный блок переинициализации структуры  Kran          *****)

        Init := False;
    
    IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
        str_Kr.ISVALIDREF_statOn                := ISVALIDREF_statOn;
        str_Kr.ISVALIDREF_statOff               := ISVALIDREF_statOff;
        str_Kr.ISVALIDREF_cmdOn                 := ISVALIDREF_cmdOn;
        str_Kr.ISVALIDREF_cmdOff                := ISVALIDREF_cmdOff;
        str_Kr.ISVALIDREF_inSo                  := ISVALIDREF_inSo;
        str_Kr.ISVALIDREF_inSz                  := ISVALIDREF_inSz;     
        str_Kr.ISVALIDREF_inDp                  := ISVALIDREF_inDp;
        str_Kr.continueHoldCommand              := continueHoldCommand;     
     
        data_Ini:=False;
        Init := TRUE;
   END_IF; 
 IF Init THEN       
        ISVALIDREF_statOn:= false;
        ISVALIDREF_statOff:= false;
        ISVALIDREF_cmdOn:= false;
        ISVALIDREF_cmdOff:= false;
        ISVALIDREF_inSo:= false;
        ISVALIDREF_inSz:= false;     
        ISVALIDREF_inDp:= false;
        continueHoldCommand:= T#0S; 
  END_IF;  
        
       


