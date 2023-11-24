FUNCTION AnyDiscretPs : BOOL

VAR_INPUT
	Im : ImConfig;
END_VAR

AnyDiscretPs := 
Im.SingleSignals.SI0.Q;