TYPE
struct_AiProtection : STRUCT 
	controlLimit : BYTE;
	delay : TIME;
	inTag : BYTE;
	inRunOnStart : BOOL;
	inCanRun : BOOL;
	inOpcCommandsDisabled : BOOL;
	inCommand : WORD;
	inCommand_Alg : WORD;
	inCommand_ARM : WORD;
	Tag : BYTE;
	status : DWORD;
	CanRun : BOOL;
	OpcCommandsDisabled : BOOL;
	isRunning : BOOL;
	HasError : BOOL;
	isEnded : BOOL;
	Remont : BOOL;
	Check : BOOL;
	Signaling : BOOL;
	SignalingTP : BOOL;
	RunOnStart : BOOL;
END_STRUCT;
END_TYPE
