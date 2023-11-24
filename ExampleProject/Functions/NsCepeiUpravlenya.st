FUNCTION NsCepeiUpravlenya : BOOL

VAR_INPUT
	IM : ImConfig;
END_VAR

NsCepeiUpravlenya := (
	IM.Kran4.Sz OR
	IM.Kran2.Sz OR
	IM.Kran3.So OR
	IM.Nu.breakCmdOn OR
	IM.Nu2.breakCmdOn OR
	IM.Avom1.breakCmdOn OR
	IM.Avom2.breakCmdOn OR
	IM.Avom3.breakCmdOn OR
	IM.Avom4.breakCmdOn OR
	IM.Mv.breakCmdOn);