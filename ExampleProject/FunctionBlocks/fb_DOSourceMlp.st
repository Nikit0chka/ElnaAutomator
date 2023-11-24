FUNCTION_BLOCK fb_DOSourceMlp

VAR_IN_OUT
	arDout : TWordData; (*Данные для модуля DO.*)
END_VAR

VAR_INPUT
	err_mod : TItemDIN;
END_VAR

VAR_IN_OUT
	strDO : struct_DO; (*Текущие параметры канала DO.*)
END_VAR

VAR
	bitNumber : INT;
END_VAR






strDO.blConnect := ((UINT_TO_WORD(err_mod.wValue) = 20) and (UINT_TO_WORD(err_mod.wFlags) = 192));

strDO.value:=0;

FOR bitNumber:=0 TO 15 BY 1 DO
	strDO.value:=strDO.value OR (SHL(BOOL_TO_WORD(strDO.bits[bitNumber]),bitNumber));
END_FOR;

IF NOT strDO.imit THEN
	 arDout.wValue:= WORD_TO_UINT(strDO.value);
END_IF;
