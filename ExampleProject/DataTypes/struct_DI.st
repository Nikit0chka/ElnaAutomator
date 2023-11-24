TYPE
struct_DI : STRUCT 
	imit : BOOL;
	value : WORD;
	reliability : WORD;
	bits : ARRAY [0..15] OF TYPE_ReliableBit;
	blConnect : BOOL;
END_STRUCT;
END_TYPE
