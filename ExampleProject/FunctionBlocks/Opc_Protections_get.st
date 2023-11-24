FUNCTION_BLOCK Opc_Protections_get 

VAR_EXTERNAL
	Protections : ProtectionsConfig;
	Protections_Ap1_inCommand_ARM : UINT;
	Protections_AiP1_inCommand_ARM : UINT;
	Protections_AiP2_inCommand_ARM : UINT;
	Protections_AiP3_inCommand_ARM : UINT;
	Protections_DiP1_inCommand_ARM : UINT;
	Protections_DiP2_inCommand_ARM : UINT;
	Protections_DiP3_inCommand_ARM : UINT;
	Protections_DiP4_inCommand_ARM : UINT;
	Protections_DiP5_inCommand_ARM : UINT;
END_VAR

Protections.Ap1.inCommand_ARM := UINT_TO_WORD(Protections_Ap1_inCommand_ARM);

Protections.AiP1.inCommand_ARM := UINT_TO_WORD(Protections_AiP1_inCommand_ARM);

Protections.AiP2.inCommand_ARM := UINT_TO_WORD(Protections_AiP2_inCommand_ARM);

Protections.AiP3.inCommand_ARM := UINT_TO_WORD(Protections_AiP3_inCommand_ARM);

Protections.DiP1.inCommand_ARM := UINT_TO_WORD(Protections_DiP1_inCommand_ARM);

Protections.DiP2.inCommand_ARM := UINT_TO_WORD(Protections_DiP2_inCommand_ARM);

Protections.DiP3.inCommand_ARM := UINT_TO_WORD(Protections_DiP3_inCommand_ARM);

Protections.DiP4.inCommand_ARM := UINT_TO_WORD(Protections_DiP4_inCommand_ARM);

Protections.DiP5.inCommand_ARM := UINT_TO_WORD(Protections_DiP5_inCommand_ARM);

