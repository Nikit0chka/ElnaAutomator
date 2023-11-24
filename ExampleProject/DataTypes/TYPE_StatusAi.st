TYPE
TYPE_StatusAi : STRUCT (*Интервал аналогового сигнала*)
	NOTDEFINED : BYTE := 0; (*Неопределен *)
	LL : BYTE := 1; (*Обрыв *)
	HL : BYTE := 2; (*КЗ *)
	NOTRELIABLE : BYTE := 3; (*Недостоверный*)
	normal : BYTE := 4; (*Норма *)
	LW : BYTE := 5; (*Нижняя пердупредительная граница*)
	HW : BYTE := 6; (*Верхняя предупредительная граница*)
	LA : BYTE := 7; (*Нижняя аварийная граница*)
	HA : BYTE := 8; (* Верхняя аварийная граница*)
END_STRUCT;
END_TYPE
