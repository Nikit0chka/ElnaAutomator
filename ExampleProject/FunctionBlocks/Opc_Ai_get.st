FUNCTION_BLOCK Opc_Ai_get 

VAR_EXTERNAL
	Ai : AiConfig;
	AI_A1_newHW : LREAL;
	AI_A1_newHA : LREAL;
	AI_A1_newLA : LREAL;
	AI_A1_newLW : LREAL;
	AI_A1_newHL : LREAL;
	AI_A1_newLL : LREAL;
	AI_A1_command : UINT;
	AI_A2_newHW : LREAL;
	AI_A2_newHA : LREAL;
	AI_A2_newLA : LREAL;
	AI_A2_newLW : LREAL;
	AI_A2_newHL : LREAL;
	AI_A2_newLL : LREAL;
	AI_A2_command : UINT;
END_VAR

Ai.A1.dHW := AI_A1_newHW;
Ai.A1.dHA := AI_A1_newHA;
Ai.A1.dLA := AI_A1_newLA;
Ai.A1.dLW := AI_A1_newLW;
Ai.A1.dHL := AI_A1_newHL;
Ai.A1.dLL := AI_A1_newLL;
Ai.A1.inCommand_ARM := UINT_TO_WORD(AI_A1_command);

Ai.A2.dHW := AI_A2_newHW;
Ai.A2.dHA := AI_A2_newHA;
Ai.A2.dLA := AI_A2_newLA;
Ai.A2.dLW := AI_A2_newLW;
Ai.A2.dHL := AI_A2_newHL;
Ai.A2.dLL := AI_A2_newLL;
Ai.A2.inCommand_ARM := UINT_TO_WORD(AI_A2_command);

