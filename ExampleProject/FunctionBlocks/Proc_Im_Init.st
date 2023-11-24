FUNCTION_BLOCK Proc_Im_Init

VAR_INPUT
	init : BOOL;
END_VAR

VAR
	stKr_Ini : fb_Kran_Init;
	stSw_Ini : fb_Switch_Init;
	stOp_Ini : fb_OilPump_Init;
	stSSw_Ini : fb_SectionSwitch_Init;
	stSs_Ini : fb_singleSignal_Init; 
	stSo_Ini : fb_singleOutput_Init;
	inits : UINT;
END_VAR

VAR_INPUT
	initiales : UINT;
END_VAR

VAR_EXTERNAL
	Im : ImConfig;
END_VAR

stKr_Ini(str_Kr := Im.Kran1,
ISVALIDREF_inDp := TRUE,
ISVALIDREF_inSo := TRUE,
ISVALIDREF_inSz := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

stKr_Ini(str_Kr := Im.Kran4,
ISVALIDREF_inDp := TRUE,
ISVALIDREF_inSo := TRUE,
ISVALIDREF_inSz := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

stKr_Ini(str_Kr := Im.Kran2,
ISVALIDREF_inDp := TRUE,
ISVALIDREF_inSo := TRUE,
ISVALIDREF_inSz := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

stKr_Ini(str_Kr := Im.Kran3,
ISVALIDREF_inDp := TRUE,
ISVALIDREF_inSo := TRUE,
ISVALIDREF_inSz := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

stOp_Ini(str_Op := Im.Nu,
ISVALIDREF_inBreakCmdOn := TRUE,
ISVALIDREF_inBreakCmdOff := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stOp_Ini.Init);

stOp_Ini(str_Op := Im.Nu2,
ISVALIDREF_inBreakCmdOn := TRUE,
ISVALIDREF_inBreakCmdOff := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stOp_Ini.Init);

stSSw_Ini(str_Sw := Im.Mv,
ISVALIDREF_inBreakCmdOn := TRUE,
ISVALIDREF_inBreakCmdOff := TRUE,
ISVALIDREF_basketRolledIn := TRUE,
ISVALIDREF_basketRolledout := TRUE,
ISVALIDREF_basketTest := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stSSw_Ini.Init);

stSSw_Ini(str_Sw := Im.SectionSwitch1);
inits := inits + BOOL_TO_UINT(stSSw_Ini.Init);

stSw_Ini(str_Sw := Im.Avom1,
ISVALIDREF_inBreakCmdOn := TRUE,
ISVALIDREF_inBreakCmdOff := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

stSw_Ini(str_Sw := Im.Avom2,
ISVALIDREF_inBreakCmdOn := TRUE,
ISVALIDREF_inBreakCmdOff := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

stSw_Ini(str_Sw := Im.Avom3,
ISVALIDREF_inBreakCmdOn := TRUE,
ISVALIDREF_inBreakCmdOff := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

stSw_Ini(str_Sw := Im.Avom4,
ISVALIDREF_inBreakCmdOn := TRUE,
ISVALIDREF_inBreakCmdOff := TRUE,
ISVALIDREF_statOn := TRUE,
ISVALIDREF_statOff := TRUE,
ISVALIDREF_cmdOn := TRUE,
ISVALIDREF_cmdOff := TRUE);
inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI0);
inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI1);
inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI2);
inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI3);
inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI4);
inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI5);
inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI6);
inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So0);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So1);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So2);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So3);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So4);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So5);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So6);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So7);
inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

initiales := 0;
IF init THEN initiales := inits; END_IF;