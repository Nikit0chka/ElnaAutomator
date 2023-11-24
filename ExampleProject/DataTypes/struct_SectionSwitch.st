TYPE
struct_SectionSwitch : STRUCT 
	inCommand : WORD;
	status : DWORD;
	onStatus : BYTE;
	inOpcCommandsDisabled : BOOL;
	sdvig : BOOL;
	Ns : BOOL;
	CommandFault : BOOL;
	Accident : BOOL;
	Local : BOOL;
	Distance : BOOL;
	OpcCommandsDisabled : BOOL;
	lastCmdIsOn : BOOL;
	offKNA : BOOL;
	basketStatus : BYTE;
	ISVALIDREF_statOn : BOOL;
	ISVALIDREF_statOff : BOOL;
	ISVALIDREF_cmdOn : BOOL;
	ISVALIDREF_cmdOff : BOOL;
	ISVALIDREF_inBreakCmdOn : BOOL;
	ISVALIDREF_inBreakCmdOff : BOOL;
	BreakCmdOn : BOOL;
	BreakCmdOff : BOOL;
	ISVALIDREF_basketRolledIn : BOOL;
	ISVALIDREF_basketRolledOut : BOOL;
	ISVALIDREF_basketTest : BOOL;
	inCommand_Alg : WORD;
	inCommand_ARM : WORD;
	cmdOn : BOOL;
	cmdOff : BOOL;
	reliability : BOOL;
END_STRUCT;
END_TYPE
