FUNCTION UnBlockAllIm : BOOL

VAR_IN_OUT
	IM : ImConfig;
END_VAR

IF IM.Kran1.inOpcCommandsDisabled THEN IM.Kran1.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Kran4.inOpcCommandsDisabled THEN IM.Kran4.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Kran2.inOpcCommandsDisabled THEN IM.Kran2.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Kran3.inOpcCommandsDisabled THEN IM.Kran3.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Nu.inOpcCommandsDisabled THEN IM.Nu.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Nu2.inOpcCommandsDisabled THEN IM.Nu2.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Avom1.inOpcCommandsDisabled THEN IM.Avom1.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Avom2.inOpcCommandsDisabled THEN IM.Avom2.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Avom3.inOpcCommandsDisabled THEN IM.Avom3.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Avom4.inOpcCommandsDisabled THEN IM.Avom4.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.Mv.inOpcCommandsDisabled THEN IM.Mv.inOpcCommandsDisabled := FALSE; END_IF;
IF IM.SectionSwitch1.inOpcCommandsDisabled THEN IM.SectionSwitch1.inOpcCommandsDisabled := FALSE; END_IF;
