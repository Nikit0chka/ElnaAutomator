FUNCTION_BLOCK Proc_Im

VAR
	fb_Kran1 : fb_Kran;
	fb_Kran4 : fb_Kran;
	fb_Kran2 : fb_Kran;
	fb_Kran3 : fb_Kran;
	fb_Nu : fb_OilPump;
	fb_Nu2 : fb_OilPump;
	fb_Mv : fb_SectionSwitch;
	fb_SectionSwitch1 : fb_SectionSwitch;
	fb_Avom1 : fb_Switch;
	fb_Avom2 : fb_Switch;
	fb_Avom3 : fb_Switch;
	fb_Avom4 : fb_Switch;
	fb_So0 : fb_singleOutput;
	fb_So1 : fb_singleOutput;
	fb_So2 : fb_singleOutput;
	fb_So3 : fb_singleOutput;
	fb_So4 : fb_singleOutput;
	fb_So5 : fb_singleOutput;
	fb_So6 : fb_singleOutput;
	fb_So7 : fb_singleOutput;
	fb_SI0 : fb_singleSignal;
	fb_SI1 : fb_singleSignal;
	fb_SI2 : fb_singleSignal;
	fb_SI3 : fb_singleSignal;
	fb_SI4 : fb_singleSignal;
	fb_SI5 : fb_singleSignal;
	fb_SI6 : fb_singleSignal;
END_VAR

VAR_EXTERNAL
	di : DiConfig;
	od : DoConfig;
	Im : ImConfig;
END_VAR

fb_Kran1(statOn := di.Di.bits[1]._inversed,
statOn_reliability := di.Di.bits[1].reliability,
statOff := di.Di.bits[2]._inversed,
statOff_reliability := di.Di.bits[2].reliability,
cmdOn := od.Do1.bits[1],
cmdOff := od.Do2.bits[0],
inDp := di.Di1.bits[1],
inSo := di.Di.bits[3],
inSz := di.Di.bits[2],
strKr := Im.Kran1);

fb_Kran4(statOn := di.Di1.bits[2]._inversed,
statOn_reliability := di.Di1.bits[2].reliability,
statOff := di.Di2.bits[2]._inversed,
statOff_reliability := di.Di2.bits[2].reliability,
cmdOn := od.Do3.bits[2],
cmdOff := od.Do1.bits[2],
inDp := di.Di.bits[2],
inSo := di.Di2.bits[3],
inSz := di.Di1.bits[1],
strKr := Im.Kran4);

fb_Kran2(statOn := di.Di2.bits[3].value,
statOn_reliability := di.Di2.bits[3].reliability,
statOff := di.Di3.bits[1].value,
statOff_reliability := di.Di3.bits[1].reliability,
cmdOn := od.Do3.bits[3],
cmdOff := od.Do2.bits[3],
inDp := di.Di4.bits[3],
inSo := di.Di1.bits[1],
inSz := di.Di1.bits[2],
strKr := Im.Kran2);

fb_Kran3(statOn := di.Di3.bits[4]._inversed,
statOn_reliability := di.Di3.bits[4].reliability,
statOff := di.Di4.bits[3]._inversed,
statOff_reliability := di.Di4.bits[3].reliability,
cmdOn := od.Do2.bits[4],
cmdOff := od.Do3.bits[4],
inDp := di.Di4.bits[4],
inSo := di.Di1.bits[2],
inSz := di.Di4.bits[3],
strKr := Im.Kran3);

fb_Nu(statOn := di.Di.bits[1]._inversed,
statOn_reliability := di.Di.bits[1].reliability,
statOff := di.Di.bits[2]._inversed,
statOff_reliability := di.Di.bits[2].reliability,
cmdOn := od.Do2.bits[1],
cmdOff := od.Do1.bits[0],
inBreakCmdOn := di.Di.bits[3],
inBreakCmdOff := di.Di1.bits[4],
StrSw := Im.Nu);

fb_Nu2(statOn := di.Di2.bits[2].value,
statOn_reliability := di.Di2.bits[2].reliability,
statOff := di.Di3.bits[3].value,
statOff_reliability := di.Di3.bits[3].reliability,
cmdOn := od.Do4.bits[3],
cmdOff := od.Do1.bits[4],
inBreakCmdOn := di.Di.bits[4],
inBreakCmdOff := di.Di1.bits[3],
StrSw := Im.Nu2);

