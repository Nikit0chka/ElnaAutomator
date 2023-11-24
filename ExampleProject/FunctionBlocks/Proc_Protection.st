FUNCTION_BLOCK Proc_Protection

VAR_EXTERNAL
	Protections : ProtectionsConfig;
	Ai : AiConfig;
	Im : ImConfig;
END_VAR

VAR
	fb_Ap1 : fb_AiProtection;
	fb_AiP1 : fb_AiProtection;
	fb_AiP2 : fb_AiProtection;
	fb_AiP3 : fb_AiProtection;
	fb_DiP1 : fb_DiProtection;
	fb_DiP2 : fb_DiProtection;
	fb_DiP3 : fb_DiProtection;
	fb_DiP4 : fb_DiProtection;
	fb_DiP5 : fb_DiProtection;
END_VAR

fb_Ap1(ai := Ai.A1, StrAIp := Protections.Ap1);

fb_AiP1(ai := Ai.A2, StrAIp := Protections.AiP1);

fb_AiP2(ai := Ai.A1, StrAIp := Protections.AiP2);

fb_AiP3(ai := Ai.A2, StrAIp := Protections.AiP3);

fb_DiP1(di := Im.SingleSignals.SI2, StrDIp := Protections.DiP1);

fb_DiP2(di := Im.SingleSignals.SI0, StrDIp := Protections.DiP2);

fb_DiP3(di := Im.SingleSignals.SI0, StrDIp := Protections.DiP3);

fb_DiP4(di := Im.SingleSignals.SI2, StrDIp := Protections.DiP4);

fb_DiP5(di := Im.SingleSignals.SI4, StrDIp := Protections.DiP5);

