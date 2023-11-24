FUNCTION NsCepeiControl : BOOL

VAR_INPUT
	IM : ImConfig;
END_VAR

NsCepeiControl := NOT (
	IM.Kran1.reliability OR
	IM.Kran4.reliability OR
	IM.Kran2.reliability OR
	IM.Kran3.reliability OR
	IM.Nu.reliability OR
	IM.Nu2.reliability OR
	IM.Avom1.reliability OR
	IM.Avom2.reliability OR
	IM.Avom3.reliability OR
	IM.Avom4.reliability OR
	IM.Mv.reliability OR
	IM.SectionSwitch1.reliability);