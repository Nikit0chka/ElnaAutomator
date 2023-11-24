FUNCTION_BLOCK Opc_Protections_set 

VAR_EXTERNAL
	Protections : ProtectionsConfig;
	Protections_Ap1_status : UDINT;
	Protections_AiP1_status : UDINT;
	Protections_AiP2_status : UDINT;
	Protections_AiP3_status : UDINT;
	Protections_DiP1_status : UDINT;
	Protections_DiP2_status : UDINT;
	Protections_DiP3_status : UDINT;
	Protections_DiP4_status : UDINT;
	Protections_DiP5_status : UDINT;
END_VAR

Protections_Ap1_status := DWORD_TO_UDINT(Protections.Ap1.status);

Protections_AiP1_status := DWORD_TO_UDINT(Protections.AiP1.status);

Protections_AiP2_status := DWORD_TO_UDINT(Protections.AiP2.status);

Protections_AiP3_status := DWORD_TO_UDINT(Protections.AiP3.status);

Protections_DiP1_status := DWORD_TO_UDINT(Protections.DiP1.status);

Protections_DiP2_status := DWORD_TO_UDINT(Protections.DiP2.status);

Protections_DiP3_status := DWORD_TO_UDINT(Protections.DiP3.status);

Protections_DiP4_status := DWORD_TO_UDINT(Protections.DiP4.status);

Protections_DiP5_status := DWORD_TO_UDINT(Protections.DiP5.status);

