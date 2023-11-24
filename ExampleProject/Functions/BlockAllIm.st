FUNCTION BlockAllIm : BOOL

VAR_IN_OUT
	IM : ImConfig;
END_VAR

IF NOT IM.Kran1.inOpcCommandsDisabled THEN IM.Kran1.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Kran4.inOpcCommandsDisabled THEN IM.Kran4.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Kran2.inOpcCommandsDisabled THEN IM.Kran2.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Kran3.inOpcCommandsDisabled THEN IM.Kran3.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Nu.inOpcCommandsDisabled THEN IM.Nu.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Nu2.inOpcCommandsDisabled THEN IM.Nu2.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Avom1.inOpcCommandsDisabled THEN IM.Avom1.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Avom2.inOpcCommandsDisabled THEN IM.Avom2.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Avom3.inOpcCommandsDisabled THEN IM.Avom3.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Avom4.inOpcCommandsDisabled THEN IM.Avom4.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.Mv.inOpcCommandsDisabled THEN IM.Mv.inOpcCommandsDisabled := TRUE; END_IF;
IF NOT IM.SectionSwitch1.inOpcCommandsDisabled THEN IM.SectionSwitch1.inOpcCommandsDisabled := TRUE; END_IF;
