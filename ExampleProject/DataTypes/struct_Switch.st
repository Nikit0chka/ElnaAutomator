TYPE
struct_Switch : STRUCT 
	inCommand : WORD;
	status : DWORD;
	onStatus : BYTE;
	inOpcCommandsDisabled : BOOL;
	sdvig : BOOL;
	Ns : BOOL;
	CommandFault : BOOL;
	Accident : BOOL;
	Auto : BOOL;
	Manual : BOOL;
	Local : BOOL;
	Distance : BOOL;
	ErrorPowerOff : BOOL;
	ErrorBlock : BOOL;
	BreakCmdOn : BOOL;
	BreakCmdOff : BOOL;
	OpcCommandsDisabled : BOOL;
	lastCmdIsOn : BOOL;
	ISVALIDREF_statOn : BOOL;
	ISVALIDREF_statOff : BOOL;
	ISVALIDREF_cmdOn : BOOL;
	ISVALIDREF_cmdOff : BOOL;
	ISVALIDREF_inBreakCmdOn : BOOL;
	ISVALIDREF_inBreakCmdOff : BOOL;
	inCommand_Alg : WORD;
	inCommand_ARM : WORD;
	cmdOn : BOOL;
	cmdOff : BOOL;
	reliability : BOOL;
END_STRUCT;
END_TYPE
