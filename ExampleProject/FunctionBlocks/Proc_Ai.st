FUNCTION_BLOCK Proc_Ai

VAR
	fb_A1 : fb_AiSourceMlp;
	fb_A2 : fb_AiSourceMlp;
END_VAR

VAR_EXTERNAL
	Ai : AiConfig;
	arAIN_0 : TItemAIN;
	arAIN_1 : TItemAIN;
	AI_0_dblValue : LREAL;
	AI_1_dblValue : LREAL;
	arERR_0 : TItemDIN;;
END_VAR

fb_A1(arAIN := arAIN_0, strAI := Ai.A1, err_mod := arERR_0);
AI_0_dblValue := arAIN_0.dblValue;

fb_A2(arAIN := arAIN_1, strAI := Ai.A2, err_mod := arERR_0);
AI_1_dblValue := arAIN_1.dblValue;

