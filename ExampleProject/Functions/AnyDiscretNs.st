FUNCTION AnyDiscretNs : BOOL

VAR_INPUT
	Di : DiConfig;
END_VAR

AnyDiscretNs := 
((Di.Di.reliability <> 255) OR
(Di.Di1.reliability <> 255) OR
(Di.Di2.reliability <> 255) OR
(Di.Di3.reliability <> 255) OR
(Di.Di4.reliability <> 255));