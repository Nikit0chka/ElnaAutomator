FUNCTION_BLOCK Proc_Protections_Init

VAR_INPUT
	init : BOOL;
END_VAR

VAR
	stDIp_Ini : fb_DiProtection_Init;
	stAIp_Ini : fb_AiProtection_Init;
	inits : UINT;
END_VAR

VAR_INPUT
	initiales : UINT;
END_VAR

VAR_EXTERNAL
	Protections : ProtectionsConfig;
END_VAR

VAR
	_ProtectionTags : TYPE_ProtectionTags;
	_StatusAi : TYPE_StatusAi;
END_VAR

inits := 0;

stAIp_Ini(data_Ini := TRUE, delay := T#1S, inTag := _ProtectionTags.AOS, inRunOnStart := TRUE,
controlLimit := _StatusAi.LA, str_AIp := Protections.Ap1);
inits := inits + BOOL_TO_UINT(stAIp_Ini.Init);

stAIp_Ini(data_Ini := TRUE, delay := T#2S, inTag := _ProtectionTags.AOS, inRunOnStart := FALSE,
controlLimit := _StatusAi.HA, str_AIp := Protections.AiP1);
inits := inits + BOOL_TO_UINT(stAIp_Ini.Init);

stAIp_Ini(data_Ini := TRUE, delay := T#3S, inTag := _ProtectionTags.AOS, inRunOnStart := TRUE,
controlLimit := _StatusAi.LA, str_AIp := Protections.AiP2);
inits := inits + BOOL_TO_UINT(stAIp_Ini.Init);

stAIp_Ini(data_Ini := TRUE, delay := T#4S, inTag := _ProtectionTags.AOS, inRunOnStart := FALSE,
controlLimit := _StatusAi.HA, str_AIp := Protections.AiP3);
inits := inits + BOOL_TO_UINT(stAIp_Ini.Init);

stDIp_Ini(data_Ini := TRUE, delay := T#1S, inTag := _ProtectionTags.AOS, inRunOnStart := TRUE, str_DIp := Protections.DiP1);
inits := inits + BOOL_TO_UINT(stDIp_Ini.Init);

stDIp_Ini(data_Ini := TRUE, delay := T#2S, inTag := _ProtectionTags.AOS, inRunOnStart := TRUE, str_DIp := Protections.DiP2);
inits := inits + BOOL_TO_UINT(stDIp_Ini.Init);

stDIp_Ini(data_Ini := TRUE, delay := T#3S, inTag := _ProtectionTags.AOS, inRunOnStart := TRUE, str_DIp := Protections.DiP3);
inits := inits + BOOL_TO_UINT(stDIp_Ini.Init);

stDIp_Ini(data_Ini := TRUE, delay := T#4S, inTag := _ProtectionTags.AOS, inRunOnStart := FALSE, str_DIp := Protections.DiP4);
inits := inits + BOOL_TO_UINT(stDIp_Ini.Init);

stDIp_Ini(data_Ini := TRUE, delay := T#5S, inTag := _ProtectionTags.AOS, inRunOnStart := FALSE, str_DIp := Protections.DiP5);
inits := inits + BOOL_TO_UINT(stDIp_Ini.Init);

IF init THEN initiales := inits; END_IF;