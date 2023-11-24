TYPE
struct_AI : STRUCT (*Дескриптор канала аналогового ввода.*)
	value : LREAL; (*пересчитанное значение в физ.величину*)
	status : DWORD; (*статус *)
	interval : BYTE; (*интервал*)
	inCommand : WORD; (*Команда с ВУ*)
	blConnect : BOOL; (*Наличие связи с модулем*)
	dLL : LREAL; (*Новое значение НГ*)
	dHL : LREAL; (*Новое значение ВГ*)
	dLA : LREAL; (*Новое значение НA*)
	dHA : LREAL; (*Новое значение ВА*)
	dLW : LREAL; (*Новое значение НП*)
	dHW : LREAL; (*Новое значение ВП*)
	LL : LREAL; (* Текущее значение НГ*)
	HL : LREAL; (* Текущее значение ВГ*)
	LA : LREAL; (* Текущее значение НА*)
	HA : LREAL; (* Текущее значение ВА*)
	LW : LREAL; (* Текущее значение НП*)
	HW : LREAL; (* Текущее значение ВП*)
	ISVALIDREF_LA : BOOL; (*Признак того, что НА граница используется*)
	ISVALIDREF_HA : BOOL; (*Признак того, что ВА граница используется *)
	ISVALIDREF_LW : BOOL; (*Признак того, что НП граница используется*)
	ISVALIDREF_HW : BOOL; (*Признак того, что ВП граница используется*)
	inpLL : LREAL; (*Нижний токовый диапазон входного сигнала*)
	inpHL : LREAL; (*Верхний токовый диапазон входного сигнала*)
	CurrentShotCircuit : LREAL; (*Верхняя токовая граница для формирования КЗ*)
	CurrentBreakCircuit : LREAL; (*Нижняя токовая граница для формирования Обрыва*)
	maxChangeSpeed : LREAL; (*Максимальная скорость изменения сигнала 1/сек*)
	maxChangeSpeedDown : LREAL; (*Максимальная скорость изменения сигнала 1/сек (на понижение)*)
	ChangeSpeed : LREAL; (*Скорость изменения*)
	histeresis : LREAL; (*Гистерезис.( % от физической шкалы) Уставка устранения дребезга по предупредительной сигнализации*)
	aperturFilter : LREAL; (*Уставка апертурного фильтра (фильтрация малых изменений сигнала)*)
	exponentialFilter : LREAL; (*Уставка экпоненциального фильтра*)
	rassoglasovanie : LREAL; (*Уставка рассогласования от аппаратных границ. В процентах от диапазона*)
	OpcCommandsDisabled : BOOL; (*Признак того, что управление с ВУ заблокировано*)
	Disabled_LA : BOOL; (*Признак того, что НА границу не нужно учитывать при формировании интервала*)
	Disabled_HA : BOOL; (*Признак того, что ВА границу не нужно учитывать при формировании интервала*)
	Disabled_LW : BOOL; (*Признак того, что НП границу не нужно учитывать при формировании интервала*)
	Disabled_HW : BOOL; (*Признак того, что ВП границу не нужно учитывать при формировании интервала*)
	delayLA : TIME;
	delayLW : TIME;
	delayHW : TIME;
	delayHA : TIME;
	minValue_ISVALIDREF : BOOL;
	maxValue_ISVALIDREF : BOOL;
	minValue : LREAL;
	maxValue : LREAL;
	inOpcCommandsDisabled : BOOL;
	imit : BOOL;
	remont : BOOL;
	NS : BOOL;
	NS_Min : BOOL;
	NS_Max : BOOL;
	inCommand_Alg : WORD;
	inCommand_ARM : WORD;
END_STRUCT;
END_TYPE
