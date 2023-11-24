FUNCTION_BLOCK Opc_Im_set 

VAR_EXTERNAL
	Im : ImConfig;
	Im_Kran1_status : UDINT;
	Im_Kran4_status : UDINT;
	Im_Kran2_status : UDINT;
	Im_Kran3_status : UDINT;
	Im_Nu_status : UDINT;
	Im_Nu2_status : UDINT;
	Im_Avom1_status : UDINT;
	Im_Avom2_status : UDINT;
	Im_Avom3_status : UDINT;
	Im_Avom4_status : UDINT;
	Im_Mv_status : UDINT;
	Im_SectionSwitch1_status : UDINT;
	Im_SingleSignals_SI0_status : UDINT;
	Im_SingleSignals_SI1_status : UDINT;
	Im_SingleSignals_SI2_status : UDINT;
	Im_SingleSignals_SI3_status : UDINT;
	Im_SingleSignals_SI4_status : UDINT;
	Im_SingleSignals_SI5_status : UDINT;
	Im_SingleSignals_SI6_status : UDINT;
END_VAR

Im_Kran1_status := DWORD_TO_UDINT(Im.Kran1.status);

Im_Kran4_status := DWORD_TO_UDINT(Im.Kran4.status);

Im_Kran2_status := DWORD_TO_UDINT(Im.Kran2.status);

Im_Kran3_status := DWORD_TO_UDINT(Im.Kran3.status);

Im_Nu_status := DWORD_TO_UDINT(Im.Nu.status);

Im_Nu2_status := DWORD_TO_UDINT(Im.Nu2.status);

Im_Avom1_status := DWORD_TO_UDINT(Im.Avom1.status);

Im_Avom2_status := DWORD_TO_UDINT(Im.Avom2.status);

Im_Avom3_status := DWORD_TO_UDINT(Im.Avom3.status);

Im_Avom4_status := DWORD_TO_UDINT(Im.Avom4.status);

Im_Mv_status := DWORD_TO_UDINT(Im.Mv.status);

Im_SectionSwitch1_status := DWORD_TO_UDINT(Im.SectionSwitch1.status);

Im_SingleSignals_SI0_status := DWORD_TO_UDINT(Im.SingleSignals.SI0.status);

Im_SingleSignals_SI1_status := DWORD_TO_UDINT(Im.SingleSignals.SI1.status);

Im_SingleSignals_SI2_status := DWORD_TO_UDINT(Im.SingleSignals.SI2.status);

Im_SingleSignals_SI3_status := DWORD_TO_UDINT(Im.SingleSignals.SI3.status);

Im_SingleSignals_SI4_status := DWORD_TO_UDINT(Im.SingleSignals.SI4.status);

Im_SingleSignals_SI5_status := DWORD_TO_UDINT(Im.SingleSignals.SI5.status);

Im_SingleSignals_SI6_status := DWORD_TO_UDINT(Im.SingleSignals.SI6.status);

