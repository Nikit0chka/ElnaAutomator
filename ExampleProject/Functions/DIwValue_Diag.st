FUNCTION DIwValue_Diag : UDINT

VAR_INPUT
	val1 : UINT;
	val2 : UINT;
END_VAR

VAR
	val1_tmp : DWORD;
	val2_tmp : DWORD;
END_VAR

(* Переставлем биты value и reability местами для корректного отображения в MasterScada *)

val1_tmp:=(SHL(UINT_TO_DWORD(val1),1) AND 16#AAAA) OR (SHR(UINT_TO_DWORD(val1),1) AND 16#5555); 

val2_tmp:=(SHL(UINT_TO_DWORD(val2),1) AND 16#AAAA) OR (SHR(UINT_TO_DWORD(val2),1) AND 16#5555);

(* Вместо reability = 1 посдставляем инверсию сигнала в виде , если нет reability тогда обрыв = 1 для MasterScada *)

DIwValue_Diag:= DWORD_TO_UDINT((val1_tmp OR shl(val2_tmp, 16)) XOR 16#55555555);