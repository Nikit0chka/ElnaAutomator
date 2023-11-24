TYPE
struct_Kran : STRUCT 
	inCommand : WORD;
	status : DWORD;
	onStatus : BYTE;
	inOpcCommandsDisabled : BOOL;
	sdvig : BOOL;
	Ns : BOOL;
	Dp : BOOL;
	CommandFault : BOOL;
	Accident : BOOL;
	Auto : BOOL;
	Manual : BOOL;
	Local : BOOL;
	Distance : BOOL;
	ErrorPowerOff : BOOL;
	ErrorBlock : BOOL;
	So : BOOL;
	Sz : BOOL;
	OpcCommandsDisabled : BOOL;
	lastCmdIsOn : BOOL;
	ISVALIDREF_statOn : BOOL;
	ISVALIDREF_statOff : BOOL;
	ISVALIDREF_cmdOn : BOOL;
	ISVALIDREF_cmdOff : BOOL;
	ISVALIDREF_inSo : BOOL;
	ISVALIDREF_inSz : BOOL;
	ISVALIDREF_inDp : BOOL;
	continueHoldCommand : TIME;
	inCommand_Alg : WORD;
	inCommand_ARM : WORD;
	cmdOn : BOOL;
	cmdOff : BOOL;
	reliability : BOOL;
END_STRUCT;
END_TYPE