fb_Avom1(statOn := di.Di.bits[1].value,
statOn_reliability := di.Di.bits[1].reliability,
statOff := di.Di1.bits[2].value,
statOff_reliability := di.Di1.bits[2].reliability,
cmdOn := od.Do1.bits[1],
cmdOff := od.Do1.bits[0],
inBreakCmdOn := di.Di1.bits[2],
inBreakCmdOff := di.Di.bits[2],
StrSw := Im.Avom1);

fb_Avom2(statOn := di.Di3.bits[2]._inversed,
statOn_reliability := di.Di3.bits[2].reliability,
statOff := di.Di.bits[2]._inversed,
statOff_reliability := di.Di.bits[2].reliability,
cmdOn := od.Do4.bits[3],
cmdOff := od.Do2.bits[1],
inBreakCmdOn := di.Di1.bits[3],
inBreakCmdOff := di.Di1.bits[3],
StrSw := Im.Avom2);

fb_Avom3(statOn := di.Di1.bits[3]._inversed,
statOn_reliability := di.Di1.bits[3].reliability,
statOff := di.Di2.bits[3]._inversed,
statOff_reliability := di.Di2.bits[3].reliability,
cmdOn := od.Do1.bits[5],
cmdOff := od.Do3.bits[3],
inBreakCmdOn := di.Di3.bits[4],
inBreakCmdOff := di.Di2.bits[4],
StrSw := Im.Avom3);

fb_Avom4(statOn := di.Di.bits[4]._inversed,
statOn_reliability := di.Di.bits[4].reliability,
statOff := di.Di.bits[4]._inversed,
statOff_reliability := di.Di.bits[4].reliability,
cmdOn := od.Do2.bits[4],
cmdOff := od.Do3.bits[4],
inBreakCmdOn := di.Di3.bits[5],
inBreakCmdOff := di.Di4.bits[5],
StrSw := Im.Avom4);

fb_Mv(statOn := di.Di.bits[1]._inversed,
statOn_reliability := di.Di.bits[1].reliability,
statOff := di.Di.bits[2]._inversed,
statOff_reliability := di.Di.bits[2].reliability,
cmdOn := od.Do2.bits[1],
cmdOff := od.Do2.bits[0],
inBreakCmdOn := di.Di3.bits[4],
inBreakCmdOff := di.Di4.bits[3],
basketRolledin := di.Di.bits[2],
basketRolledout := di.Di.bits[3],
basketTest := di.Di1.bits[3],
StrSw := Im.Mv);

fb_SectionSwitch1(StrSw := Im.SectionSwitch1);

fb_SI0(signal := di.Di1.bits[1], str_SS := Im.SingleSignals.SI0);

fb_SI1(signal := di.Di1.bits[2], str_SS := Im.SingleSignals.SI1);

fb_SI2(signal := di.Di.bits[3], str_SS := Im.SingleSignals.SI2);

fb_SI3(signal := di.Di1.bits[4], str_SS := Im.SingleSignals.SI3);

fb_SI4(signal := di.Di3.bits[5], str_SS := Im.SingleSignals.SI4);

fb_SI5(signal := di.Di3.bits[6], str_SS := Im.SingleSignals.SI5);

fb_SI6(signal := di.Di4.bits[7], str_SS := Im.SingleSignals.SI6);

fb_So0(signal := od.Do1.bits[1], str_SO := Im.SingleOutputs.So0);

fb_So1(signal := od.Do2.bits[2], str_SO := Im.SingleOutputs.So1);

fb_So2(signal := od.Do3.bits[3], str_SO := Im.SingleOutputs.So2);

fb_So3(signal := od.Do1.bits[4], str_SO := Im.SingleOutputs.So3);

fb_So4(signal := od.Do2.bits[5], str_SO := Im.SingleOutputs.So4);

fb_So5(signal := od.Do1.bits[6], str_SO := Im.SingleOutputs.So5);

fb_So6(signal := od.Do1.bits[7], str_SO := Im.SingleOutputs.So6);

fb_So7(signal := od.Do2.bits[8], str_SO := Im.SingleOutputs.So7);

