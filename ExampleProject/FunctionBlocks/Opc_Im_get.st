FUNCTION_BLOCK Opc_Im_get 

VAR_EXTERNAL
	Im : ImConfig;
	Im_Kran1_inCommand_ARM : UINT;
	Im_Kran4_inCommand_ARM : UINT;
	Im_Kran2_inCommand_ARM : UINT;
	Im_Kran3_inCommand_ARM : UINT;
	Im_Nu_inCommand_ARM : UINT;
	Im_Nu2_inCommand_ARM : UINT;
	Im_Avom1_inCommand_ARM : UINT;
	Im_Avom2_inCommand_ARM : UINT;
	Im_Avom3_inCommand_ARM : UINT;
	Im_Avom4_inCommand_ARM : UINT;
	Im_Mv_inCommand_ARM : UINT;
	Im_SectionSwitch1_inCommand_ARM : UINT;
END_VAR

Im.Kran1.inCommand_ARM := UINT_TO_WORD(Im_Kran1_inCommand_ARM);

Im.Kran4.inCommand_ARM := UINT_TO_WORD(Im_Kran4_inCommand_ARM);

Im.Kran2.inCommand_ARM := UINT_TO_WORD(Im_Kran2_inCommand_ARM);

Im.Kran3.inCommand_ARM := UINT_TO_WORD(Im_Kran3_inCommand_ARM);

Im.Nu.inCommand_ARM := UINT_TO_WORD(Im_Nu_inCommand_ARM);

Im.Nu2.inCommand_ARM := UINT_TO_WORD(Im_Nu2_inCommand_ARM);

Im.Avom1.inCommand_ARM := UINT_TO_WORD(Im_Avom1_inCommand_ARM);

Im.Avom2.inCommand_ARM := UINT_TO_WORD(Im_Avom2_inCommand_ARM);

Im.Avom3.inCommand_ARM := UINT_TO_WORD(Im_Avom3_inCommand_ARM);

Im.Avom4.inCommand_ARM := UINT_TO_WORD(Im_Avom4_inCommand_ARM);

Im.Mv.inCommand_ARM := UINT_TO_WORD(Im_Mv_inCommand_ARM);

Im.SectionSwitch1.inCommand_ARM := UINT_TO_WORD(Im_SectionSwitch1_inCommand_ARM);

