FUNCTION_BLOCK Opc_Ai_set 

VAR_EXTERNAL
	Ai : AiConfig;
	AI_A1_HW : LREAL;
	AI_A1_HA : LREAL;
	AI_A1_LA : LREAL;
	AI_A1_LW : LREAL;
	AI_A1_HL : LREAL;
	AI_A1_LL : LREAL;
	AI_A1_value : LREAL;
	AI_A1_status : UDINT;
	AI_A2_HW : LREAL;
	AI_A2_HA : LREAL;
	AI_A2_LA : LREAL;
	AI_A2_LW : LREAL;
	AI_A2_HL : LREAL;
	AI_A2_LL : LREAL;
	AI_A2_value : LREAL;
	AI_A2_status : UDINT;
END_VAR

AI_A1_HW := Ai.A1.HW;
AI_A1_HA := Ai.A1.HA;
AI_A1_LA := Ai.A1.LA;
AI_A1_LW := Ai.A1.LW;
AI_A1_LL := Ai.A1.LL;
AI_A1_HL := Ai.A1.HL;
AI_A1_value := Ai.A1.value;
AI_A1_status := DWORD_TO_UDINT(Ai.A1.status);

AI_A2_HW := Ai.A2.HW;
AI_A2_HA := Ai.A2.HA;
AI_A2_LA := Ai.A2.LA;
AI_A2_LW := Ai.A2.LW;
AI_A2_LL := Ai.A2.LL;
AI_A2_HL := Ai.A2.HL;
AI_A2_value := Ai.A2.value;
AI_A2_status := DWORD_TO_UDINT(Ai.A2.status);

