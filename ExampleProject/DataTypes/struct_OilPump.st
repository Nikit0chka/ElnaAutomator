TYPE
struct_OilPump : STRUCT 
	inCommand : WORD;
	inCommand_Alg : WORD;
	inCommand_ARM : WORD;
	status : DWORD;
	onStatus : BYTE;
	inOpcCommandsDisabled : BOOL;
	sdvig : BOOL;
	Ns : BOOL;
	CommandFault : BOOL;
	Accident : BOOL;
	Local : BOOL;
	Distance : BOOL;
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
	inBlocked : BOOL;
	Blocked : BOOL;
	Osnovnoy : BOOL;
	Rezervny : BOOL;
	cmdOn : BOOL;
	cmdOff : BOOL;
	reliability : BOOL;
END_STRUCT;
END_TYPE
