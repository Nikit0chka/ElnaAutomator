FUNCTION_BLOCK fb_singleSignal

VAR_INPUT
	signal : TYPE_ReliableBit;
END_VAR

VAR_IN_OUT
	str_SS : struct_singleSignal;
END_VAR

VAR
	TimerOn : TON;
	TimerOff : TOF;
END_VAR






str_SS.reliability:=signal.reliability;

IF NOT str_SS.inverse THEN
TimerOn(IN:=(signal.value AND str_SS.reliability AND NOT str_SS.Disabled_Sig), PT:=str_SS.DelayOn);
ELSE
TimerOn(IN:=(signal._inversed AND str_SS.reliability AND NOT str_SS.Disabled_Sig), PT:=str_SS.DelayOn);	
END_IF;

TimerOff(IN:=TimerOn.Q, PT:=str_SS.DelayOff);

str_SS.Q:=TimerOff.Q;

str_SS.status:= SHL(BOOL_TO_DWORD(NOT str_SS.reliability), 15)
	OR BOOL_TO_DWORD(str_SS.Q);         	