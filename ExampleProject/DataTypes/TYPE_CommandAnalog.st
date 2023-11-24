TYPE
TYPE_CommandAnalog : STRUCT (*Команды, обрабатываемые ФБ Аналогоый сигнал*)
	cmd_SetUstavki : WORD := 1; (*Принять уставки*)
	cmd_SetRemont : WORD := 2; (*Вывести в ремонт*)
	cmd_ResetRemont : WORD := 3; (*Вывести из ремонта*)
	cmd_kvitNotReliable : WORD := 4; (*Квитировать недостоверность*)
END_STRUCT;
END_TYPE
