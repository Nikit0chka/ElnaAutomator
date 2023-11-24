FUNCTION_BLOCK fb_DiSourceMlp

VAR_INPUT
	arDIN : TItemDIN;
	err_mod : TItemDIN;
END_VAR

VAR_IN_OUT
	strDI : struct_DI;
END_VAR

VAR_OUTPUT
	Bounce : BOOL; (*Дребезг контактов*)
END_VAR

VAR
	_value : WORD;
	_reliability : BOOL;
	bitNumber : INT;
	bitNum : INT;
END_VAR






strDI.blConnect := (*((UINT_TO_WORD(arDIN.wFlags) = 1472) and*) (UINT_TO_WORD(err_mod.wValue) = 20) and (UINT_TO_WORD(err_mod.wFlags) = 192);
Bounce := (UINT_TO_WORD(arDIN.wFlags) AND 16#0020) <> 0;

If NOT strDI.imit THEN
_value:=UINT_TO_WORD(arDIN.wValue);

    IF strDI.blConnect THEN
          strDI.reliability:=0;
          strDI.value:=0;
	FOR bitNumber:=0 TO 7 BY 1 DO
          
		_reliability:=WORD_TO_BOOL(SHR(_value, bitNumber*2) AND 16#2);
		strDI.reliability:=strDI.reliability OR SHL(BOOL_TO_WORD(_reliability),bitNumber);
		IF _reliability THEN
			strDI.value:=strDI.value OR SHL((SHR(_value, bitNumber*2) AND 16#1),bitNumber);
		END_IF;
	END_FOR;
    ELSE
	strDI.reliability := 0;
    END_IF;
    
    FOR bitNum:=0 TO 15 BY 1 DO
	          strDI.bits[bitNum].reliability :=WORD_TO_BOOL(SHR(strDI.reliability, bitNum) AND 16#1);
	IF strDI.bits[bitNum].reliability THEN
		strDI.bits[bitNum].value :=WORD_TO_BOOL(SHR(strDI.value, bitNum) AND 16#1);
                    strDI.bits[bitNum]._inversed :=NOT strDI.bits[bitNum].value;
	END_IF;
    END_FOR;
    
    
    
END_IF;


