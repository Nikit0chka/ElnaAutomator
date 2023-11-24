TYPE
  struct_singleOutput : STRUCT
    wait_time : TIME;
    inCommand : WORD;
    inOpcCommandsDisabled : BOOL;
    Q : BOOL;
    status : DWORD;
    OpcCommandsDisabled : BOOL;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
  END_STRUCT;
  Im_singleOutputs : STRUCT
    So0 : struct_singleOutput;
    So1 : struct_singleOutput;
    So2 : struct_singleOutput;
    So3 : struct_singleOutput;
    So4 : struct_singleOutput;
    So5 : struct_singleOutput;
    So6 : struct_singleOutput;
    So7 : struct_singleOutput;
  END_STRUCT;
  struct_SectionSwitch : STRUCT
    inCommand : WORD;
    status : DWORD;
    onStatus : BYTE;
    inOpcCommandsDisabled : BOOL;
    sdvig : BOOL;
    Ns : BOOL;
    CommandFault : BOOL;
    Accident : BOOL;
    Local : BOOL;
    Distance : BOOL;
    OpcCommandsDisabled : BOOL;
    lastCmdIsOn : BOOL;
    offKNA : BOOL;
    basketStatus : BYTE;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inBreakCmdOn : BOOL;
    ISVALIDREF_inBreakCmdOff : BOOL;
    BreakCmdOn : BOOL;
    BreakCmdOff : BOOL;
    ISVALIDREF_basketRolledIn : BOOL;
    ISVALIDREF_basketRolledOut : BOOL;
    ISVALIDREF_basketTest : BOOL;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
    cmdOn : BOOL;
    cmdOff : BOOL;
    reliability : BOOL;
  END_STRUCT;
  TYPE_ReliableBit : STRUCT
    value : BOOL;
    reliability : BOOL;
    _inversed : BOOL;
  END_STRUCT;
  struct_DI : STRUCT
    imit : BOOL;
    value : WORD;
    reliability : WORD;
    bits : ARRAY [0..15] OF TYPE_ReliableBit;
    blConnect : BOOL;
  END_STRUCT;
  DiConfig : STRUCT
    Di : struct_DI;
    Di1 : struct_DI;
    Di2 : struct_DI;
    Di3 : struct_DI;
    Di4 : struct_DI;
  END_STRUCT;
  TYPE_ProtectionTags : STRUCT
    NOTHING : BYTE := 0;
    AOB : BYTE := 1;
    AOS : BYTE := 2;
    AOPOJ : BYTE := 3;
  END_STRUCT;
  struct_singleSignal : STRUCT
    reliability : BOOL;
    inverse : BOOL;
    DelayOn : TIME;
    DelayOff : TIME;
    Q : BOOL;
    status : DWORD;
    Disabled_Sig : BOOL;
  END_STRUCT;
  struct_AiProtection : STRUCT
    controlLimit : BYTE;
    delay : TIME;
    inTag : BYTE;
    inRunOnStart : BOOL;
    inCanRun : BOOL;
    inOpcCommandsDisabled : BOOL;
    inCommand : WORD;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
    Tag : BYTE;
    status : DWORD;
    CanRun : BOOL;
    OpcCommandsDisabled : BOOL;
    isRunning : BOOL;
    HasError : BOOL;
    isEnded : BOOL;
    Remont : BOOL;
    Check : BOOL;
    Signaling : BOOL;
    SignalingTP : BOOL;
    RunOnStart : BOOL;
  END_STRUCT;
  TDoubleData : STRUCT
    wFlags : UINT := 0;
    dblValue : LREAL := 0.0;
  END_STRUCT;
  struct_DO : STRUCT
    imit : BOOL;
    blConnect : BOOL;
    value : WORD;
    bits : ARRAY [0..15] OF BOOL;
  END_STRUCT;
  DoConfig : STRUCT
    Do1 : struct_DO;
    Do2 : struct_DO;
    Do3 : struct_DO;
    Do4 : struct_DO;
    Do5 : struct_DO;
  END_STRUCT;
  struct_ReserveIM2 : STRUCT
    var1 : BOOL;
    var2 : BOOL;
  END_STRUCT;
  struct_Kran : STRUCT
    inCommand : WORD;
    status : DWORD;
    onStatus : BYTE;
    inOpcCommandsDisabled : BOOL;
    sdvig : BOOL;
    Ns : BOOL;
    Dp : BOOL;
    CommandFault : BOOL;
    Accident : BOOL;
    Auto : BOOL;
    Manual : BOOL;
    Local : BOOL;
    Distance : BOOL;
    ErrorPowerOff : BOOL;
    ErrorBlock : BOOL;
    So : BOOL;
    Sz : BOOL;
    OpcCommandsDisabled : BOOL;
    lastCmdIsOn : BOOL;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inSo : BOOL;
    ISVALIDREF_inSz : BOOL;
    ISVALIDREF_inDp : BOOL;
    continueHoldCommand : TIME;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
    cmdOn : BOOL;
    cmdOff : BOOL;
    reliability : BOOL;
  END_STRUCT;
  struct_OilPump : STRUCT
    inCommand : WORD;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
    status : DWORD;
    onStatus : BYTE;
    inOpcCommandsDisabled : BOOL;
    sdvig : BOOL;
    Ns : BOOL;
    CommandFault : BOOL;
    Accident : BOOL;
    Local : BOOL;
    Distance : BOOL;
    BreakCmdOn : BOOL;
    BreakCmdOff : BOOL;
    OpcCommandsDisabled : BOOL;
    lastCmdIsOn : BOOL;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inBreakCmdOn : BOOL;
    ISVALIDREF_inBreakCmdOff : BOOL;
    inBlocked : BOOL;
    Blocked : BOOL;
    Osnovnoy : BOOL;
    Rezervny : BOOL;
    cmdOn : BOOL;
    cmdOff : BOOL;
    reliability : BOOL;
  END_STRUCT;
  struct_Switch : STRUCT
    inCommand : WORD;
    status : DWORD;
    onStatus : BYTE;
    inOpcCommandsDisabled : BOOL;
    sdvig : BOOL;
    Ns : BOOL;
    CommandFault : BOOL;
    Accident : BOOL;
    Auto : BOOL;
    Manual : BOOL;
    Local : BOOL;
    Distance : BOOL;
    ErrorPowerOff : BOOL;
    ErrorBlock : BOOL;
    BreakCmdOn : BOOL;
    BreakCmdOff : BOOL;
    OpcCommandsDisabled : BOOL;
    lastCmdIsOn : BOOL;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inBreakCmdOn : BOOL;
    ISVALIDREF_inBreakCmdOff : BOOL;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
    cmdOn : BOOL;
    cmdOff : BOOL;
    reliability : BOOL;
  END_STRUCT;
  Im_singleSignals : STRUCT
    SI0 : struct_singleSignal;
    SI1 : struct_singleSignal;
    SI2 : struct_singleSignal;
    SI3 : struct_singleSignal;
    SI4 : struct_singleSignal;
    SI5 : struct_singleSignal;
    SI6 : struct_singleSignal;
  END_STRUCT;
  ImConfig : STRUCT
    Kran1 : struct_Kran;
    Kran4 : struct_Kran;
    Kran2 : struct_Kran;
    Kran3 : struct_Kran;
    Nu : struct_OilPump;
    Nu2 : struct_OilPump;
    Avom1 : struct_Switch;
    Avom2 : struct_Switch;
    Avom3 : struct_Switch;
    Avom4 : struct_Switch;
    Mv : struct_SectionSwitch;
    SectionSwitch1 : struct_SectionSwitch;
    SingleSignals : Im_singleSignals;
    SingleOutputs : Im_singleOutputs;
  END_STRUCT;
  struct_DiProtection : STRUCT
    delay : TIME;
    inTag : BYTE;
    inRunOnStart : BOOL;
    inCanRun : BOOL;
    inOpcCommandsDisabled : BOOL;
    inCommand : WORD;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
    Tag : BYTE;
    status : DWORD;
    CanRun : BOOL;
    OpcCommandsDisabled : BOOL;
    isRunning : BOOL;
    HasError : BOOL;
    isEnded : BOOL;
    Remont : BOOL;
    Check : BOOL;
    Signaling : BOOL;
    SignalingTP : BOOL;
    RunOnStart : BOOL;
  END_STRUCT;
  ProtectionsConfig : STRUCT
    Ap1 : struct_AiProtection;
    AiP1 : struct_AiProtection;
    AiP2 : struct_AiProtection;
    AiP3 : struct_AiProtection;
    DiP1 : struct_DiProtection;
    DiP2 : struct_DiProtection;
    DiP3 : struct_DiProtection;
    DiP4 : struct_DiProtection;
    DiP5 : struct_DiProtection;
  END_STRUCT;
  TYPE_StatusAi : STRUCT
    NOTDEFINED : BYTE := 0;
    LL : BYTE := 1;
    HL : BYTE := 2;
    NOTRELIABLE : BYTE := 3;
    normal : BYTE := 4;
    LW : BYTE := 5;
    HW : BYTE := 6;
    LA : BYTE := 7;
    HA : BYTE := 8;
  END_STRUCT;
  TItemAIN : STRUCT
    wFlags : UINT := 0;
    wReserved : UINT := 0;
    dblValue : LREAL := 0.0;
    nanosec : ULINT := 0;
    reserve : ULINT := 0;
  END_STRUCT;
  TItemDIN : STRUCT
    wFlags : UINT := 0;
    wValue : UINT := 0;
    nanosec : ULINT := 0;
    reserve : ULINT := 0;
  END_STRUCT;
  struct_AI : STRUCT
    value : LREAL;
    status : DWORD;
    interval : BYTE;
    inCommand : WORD;
    blConnect : BOOL;
    dLL : LREAL;
    dHL : LREAL;
    dLA : LREAL;
    dHA : LREAL;
    dLW : LREAL;
    dHW : LREAL;
    LL : LREAL;
    HL : LREAL;
    LA : LREAL;
    HA : LREAL;
    LW : LREAL;
    HW : LREAL;
    ISVALIDREF_LA : BOOL;
    ISVALIDREF_HA : BOOL;
    ISVALIDREF_LW : BOOL;
    ISVALIDREF_HW : BOOL;
    inpLL : LREAL;
    inpHL : LREAL;
    CurrentShotCircuit : LREAL;
    CurrentBreakCircuit : LREAL;
    maxChangeSpeed : LREAL;
    maxChangeSpeedDown : LREAL;
    ChangeSpeed : LREAL;
    histeresis : LREAL;
    aperturFilter : LREAL;
    exponentialFilter : LREAL;
    rassoglasovanie : LREAL;
    OpcCommandsDisabled : BOOL;
    Disabled_LA : BOOL;
    Disabled_HA : BOOL;
    Disabled_LW : BOOL;
    Disabled_HW : BOOL;
    delayLA : TIME;
    delayLW : TIME;
    delayHW : TIME;
    delayHA : TIME;
    minValue_ISVALIDREF : BOOL;
    maxValue_ISVALIDREF : BOOL;
    minValue : LREAL;
    maxValue : LREAL;
    inOpcCommandsDisabled : BOOL;
    imit : BOOL;
    remont : BOOL;
    NS : BOOL;
    NS_Min : BOOL;
    NS_Max : BOOL;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
  END_STRUCT;
  AiConfig : STRUCT
    A1 : struct_AI;
    A2 : struct_AI;
  END_STRUCT;
  TWordData : STRUCT
    wFlags : UINT := 0;
    wValue : UINT := 0;
  END_STRUCT;
  TYPE_statusDualInput : STRUCT
    STATUS_NOTDEFINED : BYTE := 0;
    STATUS_ON : BYTE := 1;
    STATUS_OFF : BYTE := 2;
    STATUS_TRANSITIONAL : BYTE := 3;
    STATUS_ERROR : BYTE := 4;
  END_STRUCT;
  TYPE_AnalogLimitFlags : STRUCT
    NONE : BYTE := 0;
    LL : BYTE := 16#1;
    LW : BYTE := 16#2;
    HW : BYTE := 16#4;
    LA : BYTE := 16#8;
    HA : BYTE := 16#10;
    HL : BYTE := 16#20;
  END_STRUCT;
  TYPE_basketStats : STRUCT
    BASKET_NOTDEFINED : BYTE := 0;
    BASKET_ROLLEDIN : BYTE := 1;
    BASKET_ROLLEDOUT : BYTE := 2;
    BASKET_TRANSITIONAL : BYTE := 3;
    BASKET_ERROR : BYTE := 4;
    BASKET_TEST : BYTE := 5;
  END_STRUCT;
  TYPE_CommandAnalog : STRUCT
    cmd_SetUstavki : WORD := 1;
    cmd_SetRemont : WORD := 2;
    cmd_ResetRemont : WORD := 3;
    cmd_kvitNotReliable : WORD := 4;
  END_STRUCT;
  TYPE_commandDualInput : STRUCT
    CMD_ON : BYTE := 1;
    CMD_OFF : BYTE := 2;
    CMD_RESET : BYTE := 3;
  END_STRUCT;
  struct_ReserveIM : STRUCT
    var1 : BOOL;
    var2 : BOOL;
  END_STRUCT;
  struct_DiscretParametr : STRUCT
    newValue : UINT;
    currentValue : UINT;
    inOpcCommandsDisabled : BOOL;
    inCommand : WORD;
    inCommand_Alg : WORD;
    inCommand_ARM : WORD;
    status : DWORD;
    OpcCommandsDisabled : BOOL;
    Value : UINT;
  END_STRUCT;
END_TYPE

FUNCTION UnBlockAllIm : BOOL
  VAR_IN_OUT
    IM : ImConfig;
  END_VAR

  IF IM.Kran1.inOpcCommandsDisabled THEN IM.Kran1.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Kran4.inOpcCommandsDisabled THEN IM.Kran4.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Kran2.inOpcCommandsDisabled THEN IM.Kran2.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Kran3.inOpcCommandsDisabled THEN IM.Kran3.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Nu.inOpcCommandsDisabled THEN IM.Nu.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Nu2.inOpcCommandsDisabled THEN IM.Nu2.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Avom1.inOpcCommandsDisabled THEN IM.Avom1.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Avom2.inOpcCommandsDisabled THEN IM.Avom2.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Avom3.inOpcCommandsDisabled THEN IM.Avom3.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Avom4.inOpcCommandsDisabled THEN IM.Avom4.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.Mv.inOpcCommandsDisabled THEN IM.Mv.inOpcCommandsDisabled := FALSE; END_IF;
  IF IM.SectionSwitch1.inOpcCommandsDisabled THEN IM.SectionSwitch1.inOpcCommandsDisabled := FALSE; END_IF;
END_FUNCTION

FUNCTION TwoUint_To_UDINT : UDINT
  VAR_INPUT
    val1 : UINT;
    val2 : UINT;
  END_VAR

  TwoUint_To_UDINT:= DWORD_TO_UDINT(UINT_TO_DWORD(val1) OR shl(UINT_TO_DWORD(val2), 16));
END_FUNCTION

FUNCTION BlockAllProtections : BOOL
  VAR_IN_OUT
    Protections : ProtectionsConfig;
  END_VAR

  Protections.Ap1.inOpcCommandsDisabled := TRUE;
  Protections.AiP1.inOpcCommandsDisabled := TRUE;
  Protections.AiP2.inOpcCommandsDisabled := TRUE;
  Protections.AiP3.inOpcCommandsDisabled := TRUE;
  Protections.DiP1.inOpcCommandsDisabled := TRUE;
  Protections.DiP2.inOpcCommandsDisabled := TRUE;
  Protections.DiP3.inOpcCommandsDisabled := TRUE;
  Protections.DiP4.inOpcCommandsDisabled := TRUE;
  Protections.DiP5.inOpcCommandsDisabled := TRUE;
END_FUNCTION

FUNCTION BlockAllIm : BOOL
  VAR_IN_OUT
    IM : ImConfig;
  END_VAR

  IF NOT IM.Kran1.inOpcCommandsDisabled THEN IM.Kran1.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Kran4.inOpcCommandsDisabled THEN IM.Kran4.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Kran2.inOpcCommandsDisabled THEN IM.Kran2.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Kran3.inOpcCommandsDisabled THEN IM.Kran3.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Nu.inOpcCommandsDisabled THEN IM.Nu.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Nu2.inOpcCommandsDisabled THEN IM.Nu2.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Avom1.inOpcCommandsDisabled THEN IM.Avom1.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Avom2.inOpcCommandsDisabled THEN IM.Avom2.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Avom3.inOpcCommandsDisabled THEN IM.Avom3.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Avom4.inOpcCommandsDisabled THEN IM.Avom4.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.Mv.inOpcCommandsDisabled THEN IM.Mv.inOpcCommandsDisabled := TRUE; END_IF;
  IF NOT IM.SectionSwitch1.inOpcCommandsDisabled THEN IM.SectionSwitch1.inOpcCommandsDisabled := TRUE; END_IF;
END_FUNCTION

FUNCTION resetAiProtection : BOOL
  VAR_IN_OUT
    protection : struct_AiProtection;
  END_VAR
  VAR CONSTANT
    cmdReset : WORD    := 2;
  END_VAR

  IF protection.isRunning THEN
                      protection.inOpcCommandsDisabled:=TRUE;
  		protection.inCommand_Alg:=cmdReset;
  END_IF;
END_FUNCTION

FUNCTION resetDiProtection : BOOL
  VAR_IN_OUT
    protection : struct_DiProtection;
  END_VAR
  VAR CONSTANT
    cmdReset : WORD    := 2;
  END_VAR

  IF protection.isRunning THEN
                      protection.inOpcCommandsDisabled:=TRUE;
  		protection.inCommand_Alg:=cmdReset;
  END_IF;
END_FUNCTION

FUNCTION ResetAllProtections : BOOL
  VAR_IN_OUT
    Protections : ProtectionsConfig;
  END_VAR

  ResetAiProtection(Protections.Ap1);
  ResetAiProtection(Protections.AiP1);
  ResetAiProtection(Protections.AiP2);
  ResetAiProtection(Protections.AiP3);
  ResetDiProtection(Protections.DiP1);
  ResetDiProtection(Protections.DiP2);
  ResetDiProtection(Protections.DiP3);
  ResetDiProtection(Protections.DiP4);
  ResetDiProtection(Protections.DiP5);
END_FUNCTION

FUNCTION ResetAllSignaling : BOOL
  VAR_IN_OUT
    Protections : ProtectionsConfig;
  END_VAR

  IF Protections.Ap1.Signaling THEN
  	ResetAiProtection(Protections.Ap1); END_IF;
  IF Protections.AiP1.Signaling THEN
  	ResetAiProtection(Protections.AiP1); END_IF;
  IF Protections.AiP2.Signaling THEN
  	ResetAiProtection(Protections.AiP2); END_IF;
  IF Protections.AiP3.Signaling THEN
  	ResetAiProtection(Protections.AiP3); END_IF;
  IF Protections.DiP1.Signaling THEN
  	ResetDiProtection(Protections.DiP1); END_IF;
  IF Protections.DiP2.Signaling THEN
  	ResetDiProtection(Protections.DiP2); END_IF;
  IF Protections.DiP3.Signaling THEN
  	ResetDiProtection(Protections.DiP3); END_IF;
  IF Protections.DiP4.Signaling THEN
  	ResetDiProtection(Protections.DiP4); END_IF;
  IF Protections.DiP5.Signaling THEN
  	ResetDiProtection(Protections.DiP5); END_IF;
END_FUNCTION

FUNCTION AnyAnalogsPs : BOOL
  VAR_INPUT
    Ai : AiConfig;
  END_VAR
  VAR
    statusAi : TYPE_StatusAi;
  END_VAR

  AnyAnalogsPs := 
  Ai.A1.interval = statusAi.HW OR
  Ai.A2.interval = statusAi.HW OR
  Ai.A1.interval = statusAi.LW OR
  Ai.A2.interval = statusAi.LW;
END_FUNCTION

FUNCTION AnyAnalogsNs : BOOL
  VAR_INPUT
    Ai : AiConfig;
  END_VAR
  VAR
    statusAi : TYPE_StatusAi;
  END_VAR

  AnyAnalogsNs := 
  ((Ai.A1.interval < statusAi.Normal) AND NOT Ai.A1.Remont) OR
  ((Ai.A2.interval < statusAi.Normal) AND NOT Ai.A2.Remont);
END_FUNCTION

FUNCTION NsCepeiControl : BOOL
  VAR_INPUT
    IM : ImConfig;
  END_VAR

  NsCepeiControl := NOT (
  	IM.Kran1.reliability OR
  	IM.Kran4.reliability OR
  	IM.Kran2.reliability OR
  	IM.Kran3.reliability OR
  	IM.Nu.reliability OR
  	IM.Nu2.reliability OR
  	IM.Avom1.reliability OR
  	IM.Avom2.reliability OR
  	IM.Avom3.reliability OR
  	IM.Avom4.reliability OR
  	IM.Mv.reliability OR
  	IM.SectionSwitch1.reliability);
END_FUNCTION

FUNCTION EnableAiLimits : BOOL
  VAR_IN_OUT
    Ai : AiConfig;
  END_VAR

  Ai.A1.Disabled_LA := FALSE;
  Ai.A2.Disabled_LA := FALSE;
  Ai.A1.Disabled_LW := FALSE;
  Ai.A2.Disabled_LW := FALSE;
END_FUNCTION

FUNCTION AnyDiscretPs : BOOL
  VAR_INPUT
    Im : ImConfig;
  END_VAR

  AnyDiscretPs := 
  Im.SingleSignals.SI0.Q;
END_FUNCTION

FUNCTION AnyDiscretNs : BOOL
  VAR_INPUT
    Di : DiConfig;
  END_VAR

  AnyDiscretNs := 
  ((Di.Di.reliability <> 255) OR
  (Di.Di1.reliability <> 255) OR
  (Di.Di2.reliability <> 255) OR
  (Di.Di3.reliability <> 255) OR
  (Di.Di4.reliability <> 255));
END_FUNCTION

FUNCTION UnBlockAllProtections : BOOL
  VAR_IN_OUT
    Protections : ProtectionsConfig;
  END_VAR

  protections.Ap1.inOpcCommandsDisabled := FALSE;
  protections.AiP1.inOpcCommandsDisabled := FALSE;
  protections.AiP2.inOpcCommandsDisabled := FALSE;
  protections.AiP3.inOpcCommandsDisabled := FALSE;
  protections.DiP1.inOpcCommandsDisabled := FALSE;
  protections.DiP2.inOpcCommandsDisabled := FALSE;
  protections.DiP3.inOpcCommandsDisabled := FALSE;
  protections.DiP4.inOpcCommandsDisabled := FALSE;
  protections.DiP5.inOpcCommandsDisabled := FALSE;
END_FUNCTION

FUNCTION AnyProtectionSignaling : BOOL
  VAR_INPUT
    Protections : ProtectionsConfig;
  END_VAR

  AnyProtectionSignaling := 
  Protections.Ap1.Signaling OR
  Protections.AiP1.Signaling OR
  Protections.AiP2.Signaling OR
  Protections.AiP3.Signaling OR
  Protections.DiP1.Signaling OR
  Protections.DiP2.Signaling OR
  Protections.DiP3.Signaling OR
  Protections.DiP4.Signaling OR
  Protections.DiP5.Signaling;
END_FUNCTION

FUNCTION AnyProtectionInRemont : BOOL
  VAR_INPUT
    Protections : ProtectionsConfig;
  END_VAR

  AnyProtectionInRemont := 
  Protections.Ap1.Remont OR
  Protections.AiP1.Remont OR
  Protections.AiP2.Remont OR
  Protections.AiP3.Remont OR
  Protections.DiP1.Remont OR
  Protections.DiP2.Remont OR
  Protections.DiP3.Remont OR
  Protections.DiP4.Remont OR
  Protections.DiP5.Remont;
END_FUNCTION

FUNCTION runDiProtection : BOOL
  VAR_IN_OUT
    protection : struct_DiProtection;
  END_VAR
  VAR CONSTANT
    cmdRun : WORD    := 1;
  END_VAR

  IF NOT protection.isRunning THEN
                      protection.inOpcCommandsDisabled:=TRUE;
  		protection.inCommand_Alg:=cmdRun;
  END_IF;
END_FUNCTION

FUNCTION runAiProtection : BOOL
  VAR_IN_OUT
    protection : struct_AiProtection;
  END_VAR
  VAR CONSTANT
    cmdRun : WORD    := 1;
  END_VAR

  IF NOT protection.isRunning THEN
                      protection.inOpcCommandsDisabled:=TRUE;
  		protection.inCommand_Alg:=cmdRun;
  END_IF;
END_FUNCTION

FUNCTION AutoRunProtections : BOOL
  VAR_IN_OUT
    Protections : ProtectionsConfig;
  END_VAR

  RunAiProtection(Protections.Ap1);
  RunAiProtection(Protections.AiP2);
  RunDiProtection(Protections.DiP1);
  RunDiProtection(Protections.DiP2);
  RunDiProtection(Protections.DiP3);
END_FUNCTION

FUNCTION DIwValue_Diag : UDINT
  VAR_INPUT
    val1 : UINT;
    val2 : UINT;
  END_VAR
  VAR
    val1_tmp : DWORD;
    val2_tmp : DWORD;
  END_VAR

  (* Переставлем биты value и reability местами для корректного отображения в MasterScada *)

  val1_tmp:=(SHL(UINT_TO_DWORD(val1),1) AND 16#AAAA) OR (SHR(UINT_TO_DWORD(val1),1) AND 16#5555); 

  val2_tmp:=(SHL(UINT_TO_DWORD(val2),1) AND 16#AAAA) OR (SHR(UINT_TO_DWORD(val2),1) AND 16#5555);

  (* Вместо reability = 1 посдставляем инверсию сигнала в виде , если нет reability тогда обрыв = 1 для MasterScada *)

  DIwValue_Diag:= DWORD_TO_UDINT((val1_tmp OR shl(val2_tmp, 16)) XOR 16#55555555);
END_FUNCTION

FUNCTION DisableAiLimits : BOOL
  VAR_IN_OUT
    Ai : AiConfig;
  END_VAR

  Ai.A1.Disabled_LA := TRUE;
  Ai.A2.Disabled_LA := TRUE;
  Ai.A1.Disabled_LW := TRUE;
  Ai.A2.Disabled_LW := TRUE;
END_FUNCTION

FUNCTION RemontAllProtections : BOOL
  VAR_IN_OUT
    Protections : ProtectionsConfig;
  END_VAR
  VAR CONSTANT
    cmdRemont : WORD  := 4;
  END_VAR

  Protections.Ap1.inCommand_Alg := cmdRemont;
  Protections.AiP1.inCommand_Alg := cmdRemont;
  Protections.AiP2.inCommand_Alg := cmdRemont;
  Protections.AiP3.inCommand_Alg := cmdRemont;
  Protections.DiP1.inCommand_Alg := cmdRemont;
  Protections.DiP2.inCommand_Alg := cmdRemont;
  Protections.DiP3.inCommand_Alg := cmdRemont;
  Protections.DiP4.inCommand_Alg := cmdRemont;
  Protections.DiP5.inCommand_Alg := cmdRemont;
END_FUNCTION

FUNCTION NsCepeiUpravlenya : BOOL
  VAR_INPUT
    IM : ImConfig;
  END_VAR

  NsCepeiUpravlenya := (
  	IM.Kran4.Sz OR
  	IM.Kran2.Sz OR
  	IM.Kran3.So OR
  	IM.Nu.breakCmdOn OR
  	IM.Nu2.breakCmdOn OR
  	IM.Avom1.breakCmdOn OR
  	IM.Avom2.breakCmdOn OR
  	IM.Avom3.breakCmdOn OR
  	IM.Avom4.breakCmdOn OR
  	IM.Mv.breakCmdOn);
END_FUNCTION

FUNCTION_BLOCK fb_DOSourceMlp
  VAR_IN_OUT
    arDout : TWordData;
  END_VAR
  VAR_INPUT
    err_mod : TItemDIN;
  END_VAR
  VAR_IN_OUT
    strDO : struct_DO;
  END_VAR
  VAR
    bitNumber : INT;
  END_VAR

  strDO.blConnect := ((UINT_TO_WORD(err_mod.wValue) = 20) and (UINT_TO_WORD(err_mod.wFlags) = 192));

  strDO.value:=0;

  FOR bitNumber:=0 TO 15 BY 1 DO
  	strDO.value:=strDO.value OR (SHL(BOOL_TO_WORD(strDO.bits[bitNumber]),bitNumber));
  END_FOR;

  IF NOT strDO.imit THEN
  	 arDout.wValue:= WORD_TO_UINT(strDO.value);
  END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_DI_Init
  VAR_INPUT
    data_Ini : BOOL;
    imit : BOOL    := FALSE;
  END_VAR
  VAR_IN_OUT
    strDI : struct_DI;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры-дескриптора канала дискретного ввода        *****)

   Init := FALSE;


      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          strDI.imit       := imit;
          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
    IF Init THEN 
  imit:=FALSE;
      END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_sunpackerCommand
  VAR_INPUT
    command : WORD;
  END_VAR
  VAR_OUTPUT
    source : BYTE;
    parametr : BYTE;
    cmd : BYTE;
  END_VAR

  cmd := WORD_TO_BYTE(command and 16#7);
  parametr := WORD_TO_BYTE(SHR((command and 16#1FF8), 3));
  source := WORD_TO_BYTE(SHR(command, 13));
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_Switch
  VAR_INPUT
    statOn : BOOL;
    statOff : BOOL;
    statOn_reliability : BOOL;
    statOff_reliability : BOOL;
  END_VAR
  VAR_IN_OUT
    StrSw : struct_Switch;
  END_VAR
  VAR_INPUT
    inNs : TYPE_ReliableBit;
    inAccident : TYPE_ReliableBit;
    inAuto : TYPE_ReliableBit;
    inManual : TYPE_ReliableBit;
    inLocal : TYPE_ReliableBit;
    inDistance : TYPE_ReliableBit;
    inErrorPowerOff : TYPE_ReliableBit;
    inErrorBlock : TYPE_ReliableBit;
    inBreakCmdOn : TYPE_ReliableBit;
    inBreakCmdOff : TYPE_ReliableBit;
  END_VAR
  VAR
    onInit : BOOL    := FALSE;
    _statOn : BOOL;
    _statOff : BOOL;
    lastOnStatus : BYTE;
    cmd : BYTE;
    source : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    _sunpackerCommand : fb_sunpackerCommand;
    _statusDualInput : TYPE_statusDualInput;
    _commandDualInput : TYPE_commandDualInput;
    _commandErrorTimer : BOOL;
    resetErrorTimer : BOOL;
    getSdvig : BOOL;
    _changWithoutCommand : BOOL;
    errorCMDTimer : TON;
    sdvigReset : TON;
    _errorReset : TON;
    outputsSets : TOF;
  END_VAR
  VAR_IN_OUT
    cmdOn : BOOL;
    cmdOff : BOOL;
  END_VAR

  IF NOT onInit THEN
  IF StrSw.ISVALIDREF_cmdOn XOR StrSw.ISVALIDREF_cmdOff THEN
  	IF 	StrSw.ISVALIDREF_cmdOn THEN
  		lastCmd:= 2; (*baseCmdOff*) 
  	ELSE
  		lastCmd:= 1; (*baseCmdOn*) 
  	END_IF;
  END_IF;
  onInit:=TRUE;
  END_IF;

  (* ---- Если управление с ВУ заблокировано, то в ИМ передаем команду из алгоритма ---- *)
  IF StrSw.inOpcCommandsDisabled THEN
  	StrSw.inCommand := StrSw.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	StrSw.inCommand := StrSw.inCommand_ARM;
  END_IF;

  (* ---- Формирование состояния механизма ---- *)

  IF (StrSw.ISVALIDREF_statOn) OR (StrSw.ISVALIDREF_statOff) THEN
  	IF (StrSw.ISVALIDREF_statOn) AND (StrSw.ISVALIDREF_statOff) THEN
  	StrSw.reliability:= statOn_reliability AND statOff_reliability;
  		_statOn  := statOn;
  		_statOff := statOff;
  	ELSIF (StrSw.ISVALIDREF_statOn) THEN
                       StrSw.reliability:= statOn_reliability;	
  		_statOn  := statOn;
  		_statOff := NOT statOn; 
  	ELSIF (StrSw.ISVALIDREF_statOff) THEN
  		 StrSw.reliability:= statOff_reliability;	
  		_statOn  := NOT statOff;
  		_statOff :=statOff; 
  	END_IF;

  	IF StrSw.reliability THEN
  		IF _statOn AND NOT _statOff 		THEN 	StrSw.onStatus := _statusDualInput.STATUS_ON;
  		ELSIF _statOff AND NOT _statOn 	THEN 	StrSw.onStatus := _statusDualInput.Status_OFF;
  		ELSIF NOT _statOn AND NOT _statOff 	THEN 	StrSw.onStatus := _statusDualInput.STATUS_TRANSITIONAL;
  		ELSE					StrSw.onStatus := _statusDualInput.STATUS_ERROR;
                      END_IF;

  	ELSE
  		StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;

  	END_IF;
  ELSE
  	CASE BYTE_TO_INT(lastCmd) OF	
  		(*baseCmdOn*) 1: StrSw.onStatus  := _statusDualInput.STATUS_ON; 
  		(*baseCmdOff*) 2: StrSw.onStatus  := _statusDualInput.STATUS_OFF;

  	ELSE
  		 StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;

  	END_CASE;
  END_IF;


  StrSw.Accident := inAccident.value AND inAccident.reliability;
  StrSw.Ns := inNs.value AND inNs.reliability;
  StrSw.Auto := inAuto.value AND inAuto.reliability;
  StrSw.Manual := inManual.value AND inManual.reliability;
  StrSw.Local := inLocal.value AND inLocal.reliability;
  StrSw.Distance := inDistance.value AND inDistance.reliability;
  StrSw.ErrorPowerOff := inErrorPowerOff.value AND inErrorPowerOff.reliability;
  StrSw.ErrorBlock := inErrorBlock.value AND inErrorBlock.reliability;
  StrSw.OpcCommandsDisabled := StrSw.inOpcCommandsDisabled;

  (* ---- Формирование признака сдвига ---- *)	
  getSdvig := FALSE;
  IF (StrSw.ISVALIDREF_cmdOn OR StrSw.ISVALIDREF_cmdOff) AND NOT StrSw.Local THEN
  	IF NOT (StrSw.CmdOn OR StrSw.CmdOff) THEN
                       IF (lastOnStatus <> StrSw.onStatus AND 
  		(StrSw.onStatus <> _statusDualInput.STATUS_NOTDEFINED AND
                       StrSw.onStatus <> _statusDualInput.STATUS_ERROR)     AND
  		(lastOnStatus <> _statusDualInput.STATUS_NOTDEFINED   AND
                       lastOnStatus <> _statusDualInput.STATUS_ERROR))      
                      THEN
  			getSdvig   := TRUE;
  		END_IF;
  	END_IF;
  END_IF;

  IF getSdvig THEN StrSw.sdvig:= TRUE; END_IF;

  sdvigReset(IN:=StrSw.sdvig, PT:=T#15S);

  IF sdvigReset.Q THEN StrSw.sdvig:=FALSE; END_IF;

  lastOnStatus := StrSw.onStatus;

  (* ---- Распаковка команды ---- *)
  _sunpackerCommand(command := StrSw.inCommand);
  	cmd := _sunpackerCommand.cmd;
  	source := _sunpackerCommand.source;

  (* ---- Обработка команды ---- *)
  IF cmd <> 0 AND lastCmd <> cmd and (((NOT StrSw.opcCommandsDisabled) AND source > 0) OR source = 0) then
  	CASE BYTE_TO_INT(cmd) OF
  	(*cmd_open*) 1 : 
  			IF  StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := TRUE;
  				IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE; END_IF;
  			ELSIF  StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE;  END_IF;
                                lastCmd := cmd;
  			errorCMDTimer(IN := false);
  			_commandErrorTimer := true;
  			StrSw.lastCmdIsOn := true;
  	(*cmd_close*) 2 : 
  			IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := TRUE;
  				IF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
  			ELSIF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
                                lastCmd := cmd;
  			errorCMDTimer(IN := false);
  			_commandErrorTimer := true;
  			StrSw.lastCmdIsOn := false;
  	(*cmd_reset*) 3 :    IF StrSw.ISVALIDREF_statOn OR StrSw.ISVALIDREF_statOff THEN
  			StrSw.CmdOn := FALSE;
  			StrSw.CmdOff := FALSE;
                                lastCmd :=0;
  			_commandErrorTimer := false;
  			StrSw.lastCmdIsOn := false;
                                 END_IF;
  	END_CASE;	
  	source_for_Status := source;
  	cmd_for_Status := cmd;
  	command_error_for_Status := 0;
  END_IF;


  errorCMDTimer(In := _commandErrorTimer, PT :=T#10s);

  (* ---- алгоритм  для команды ВКЛючить ---- *)
  IF (StrSw.onStatus = _statusDualInput.STATUS_ON) and StrSw.lastCmdIsOn then
  	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOn := false; END_IF;

  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- off ---- *)
  IF (StrSw.onStatus = _statusDualInput.STATUS_OFF) and (NOT StrSw.lastCmdIsOn) then
  	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOff := false; END_IF;

  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- ошибка исполнения команды ---- *)
  if errorCMDTimer.Q and (cmd_for_Status <> 0) then
  	command_error_for_Status :=  cmd_for_Status;
  	_commandErrorTimer := false;
  	StrSw.CmdOn := false;
  	StrSw.CmdOff := false;
  	lastCmd := 0;
  end_if;

  (* ---- сброс ошибки команды ---- *)
  StrSw.CommandFault := command_error_for_Status <> 0;
  _errorReset(IN := command_error_for_Status <> 0, PT := T#5S);
  IF _errorReset.Q THEN
  	cmd_for_Status := 0;
  	source_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF;

  outputsSets(in := (StrSw.ISVALIDREF_cmdOn and StrSw.cmdOn ) OR (StrSw.ISVALIDREF_cmdOff and StrSw.cmdOff), PT := T#2S);
  	IF NOT outputsSets.Q THEN
  		StrSw.BreakCmdOn := inBreakCmdOn._inversed AND
                      inBreakCmdOn.reliability AND StrSw.ISVALIDREF_inBreakCmdOn;

  		StrSw.BreakCmdOff := inBreakCmdOff._inversed
                      AND inBreakCmdOff.reliability AND StrSw.ISVALIDREF_inBreakCmdOff;
  	END_IF;

  cmdOn := StrSw.cmdOn;
  cmdOff:= StrSw.cmdOff;  

  (* ---- формирование зашифрованного статуса для АРМа ---- *)
  StrSw.status := shl(BYTE_TO_DWORD(source_for_Status), 29) 
  		OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
  		OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
  		OR shl(bool_to_DWORD(StrSw.sdvig), 22)
  		OR shl(bool_to_DWORD(StrSw.OpcCommandsDisabled), 21)
                      OR shl(bool_to_DWORD(StrSw.lastCmdIsOn), 14)
                      OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOff), 13) 
  		OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOn), 12)
  		OR shl(BOOL_TO_DWORD(StrSw.ErrorBlock), 11) 
  		OR shl(BOOL_TO_DWORD(StrSw.ErrorPowerOff), 10) 
  		OR shl(BOOL_TO_DWORD(StrSw.Manual), 8) 
  		OR shl(BOOL_TO_DWORD(StrSw.Auto), 7) 
  		OR shl(BOOL_TO_DWORD(StrSw.Distance), 6) 
  		OR shl(BOOL_TO_DWORD(StrSw.Local), 5) 
  		OR shl(BOOL_TO_DWORD(StrSw.Ns), 4) 
                  	OR shl(BOOL_TO_DWORD(StrSw.Accident ),3)
  		OR BYTE_TO_DWORD(StrSw.onStatus);
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_AiProtection_Init
  VAR_INPUT
    data_Ini : BOOL;
    controlLimit : BYTE;
    delay : TIME;
    inTag : BYTE;
    inRunOnStart : BOOL;
  END_VAR
  VAR_IN_OUT
    str_AIp : struct_AiProtection;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  AiProtection          *****)

   Init := FALSE;

      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_AIp.controlLimit        := controlLimit;
          str_AIp.delay               := delay;
          str_AIp.inTag               := inTag;
          str_AIp.inRunOnStart        := inRunOnStart;

          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
      IF Init THEN
          controlLimit:= 0;
          delay:= T#0S;
          inTag:= 0;
          inRunOnStart:= FALSE;
      END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_Switch_Init
  VAR_INPUT
    data_Ini : BOOL;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inBreakCmdOn : BOOL;
    ISVALIDREF_inBreakCmdOff : BOOL;
  END_VAR
  VAR_IN_OUT
    str_Sw : struct_Switch;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  Switch          *****)

   Init := FALSE;

      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_Sw.ISVALIDREF_statOn                := ISVALIDREF_statOn;
          str_Sw.ISVALIDREF_statOff               := ISVALIDREF_statOff;
          str_Sw.ISVALIDREF_cmdOn                 := ISVALIDREF_cmdOn;
          str_Sw.ISVALIDREF_cmdOff                := ISVALIDREF_cmdOff;
          str_Sw.ISVALIDREF_inBreakCmdOn          := ISVALIDREF_inBreakCmdOn;
          str_Sw.ISVALIDREF_inBreakCmdOff         := ISVALIDREF_inBreakCmdOff;      
          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
  IF Init THEN
          ISVALIDREF_statOn:= FALSE;
          ISVALIDREF_statOff:= FALSE;
          ISVALIDREF_cmdOn:= FALSE;
          ISVALIDREF_cmdOff:= FALSE;
          ISVALIDREF_inBreakCmdOn:= FALSE;
          ISVALIDREF_inBreakCmdOff:= FALSE;   
  END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_DiProtection_Init
  VAR_INPUT
    data_Ini : BOOL;
    delay : TIME;
    inTag : BYTE;
    inRunOnStart : BOOL;
  END_VAR
  VAR_IN_OUT
    str_DIp : struct_DiProtection;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  AiProtection          *****)

   Init := FALSE;

      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_DIp.delay               := delay;
          str_DIp.inTag               := inTag;
          str_DIp.inRunOnStart        := inRunOnStart;

          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
      IF Init THEN
          delay:= T#0S;
          inTag:= 0;
          inRunOnStart:= FALSE;
      END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_AiProtection
  VAR_INPUT
    ai : struct_AI;
  END_VAR
  VAR_IN_OUT
    StrAIp : struct_AiProtection;
  END_VAR
  VAR
    _sunpackerCommand : fb_sunpackerCommand;
    _signalingTp : TOF;
    _statusAi : TYPE_StatusAi;
    source : BYTE;
    cmd : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    resetCmdTimer : TON;
    resetCmdTimerPriznak : BOOL;
    signalinTimer : TON;
    timer : TON;
    SignalingTrig : R_TRIG;
    SignalingFTrig : F_TRIG;
    SignalingAi : BOOL;
  END_VAR

  timer(IN :=(ai.interval=StrAIp.controlLimit) AND (ai.interval >= _statusAi.normal) AND StrAIp.isRunning, PT :=StrAIp.delay);
  SignalingTrig(CLK := timer.Q);
  IF SignalingTrig.Q THEN
  	SignalingAi := TRUE;
  END_IF;
  SignalingFTrig(CLK := timer.Q);
  IF SignalingFTrig.Q THEN
  	SignalingAi := FALSE;
  END_IF;

  StrAIp.Tag := StrAIp.inTag;
  StrAIp.RunOnStart := StrAIp.inRunOnStart;

  StrAIp.CanRun := StrAIp.inCanRun;

  StrAIp.OpcCommandsDisabled := StrAIp.inOpcCommandsDisabled;

  (* ---- Если управление с ВУ заблокировано, то передаем команду из алгоритма ---- *)
  IF StrAIp.inOpcCommandsDisabled THEN
  	StrAIp.inCommand := StrAIp.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	StrAIp.inCommand := StrAIp.inCommand_ARM;
  END_IF;

  _sunpackerCommand(command := StrAIp.inCommand);
  	source := _sunpackerCommand.source;
  	cmd := _sunpackerCommand.cmd;

  IF cmd <> 0 AND lastCmd <> cmd AND (((NOT StrAIp.opcCommandsDisabled) AND source > 0) OR source = 0) then

  	CASE BYTE_TO_INT(cmd) OF
  		(*cmdRun*) 1: 	IF        NOT StrAIp.Remont THEN
  					StrAIp.isEnded := FALSE;
  					StrAIp.hasError 	:= FALSE;
  					StrAIp.isRunning := TRUE;

  					cmd_for_Status := cmd;
  					source_for_Status := source;
  					command_error_for_Status := 0;
  				ELSE
  					StrAIp.isRunning := FALSE;
  					StrAIp.isEnded := FALSE;
  					StrAIp.hasError 	:= FALSE;

  					cmd_for_Status := 0;
  					source_for_Status := source;
  					command_error_for_Status := cmd;
  				END_IF;
                                          StrAIp.inopcCommandsDisabled:=FALSE;

  		(*cmdReset*) 2: 	StrAIp.isRunning := FALSE;
  				StrAIp.isEnded := FALSE;
  				StrAIp.hasError 	:= FALSE;
  				SignalingAi := FALSE;
  				StrAIp.Check := FALSE;
                                          (*StrAIp.Remont := FALSE;*)
  				cmd_for_Status := cmd;
  				source_for_Status := source;
  				command_error_for_Status := 0;
                                          StrAIp.inopcCommandsDisabled:=FALSE; 

  	(*cmd_setRemont*) 4 :	StrAIp.Remont := TRUE;
  				(*StrAIp.isRunning := FALSE;*)

  				cmd_for_Status := cmd;
  				source_for_Status := source;
  				command_error_for_Status := 0;
  	(*cmd_resetRemont*) 5 : 	(*IF (ai.interval=StrAIp.controlLimit) THEN
  					cmd_for_Status := 0;
  					source_for_Status := 0;
  					command_error_for_Status := cmd;
  				ELSE*)
  					StrAIp.Remont := FALSE;
  					(*StrAIp.isRunning := TRUE;*)

  					cmd_for_Status := cmd;
  					source_for_Status := source;
  					command_error_for_Status := 0;
  				(*END_IF;*)
  	(*cmd_setCheck*) 6 : 	StrAIp.Check := TRUE;

  				cmd_for_Status := cmd;
  				source_for_Status := source;
  				command_error_for_Status := 0;
  	END_CASE;			
  	resetCmdTimer(IN := false);
  	resetCmdTimerPriznak := TRUE;
  END_IF;
  lastCmd := cmd;


  resetCmdTimer(IN := resetCmdTimerPriznak);
  IF resetCmdTimer.Q THEN
  	resetCmdTimerPriznak := FALSE;
  	source_for_Status := 0;
  	cmd_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF; 

  IF StrAIp.isRunning AND NOT StrAIp.Remont AND NOT StrAIp.Check THEN
  	StrAIp.Signaling := SignalingAi;
  	StrAIp.SignalingTP := _signalingTp.Q;
  ELSE
  	StrAIp.Signaling := 0;
  	StrAIp.SignalingTP := 0;
  END_IF;

  _signalingTp(in := StrAIp.Signaling, PT := T#1s);




  StrAIp.status :=  SHL(BYTE_TO_DWORD(source_for_Status), 29) 
  			OR SHL(BYTE_TO_DWORD(cmd_for_Status), 26) 
  			OR SHL(BYTE_TO_DWORD(command_error_for_Status), 23)
  			OR SHL(BOOL_TO_DWORD(StrAIp.OpcCommandsDisabled ), 21)
  			OR SHL(BOOL_TO_DWORD(StrAIp.Signaling), 16)
  			OR SHL(BOOL_TO_DWORD(StrAIp.RunOnStart ), 15)
  			OR SHL(BOOL_TO_DWORD(StrAIp.remont), 6)
  			OR SHL(BOOL_TO_DWORD(StrAIp.Check), 5)
  			OR SHL(BOOL_TO_DWORD(StrAIp.hasError), 4)
  			OR SHL(BOOL_TO_DWORD(StrAIp.SignalingTP), 3)
  			OR SHL(BOOL_TO_DWORD(StrAIp.CanRun), 2)
  			OR SHL(BOOL_TO_DWORD(StrAIp.isEnded), 1)
  			OR BOOL_TO_DWORD(StrAIp.isRunning);
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_DiProtection
  VAR_INPUT
    di : struct_singleSignal;
  END_VAR
  VAR_IN_OUT
    StrDIp : struct_DiProtection;
  END_VAR
  VAR
    _sunpackerCommand : fb_sunpackerCommand;
    _ProtectionTags : TYPE_ProtectionTags;
    _signalingTp : TOF;
    timer : TON;
    SignalingTrig : R_TRIG;
    SignalingFTrig : F_TRIG;
    SignalingDi : BOOL;
    source : BYTE;
    cmd : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    resetCmdTimer : TON;
    resetCmdTimerPriznak : BOOL;
    signalinTimer : TON;
    runOnStart_Trig : R_TRIG;
  END_VAR

  timer(IN := di.Q AND StrDIp.isRunning  , PT := StrDIp.delay);
  SignalingTrig(CLK := timer.Q);
  IF SignalingTrig.Q THEN
  	SignalingDi := TRUE;
  END_IF;
  SignalingFTrig(CLK := timer.Q);
  IF SignalingFTrig.Q THEN
  	SignalingDi := FALSE;
  END_IF;

  StrDIp.Tag := StrDIp.inTag;
  StrDIp.RunOnStart := StrDIp.inRunOnStart;

  StrDIp.CanRun := StrDIp.inCanRun;

  StrDIp.OpcCommandsDisabled := StrDIp.inOpcCommandsDisabled;

  (* ---- Если управление с ВУ заблокировано, то передаем команду из алгоритма ---- *)
  IF StrDIp.inOpcCommandsDisabled THEN
  	StrDIp.inCommand := StrDIp.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	StrDIp.inCommand := StrDIp.inCommand_ARM;
  END_IF;

  _sunpackerCommand(command := StrDIp.inCommand);
  	source := _sunpackerCommand.source;
  	cmd := _sunpackerCommand.cmd;

  IF cmd <> 0 AND lastCmd <> cmd AND (((NOT StrDIp.opcCommandsDisabled) AND source > 0) OR source = 0) then

  	CASE BYTE_TO_INT(cmd) OF
  	        (*cmdRun*) 1: 	IF        NOT StrDIp.Remont THEN
  					StrDIp.isEnded := FALSE;
  					StrDIp.hasError 	:= FALSE;
  					StrDIp.isRunning := TRUE;
  					cmd_for_Status := cmd;
  					source_for_Status := source;
  					command_error_for_Status := 0;
  				ELSE
  					StrDIp.isRunning := FALSE;
  					StrDIp.isEnded := FALSE;
  					StrDIp.hasError 	:= FALSE;

  					cmd_for_Status := 0;
  					source_for_Status := source;
  					command_error_for_Status := cmd;
  				END_IF;
                                          StrDIp.inOpcCommandsDisabled:=FALSE;

                  (*cmdReset*) 2: 	StrDIp.isRunning := FALSE;
  				StrDIp.isEnded := FALSE;
  				StrDIp.hasError 	:= FALSE;
  				SignalingDi:= FALSE;
  				StrDIp.Check := FALSE;
  				cmd_for_Status := cmd;
  				source_for_Status := source;
  				command_error_for_Status := 0;
                                         StrDIp.inOpcCommandsDisabled:=FALSE;	

  	(*cmd_setRemont*) 4 :	StrDIp.Remont := TRUE;
  				(*StrDIp.isRunning := FALSE;*)

  				cmd_for_Status := cmd;
  				source_for_Status := source;
  				command_error_for_Status := 0;
          (*cmd_resetRemont*) 5 : 	(*IF di.Q THEN
  					cmd_for_Status := 0;
  					source_for_Status := 0;
  					command_error_for_Status := cmd;
  				ELSE*)
  					StrDIp.Remont := FALSE;
  					(*StrDIp.isRunning := TRUE;*)

  					cmd_for_Status := cmd;
  					source_for_Status := source;
  					command_error_for_Status := 0;
  				(*END_IF;*)
  	(*cmd_setCheck*) 6 : 	StrDIp.Check := TRUE;

  				cmd_for_Status := cmd;
  				source_for_Status := source;
  				command_error_for_Status := 0;
  	END_CASE;			
  	resetCmdTimer(IN := false);
  	resetCmdTimerPriznak := TRUE;
  END_IF;
  lastCmd := cmd;

  resetCmdTimer(IN := resetCmdTimerPriznak);
  IF resetCmdTimer.Q THEN
  	resetCmdTimerPriznak := FALSE;
  	source_for_Status := 0;
  	cmd_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF; 

  IF StrDIp.isRunning AND NOT StrDIp.Remont AND NOT StrDIp.Check THEN
  	StrDIp.Signaling := SignalingDi;
  	StrDIp.SignalingTP := _signalingTp.Q;
  ELSE
  	StrDIp.Signaling := 0;
  	StrDIp.SignalingTP := 0;
  END_IF;

  _signalingTp(in := StrDIp.Signaling, PT := T#1s);



  StrDIp.status :=  SHL(BYTE_TO_DWORD(source_for_Status), 29) 
  			OR SHL(BYTE_TO_DWORD(cmd_for_Status), 26) 
  			OR SHL(BYTE_TO_DWORD(command_error_for_Status), 23)
  			OR SHL(BOOL_TO_DWORD(StrDIp.OpcCommandsDisabled ), 21)
  			OR SHL(BOOL_TO_DWORD(StrDIp.Signaling), 16)
  			OR SHL(BOOL_TO_DWORD(StrDIp.RunOnStart ), 15)
  			OR SHL(BOOL_TO_DWORD(StrDIp.remont), 6)
  			OR SHL(BOOL_TO_DWORD(StrDIp.Check), 5)
  			OR SHL(BOOL_TO_DWORD(StrDIp.hasError), 4)
  			OR SHL(BOOL_TO_DWORD(StrDIp.SignalingTP), 3)
  			OR SHL(BOOL_TO_DWORD(StrDIp.CanRun), 2)
  			OR SHL(BOOL_TO_DWORD(StrDIp.isEnded), 1)
  			OR BOOL_TO_DWORD(StrDIp.isRunning);
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_Kran_Init
  VAR_INPUT
    data_Ini : BOOL;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inSo : BOOL;
    ISVALIDREF_inSz : BOOL;
    ISVALIDREF_inDp : BOOL    := False;
    continueHoldCommand : TIME;
  END_VAR
  VAR_IN_OUT
    str_Kr : struct_Kran;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  Kran          *****)

          Init := False;

      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_Kr.ISVALIDREF_statOn                := ISVALIDREF_statOn;
          str_Kr.ISVALIDREF_statOff               := ISVALIDREF_statOff;
          str_Kr.ISVALIDREF_cmdOn                 := ISVALIDREF_cmdOn;
          str_Kr.ISVALIDREF_cmdOff                := ISVALIDREF_cmdOff;
          str_Kr.ISVALIDREF_inSo                  := ISVALIDREF_inSo;
          str_Kr.ISVALIDREF_inSz                  := ISVALIDREF_inSz;     
          str_Kr.ISVALIDREF_inDp                  := ISVALIDREF_inDp;
          str_Kr.continueHoldCommand              := continueHoldCommand;     

          data_Ini:=False;
          Init := TRUE;
     END_IF; 
   IF Init THEN       
          ISVALIDREF_statOn:= false;
          ISVALIDREF_statOff:= false;
          ISVALIDREF_cmdOn:= false;
          ISVALIDREF_cmdOff:= false;
          ISVALIDREF_inSo:= false;
          ISVALIDREF_inSz:= false;     
          ISVALIDREF_inDp:= false;
          continueHoldCommand:= T#0S; 
    END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_OilPump_Init
  VAR_INPUT
    data_Ini : BOOL;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inBreakCmdOn : BOOL;
    ISVALIDREF_inBreakCmdOff : BOOL;
  END_VAR
  VAR_IN_OUT
    str_Op : struct_OilPump;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  НУ          *****)


   Init := FALSE;

      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_Op.ISVALIDREF_statOn                := ISVALIDREF_statOn;
          str_Op.ISVALIDREF_statOff               := ISVALIDREF_statOff;
          str_Op.ISVALIDREF_cmdOn                 := ISVALIDREF_cmdOn;
          str_Op.ISVALIDREF_cmdOff                := ISVALIDREF_cmdOff;
          str_Op.ISVALIDREF_inBreakCmdOn          := ISVALIDREF_inBreakCmdOn;
          str_Op.ISVALIDREF_inBreakCmdOff         := ISVALIDREF_inBreakCmdOff;      
          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;

          ISVALIDREF_statOn:= FALSE;
          ISVALIDREF_statOff:= FALSE;
          ISVALIDREF_cmdOn:= FALSE;
          ISVALIDREF_cmdOff:= FALSE;
          ISVALIDREF_inBreakCmdOn:= FALSE;
          ISVALIDREF_inBreakCmdOff:= FALSE;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_SectionSwitch_Init
  VAR_INPUT
    data_Ini : BOOL;
    ISVALIDREF_statOn : BOOL;
    ISVALIDREF_statOff : BOOL;
    ISVALIDREF_cmdOn : BOOL;
    ISVALIDREF_cmdOff : BOOL;
    ISVALIDREF_inBreakCmdOn : BOOL;
    ISVALIDREF_inBreakCmdOff : BOOL;
    ISVALIDREF_basketRolledIn : BOOL;
    ISVALIDREF_basketRolledOut : BOOL;
    ISVALIDREF_basketTest : BOOL;
  END_VAR
  VAR_IN_OUT
    str_Sw : struct_SectionSwitch;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  МВ          *****)

   Init := FALSE;

      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_Sw.ISVALIDREF_statOn                := ISVALIDREF_statOn;
          str_Sw.ISVALIDREF_statOff               := ISVALIDREF_statOff;
          str_Sw.ISVALIDREF_cmdOn                 := ISVALIDREF_cmdOn;
          str_Sw.ISVALIDREF_cmdOff                := ISVALIDREF_cmdOff;
          str_Sw.ISVALIDREF_inBreakCmdOn          := ISVALIDREF_inBreakCmdOn;
          str_Sw.ISVALIDREF_inBreakCmdOff         := ISVALIDREF_inBreakCmdOff;      
          str_Sw.ISVALIDREF_basketRolledIn        := ISVALIDREF_basketRolledIn;
          str_Sw.ISVALIDREF_basketRolledOut       := ISVALIDREF_basketRolledOut;   
          str_Sw.ISVALIDREF_basketTest            := ISVALIDREF_basketTest;
          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
  IF Init THEN 
          ISVALIDREF_statOn:= FALSE;
          ISVALIDREF_statOff:= FALSE;
          ISVALIDREF_cmdOn:= FALSE;
          ISVALIDREF_cmdOff:= FALSE;
          ISVALIDREF_inBreakCmdOn:= FALSE;
          ISVALIDREF_inBreakCmdOff:= FALSE;
          ISVALIDREF_basketRolledIn:= FALSE;
          ISVALIDREF_basketRolledOut:= FALSE;   
          ISVALIDREF_basketTest:= FALSE;
  END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_singleSignal_Init
  VAR_INPUT
    data_Ini : BOOL;
    inverse : BOOL;
    DelayOn : TIME;
    DelayOff : TIME;
  END_VAR
  VAR_IN_OUT
    str_SS : struct_singleSignal;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  singleSignal          *****)
  Init := FALSE;


      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_SS.inverse                := inverse;
          str_SS.DelayOn                := DelayOn;
          str_SS.DelayOff               := DelayOff;

          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
   IF Init THEN 
          inverse := FALSE;
          DelayOn := T#0S;
          DelayOff:= T#0S;
   END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_singleOutput_Init
  VAR_INPUT
    data_Ini : BOOL;
    inOpcCommandsDisabled : BOOL;
    wait_time : TIME;
  END_VAR
  VAR_IN_OUT
    str_SO : struct_singleOutput;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры  singleOutput          *****)

  Init := FALSE;

      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          str_SO.inOpcCommandsDisabled    := inOpcCommandsDisabled;
          str_SO.wait_time                := wait_time;

           data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
   IF Init THEN 
          inOpcCommandsDisabled := FALSE;
          wait_time := T#0S;
     END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK Proc_Im_Init
  VAR_INPUT
    init : BOOL;
  END_VAR
  VAR
    stKr_Ini : fb_Kran_Init;
    stSw_Ini : fb_Switch_Init;
    stOp_Ini : fb_OilPump_Init;
    stSSw_Ini : fb_SectionSwitch_Init;
    stSs_Ini : fb_singleSignal_Init;
    stSo_Ini : fb_singleOutput_Init;
    inits : UINT;
  END_VAR
  VAR_INPUT
    initiales : UINT;
  END_VAR
  VAR_EXTERNAL
    Im : ImConfig;
  END_VAR

  stKr_Ini(str_Kr := Im.Kran1,
  ISVALIDREF_inDp := TRUE,
  ISVALIDREF_inSo := TRUE,
  ISVALIDREF_inSz := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

  stKr_Ini(str_Kr := Im.Kran4,
  ISVALIDREF_inDp := TRUE,
  ISVALIDREF_inSo := TRUE,
  ISVALIDREF_inSz := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

  stKr_Ini(str_Kr := Im.Kran2,
  ISVALIDREF_inDp := TRUE,
  ISVALIDREF_inSo := TRUE,
  ISVALIDREF_inSz := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

  stKr_Ini(str_Kr := Im.Kran3,
  ISVALIDREF_inDp := TRUE,
  ISVALIDREF_inSo := TRUE,
  ISVALIDREF_inSz := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stKr_Ini.Init);

  stOp_Ini(str_Op := Im.Nu,
  ISVALIDREF_inBreakCmdOn := TRUE,
  ISVALIDREF_inBreakCmdOff := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stOp_Ini.Init);

  stOp_Ini(str_Op := Im.Nu2,
  ISVALIDREF_inBreakCmdOn := TRUE,
  ISVALIDREF_inBreakCmdOff := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stOp_Ini.Init);

  stSSw_Ini(str_Sw := Im.Mv,
  ISVALIDREF_inBreakCmdOn := TRUE,
  ISVALIDREF_inBreakCmdOff := TRUE,
  ISVALIDREF_basketRolledIn := TRUE,
  ISVALIDREF_basketRolledout := TRUE,
  ISVALIDREF_basketTest := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stSSw_Ini.Init);

  stSSw_Ini(str_Sw := Im.SectionSwitch1);
  inits := inits + BOOL_TO_UINT(stSSw_Ini.Init);

  stSw_Ini(str_Sw := Im.Avom1,
  ISVALIDREF_inBreakCmdOn := TRUE,
  ISVALIDREF_inBreakCmdOff := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

  stSw_Ini(str_Sw := Im.Avom2,
  ISVALIDREF_inBreakCmdOn := TRUE,
  ISVALIDREF_inBreakCmdOff := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

  stSw_Ini(str_Sw := Im.Avom3,
  ISVALIDREF_inBreakCmdOn := TRUE,
  ISVALIDREF_inBreakCmdOff := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

  stSw_Ini(str_Sw := Im.Avom4,
  ISVALIDREF_inBreakCmdOn := TRUE,
  ISVALIDREF_inBreakCmdOff := TRUE,
  ISVALIDREF_statOn := TRUE,
  ISVALIDREF_statOff := TRUE,
  ISVALIDREF_cmdOn := TRUE,
  ISVALIDREF_cmdOff := TRUE);
  inits := inits + BOOL_TO_UINT(stSw_Ini.Init);

  stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI0);
  inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

  stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI1);
  inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

  stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI2);
  inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

  stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI3);
  inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

  stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI4);
  inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

  stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI5);
  inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

  stSs_Ini(data_Ini := TRUE, inverse := FALSE, str_SS := Im.SingleSignals.SI6);
  inits := inits + BOOL_TO_UINT(stSs_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So0);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So1);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So2);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So3);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So4);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So5);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So6);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.So7);
  inits := inits + BOOL_TO_UINT(stSo_Ini.Init);

  initiales := 0;
  IF init THEN initiales := inits; END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_AI_Init
  VAR_INPUT
    data_Ini : BOOL;
    dLL : LREAL;
    dHL : LREAL;
    dLA : LREAL;
    dHA : LREAL;
    dLW : LREAL;
    dHW : LREAL;
    ISVALIDREF_LA : BOOL    := False;
    ISVALIDREF_HA : BOOL    := False;
    ISVALIDREF_LW : BOOL    := False;
    ISVALIDREF_HW : BOOL    := False;
    delayLA : TIME    := T#0S;
    delayLW : TIME    := T#0S;
    delayHW : TIME    := T#0S;
    delayHA : TIME    := T#0S;
    inpLL : LREAL    := 4000.0;
    inpHL : LREAL    := 20000.0;
    CurrentShotCircuit : LREAL    := 21000.0;
    CurrentBreakCircuit : LREAL    := 3700.0;
    maxChangeSpeed : LREAL;
    maxChangeSpeedDown : LREAL;
    histeresis : LREAL;
    aperturFilter : LREAL;
    exponentialFilter : LREAL;
    rassoglasovanie : LREAL;
    inOpcCommandsDisabled : BOOL;
  END_VAR
  VAR_IN_OUT
    strAI : struct_AI;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры-дескриптора канала аналогового ввода.            *****)
       Init := false;


      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          strAI.dLL                := dLL;
          strAI.dHL                := dHL;
          strAI.dLA                := dLA;
          strAI.dHA                := dHA;
          strAI.dLW                := dLW;
          strAI.dHW                := dHW;
          strAI.ISVALIDREF_LA      := ISVALIDREF_LA;
          strAI.ISVALIDREF_HA      := ISVALIDREF_HA;
          strAI.ISVALIDREF_LW      := ISVALIDREF_LW;
          strAI.ISVALIDREF_HW      := ISVALIDREF_HW;
          strAI.delayLA            := delayLA;
          strAI.delayLW            := delayLW;
          strAI.delayHW            := delayHW;
          strAI.delayHA            := delayHA;
          strAI.inpLL              := inpLL;
          strAI.inpHL              := inpHL;
          strAI.CurrentShotCircuit := CurrentShotCircuit;
          strAI.CurrentBreakCircuit:= CurrentBreakCircuit;
          strAI.maxChangeSpeed     := maxChangeSpeed;
          strAI.maxChangeSpeedDown := maxChangeSpeedDown;
          strAI.histeresis         := histeresis;
          strAI.aperturFilter      := aperturFilter;
          strAI.exponentialFilter  := exponentialFilter;
          strAI.rassoglasovanie    := rassoglasovanie;
          strAI.rassoglasovanie    := rassoglasovanie;

          data_Ini:=false;
          Init := TRUE;
       END_IF; 
    IF Init THEN     
          dLL:= 0.0;
          dHL:= 0.0;
          dLA:= 0.0;
          dHA:= 0.0;
          dLW:= 0.0;
          dHW:= 0.0;
          inpLL:= 4000.0;
          inpHL:= 20000.0;
          CurrentShotCircuit:= 21000.0;
          CurrentBreakCircuit:= 3700.0;
          ISVALIDREF_LA:= false;
          ISVALIDREF_HA:= false;
          ISVALIDREF_LW:= false;
          ISVALIDREF_HW:= false;
          delayLA:= T#0S;
          delayLW:= T#0S;
          delayHW:= T#0S;
          delayHA:= T#0S; 
          maxChangeSpeed:= 0.0;
          maxChangeSpeedDown:= 0.0;
          histeresis:= 0.0;
          aperturFilter:= 0.0;
          exponentialFilter:= 0.0;
          rassoglasovanie:= 0.0;
        END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK Proc_Ai_Init
  VAR_INPUT
    init : BOOL;
  END_VAR
  VAR
    stAI_Ini : fb_AI_Init;
    inits : UINT;
  END_VAR
  VAR_INPUT
    initiales : UINT;
  END_VAR
  VAR_EXTERNAL
    Ai : AiConfig;
  END_VAR

  inits := 0;

  stAI_Ini(data_Ini := TRUE, dLL := 0.0, dHL := 100.0,
  ISVALIDREF_LW := TRUE, dLW := 20.0,
  ISVALIDREF_HW := TRUE, dHW := 80.0,
  ISVALIDREF_LA := TRUE, dLA := 10.0,
  ISVALIDREF_HA := TRUE, dHA := 90.0,
  strAI := Ai.A1);
  inits := inits + BOOL_TO_UINT(stAI_Ini.Init);

  stAI_Ini(data_Ini := TRUE, dLL := 0.0, dHL := 100.0,
  ISVALIDREF_LW := TRUE, dLW := 20.0,
  ISVALIDREF_HW := TRUE, dHW := 80.0,
  ISVALIDREF_LA := TRUE, dLA := 10.0,
  ISVALIDREF_HA := TRUE, dHA := 90.0,
  strAI := Ai.A2);
  inits := inits + BOOL_TO_UINT(stAI_Ini.Init);


  initiales := 0;
  IF init THEN initiales := inits; END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_AiSourceMlp
  VAR_INPUT
    arAIN : TItemAIN;
    err_mod : TItemDIN;
  END_VAR
  VAR_IN_OUT
    strAI : struct_AI;
  END_VAR
  VAR
    _statusAi : TYPE_StatusAi;
    _commandAnalog : TYPE_CommandAnalog;
    _sunpackerCommand : fb_sunpackerCommand;
    _AnalogLimitFlags : TYPE_AnalogLimitFlags;
    notReliable : BOOL;
    _lastValue : LREAL;
    resetCmdTimer : TON;
    _LastValueTimer : TON;
    resetCmdTimerPriznak : BOOL;
    k : LREAL;
    b : LREAL;
    ap : LREAL;
    raznitsa : LREAL;
    rABS : LREAL;
    h : LREAL;
    mismatch : LREAL;
    parametr : BYTE;
    source : BYTE;
    cmd : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    onInit : BOOL;
    off_trig : R_TRIG;
    on_trig : R_TRIG;
    remont_trig : R_TRIG;
    LL_trig : R_TRIG;
    HL_trig : R_TRIG;
    Normal_trig : R_TRIG;
    Nedostover_trig : R_TRIG;
  END_VAR

  strAI.opcCommandsDisabled := strAI.inopcCommandsDisabled ;

  (* ---- При первом пуске принимаем значение уставок ---- *)
  IF NOT onInit THEN

            strAI.LL := strAI.dLL; 
            strAI.HL := strAI.dHL;


            IF strAI.ISVALIDREF_HA THEN strAI.HA := strAI.dHA; END_IF;

            IF strAI.ISVALIDREF_LA THEN strAI.LA := strAI.dLA; END_IF;

            IF strAI.ISVALIDREF_HW THEN strAI.HW := strAI.dHW; END_IF;

            IF strAI.ISVALIDREF_LW THEN strAI.LW := strAI.dLW; END_IF;	

  	onInit  := TRUE;
  END_IF;

  (* ---- пересчет тока в физ величину ---- *)
  k := (strAI.HL - strAI.LL)/(strAI.inpHl - strAI.inpLL);
  b := strAI.LL - k * strAI.inpLL;
  strAI.value := k * arAIN.dblValue + b;

  (* ---- определение обрыва и кз ----- *)

  strAI.blConnect :=(*(UINT_TO_WORD(arAIN.wFlags) = 1472) and*) (UINT_TO_WORD(err_mod.wValue) = 20) and (UINT_TO_WORD(err_mod.wFlags) = 192); 
  IF NOT strAI.blConnect THEN 
      strAI.interval := _statusAi.NOTDEFINED;
  ELSIF ((arAIN.dblValue < strAI.currentBreakCircuit) AND (strAI.currentBreakCircuit > 0.0)) OR ((strAI.interval = _statusAi.LL) AND (arAIN.dblValue < (strAI.currentBreakCircuit + 100.0))) THEN
      strAI.interval := _statusAi.LL;
  ELSIF ((arAIN.dblValue > strAI.currentShotCircuit) AND (strAI.currentShotCircuit > 0.0)) OR ((strAI.interval = _statusAi.HL) AND (arAIN.dblValue > (strAI.currentShotCircuit - 100.0))) THEN
      strAI.interval := _statusAi.HL;
  ELSE 
      strAI.interval := _statusAi.normal;
  END_IF;

  IF NOT strAI.imit THEN	
  	(* Расчет апертурного фильтра*)
  	ap := strAI.aperturFilter * 0.01 * (strAI.HL - strAI.LL);
  	IF strAI.aperturFilter <> 0.0 THEN raznitsa := strAI.value- _lastValue;
  		IF 	raznitsa < 0.0 	THEN 	rABS := -raznitsa; 		ELSE 	rABS := raznitsa; 		END_IF;
  		IF 	rABS > ap 	THEN 	strAI.value := strAI.value;	ELSE 	strAI.value := _lastValue; 	END_IF;
  	END_IF;

  	(* Расчет экпоненциального фильтра*)
  	IF strAI.exponentialFilter <> 0.0 THEN strAI.value := (strAI.exponentialFilter * strAI.value) + ((1.0 - strAI.exponentialFilter) * _lastValue); END_IF;
  ELSE
  	strAI.interval := _statusAi.normal;
  END_IF;

  IF notReliable THEN strAI.interval := _statusAi.NOTRELIABLE; END_IF;

  IF NOT notReliable THEN
  	IF strAI.interval >= _statusAi.normal THEN		
  		strAI.interval := _statusAi.NOTDEFINED;
  		h := strAI.histeresis* 0.01 * (strAI.HL-strAI.LL);
  		(*определение выхода за аппаратные границы вынесено в GetData.здесь только для нужд имитации*)
  		IF strAI.imit THEN
  			mismatch := strAI.rassoglasovanie * 0.01 * (strAI.HL - strAI.LL);	
  			IF ( strAI.value < strAI.LL - mismatch)   THEN strAI.interval := _statusAi.LL;
  			ELSIF  (strAI.value > strAI.Hl + mismatch) THEN strAI.interval := _statusAi.HL; END_IF;
  		ELSE
  			strAI.interval := _statusAi.normal;
  			IF strAI.ISVALIDREF_LA AND NOT strAI.Disabled_LA AND (strAI.interval = _statusAi.normal) THEN
  				IF (strAI.value  < strAI.LA) OR ((strAI.interval = _statusAi.LA)  AND ((strAI.value - h) < strAI.LA))  THEN 
  					strAI.interval := _statusAi.LA;
  				END_IF;
  			END_IF;
  			IF strAI.ISVALIDREF_HA  AND NOT strAI.Disabled_HA AND (strAI.interval = _statusAi.normal)  THEN
  				IF (strAI.value > strAI.HA) OR ((strAI.interval = _statusAi.HA)  AND ((strAI.value + h) > strAI.HA))  THEN 
  					strAI.interval := _statusAi.HA;
  				END_IF;
  			END_IF;
  			IF strAI.ISVALIDREF_LW AND NOT strAI.Disabled_LW AND (strAI.interval = _statusAi.normal)  THEN
  				IF (strAI.value < strAI.LW) OR ((strAI.interval = _statusAi.LW)  AND ((strAI.value - h) < strAI.LW)) THEN 
  					strAI.interval := _statusAi.LW;
  				END_IF;
  			END_IF;
  			IF strAI.ISVALIDREF_HW AND NOT strAI.Disabled_HW  AND (strAI.interval = _statusAi.normal) THEN
  				IF (strAI.value > strAI.HW)  OR ((strAI.interval = _statusAi.HW)  AND ((strAI.value + h) > strAI.HW))   THEN 
  					strAI.interval := _statusAi.HW;
  				END_IF;
  			END_IF;	
  		END_IF;
  	END_IF;
  ELSE
  	strAI.interval := _statusAi.NOTRELIABLE;
  END_IF;

  IF strAI.remont THEN strAI.interval := _statusAi.NOTDEFINED; END_IF;

  (* ---- Если управление с ВУ заблокировано, то  передаем команду из алгоритма ---- *)
  IF strAI.inOpcCommandsDisabled THEN
  	strAI.inCommand := strAI.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	strAI.inCommand := strAI.inCommand_ARM;
  END_IF;

  _sunpackerCommand(command := strAI.inCommand);
  	source := _sunpackerCommand.source;
  	parametr := _sunpackerCommand.parametr;
  	cmd := _sunpackerCommand.cmd;

  IF cmd <> 0 AND lastCmd <> cmd and (((NOT strAI.opcCommandsDisabled) AND source > 0) OR source = 0) then
  	CASE BYTE_TO_INT(cmd) OF
  	(*cmd_SetUstavki*) 1 : 
  				IF ((parametr AND _AnalogLimitFlags.LL) <> 0)		             	THEN 	strAI.LL := strAI.dLL; END_IF;
  				IF ((parametr AND _AnalogLimitFlags.HL) <> 0)		 	          THEN	strAI.HL := strAI.dHL; END_IF;
  				IF ((parametr AND _AnalogLimitFlags.LA) <> 0) AND strAI.ISVALIDREF_LA 	THEN	strAI.LA := strAI.dLA; END_IF;
  				IF ((parametr AND _AnalogLimitFlags.HA) <> 0) AND strAI.ISVALIDREF_HA 	THEN	strAI.HA := strAI.dHA; END_IF;
  				IF ((parametr AND _AnalogLimitFlags.LW) <> 0) AND strAI.ISVALIDREF_LW 	THEN	strAI.LW := strAI.dLW; END_IF;
  				IF ((parametr AND _AnalogLimitFlags.HW) <> 0) AND strAI.ISVALIDREF_HW 	THEN	strAI.HW := strAI.dHW; END_IF;
  	(*cmd_SetRemont*) 6 : 
  				strAI.remont := TRUE;
  	(*cmd_ResetRemont*) 7 : 
  				strAI.remont := FALSE;
  	(*cmd_kvitNotReliable*) 4 : 
  				notReliable := FALSE;
  	END_CASE;
  	source_for_Status := source;
  	cmd_for_Status := cmd;
  	command_error_for_Status := 0;
  	resetCmdTimer(IN := FALSE);
  	resetCmdTimerPriznak := TRUE;
  END_IF;
  lastCmd := cmd;

  resetCmdTimer(IN := resetCmdTimerPriznak, PT := T#5S);
  IF resetCmdTimer.Q THEN
  	resetCmdTimerPriznak := FALSE;
  	source_for_Status := 0;
  	cmd_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF;

  strAI.NS_Min := (strAI.value < strAI.minValue) AND strAI.minValue_ISVALIDREF;
  strAI.NS_Max := (strAI.value > strAI.maxValue) AND strAI.maxValue_ISVALIDREF;

  strAI.NS := (strAI.interval <= _statusAi.normal) AND NOT strAI.remont;

  Normal_trig(CLK := strAI.interval >= _statusAi.normal);

  IF NOT Normal_trig.Q THEN
  	_LastValueTimer(PT := T#1S);
  	IF (strAI.value<>_lastValue) OR _LastValueTimer.Q THEN
  		IF (_LastValueTimer.ET>T#0MS) THEN
  			strAI.ChangeSpeed:=(strAI.value-_lastValue)/(TIME_TO_LREAL(_LastValueTimer.ET));
  		END_IF;
  		_LastValueTimer(IN:=FALSE);

  		_LastValueTimer(IN:=TRUE);
  	END_IF;
  END_IF;
  _lastValue := strAI.value;

  IF ((strAI.maxChangeSpeed<>0.0) OR  (strAI.maxChangeSpeedDown<>0.0)) AND ( strAI.interval>=_statusAi.normal) THEN	
  		IF (strAI.ChangeSpeed>0.0) THEN
  		    IF (strAI.ChangeSpeed > strAI.maxChangeSpeed) AND (strAI.maxChangeSpeed>0.0000001) THEN
  			 notReliable:=TRUE;
  		    END_IF;
  		ELSE
  		    IF (ABS(strAI.ChangeSpeed)>strAI.maxChangeSpeedDown) AND (strAI.maxChangeSpeedDown>0.0000001)  THEN
                                 notReliable:=TRUE; 
  		    END_IF;
  		END_IF;

  END_IF;

  strAI.status := SHL(BYTE_TO_DWORD(source_for_Status), 29) 		              (* Источник команды *)
  			OR SHL(BYTE_TO_DWORD(cmd_for_Status), 26) 	    (* Команда *)
  			OR SHL(BYTE_TO_DWORD(command_error_for_Status), 23)   (* Ошибка команды *)
  			OR SHL(BOOL_TO_DWORD(strAI.OpcCommandsDisabled ), 21) (* Управление в ВУ заблокировано *)
  			OR SHL(BOOL_TO_DWORD(strAI.Disabled_HA), 9)		    (* ВА исключена из формирования интервала *)
  			OR SHL(BOOL_TO_DWORD(strAI.Disabled_LA), 8)		    (* НА исключена из формирования интервала *)
  			OR SHL(BOOL_TO_DWORD(strAI.Disabled_HW), 7)		    (* ВП исключена из формирования интервала *)
  			OR SHL(BOOL_TO_DWORD(strAI.Disabled_LW), 6)	              (* НП исключена из формирования интервала *)
  			OR SHL(BOOL_TO_DWORD(strAI.NS), 5)			    (* неиспарвность сигнала *)
  			OR SHL(BOOL_TO_DWORD(strAI.remont), 4)	              (* Выведен в ремонт *)
  			OR BYTE_TO_DWORD(strAI.interval);	              (* интервал *)
END_FUNCTION_BLOCK

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
    arERR_0 : TItemDIN;
  END_VAR

  fb_A1(arAIN := arAIN_0, strAI := Ai.A1, err_mod := arERR_0);
  AI_0_dblValue := arAIN_0.dblValue;

  fb_A2(arAIN := arAIN_1, strAI := Ai.A2, err_mod := arERR_0);
  AI_1_dblValue := arAIN_1.dblValue;
END_FUNCTION_BLOCK

FUNCTION_BLOCK Opc_Ai_init
  VAR_EXTERNAL
    Ai : AiConfig;
    AI_A1_HW : LREAL;
    AI_A1_newHW : LREAL;
    AI_A1_HA : LREAL;
    AI_A1_newHA : LREAL;
    AI_A1_LA : LREAL;
    AI_A1_newLA : LREAL;
    AI_A1_LW : LREAL;
    AI_A1_newLW : LREAL;
    AI_A1_HL : LREAL;
    AI_A1_newHL : LREAL;
    AI_A1_LL : LREAL;
    AI_A1_newLL : LREAL;
    AI_A2_HW : LREAL;
    AI_A2_newHW : LREAL;
    AI_A2_HA : LREAL;
    AI_A2_newHA : LREAL;
    AI_A2_LA : LREAL;
    AI_A2_newLA : LREAL;
    AI_A2_LW : LREAL;
    AI_A2_newLW : LREAL;
    AI_A2_HL : LREAL;
    AI_A2_newHL : LREAL;
    AI_A2_LL : LREAL;
    AI_A2_newLL : LREAL;
  END_VAR

  AI_A1_HW := Ai.A1.HW;
  AI_A1_newHW := Ai.A1.dHW;
  AI_A1_HA := Ai.A1.HA;
  AI_A1_newHA := Ai.A1.dHA;
  AI_A1_LA := Ai.A1.LA;
  AI_A1_newLA := Ai.A1.dLA;
  AI_A1_LW := Ai.A1.LW;
  AI_A1_newLW := Ai.A1.dLW;
  AI_A1_LL := Ai.A1.LL;
  AI_A1_newLL := Ai.A1.dLL;
  AI_A1_HL := Ai.A1.HL;
  AI_A1_newHL := Ai.A1.dHL;

  AI_A2_HW := Ai.A2.HW;
  AI_A2_newHW := Ai.A2.dHW;
  AI_A2_HA := Ai.A2.HA;
  AI_A2_newHA := Ai.A2.dHA;
  AI_A2_LA := Ai.A2.LA;
  AI_A2_newLA := Ai.A2.dLA;
  AI_A2_LW := Ai.A2.LW;
  AI_A2_newLW := Ai.A2.dLW;
  AI_A2_LL := Ai.A2.LL;
  AI_A2_newLL := Ai.A2.dLL;
  AI_A2_HL := Ai.A2.HL;
  AI_A2_newHL := Ai.A2.dHL;
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_DO_Init
  VAR_INPUT
    data_Ini : BOOL;
    imit : BOOL    := FALSE;
  END_VAR
  VAR_IN_OUT
    strDO : struct_DO;
  END_VAR
  VAR_OUTPUT
    Init : BOOL    := FALSE;
  END_VAR

  (*****            Функциональный блок переинициализации структуры-дескриптора канала дискретного ввода.            *****)
   Init := FALSE;


      IF data_Ini THEN                            (* Параметрам требуется переинициализация. *)
          strDO.imit       := imit;
          data_Ini:=FALSE;
          Init := TRUE;
      END_IF;
    IF Init THEN  
  imit:=FALSE;
     END_IF;
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_Kran
  VAR_INPUT
    statOn : BOOL;
    statOff : BOOL;
    statOn_reliability : BOOL;
    statOff_reliability : BOOL;
  END_VAR
  VAR_IN_OUT
    strKr : struct_Kran;
  END_VAR
  VAR_INPUT
    inNs : TYPE_ReliableBit;
    inAccident : TYPE_ReliableBit;
    inAuto : TYPE_ReliableBit;
    inManual : TYPE_ReliableBit;
    inLocal : TYPE_ReliableBit;
    inDistance : TYPE_ReliableBit;
    inErrorPowerOff : TYPE_ReliableBit;
    inErrorBlock : TYPE_ReliableBit;
    inSo : TYPE_ReliableBit;
    inSz : TYPE_ReliableBit;
    inDp : TYPE_ReliableBit;
  END_VAR
  VAR
    onInit : BOOL    := FALSE;
    _statOn : BOOL;
    _statOff : BOOL;
    getSdvig : BOOL;
    lastOnStatus : BYTE;
    cmd : BYTE;
    source : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    _sunpackerCommand : fb_sunpackerCommand;
    _statusDualInput : TYPE_statusDualInput;
    _commandDualInput : TYPE_commandDualInput;
    _commandErrorTimer : BOOL;
    resetErrorTimer : BOOL;
    _changWithoutCommand : BOOL;
    BlockedOpenControl : BOOL;
    errorCMDTimer : TON;
    _errorReset : TON;
    sdvigReset : TON;
    continueHoldCommandTimer : TON;
    outputsSets : TOF;
    dP_Trig : R_TRIG;
    dP_Trig_reliability : R_TRIG;
    resetBlockedOpenControl_Trig : R_TRIG;
  END_VAR
  VAR_IN_OUT
    cmdOn : BOOL;
    cmdOff : BOOL;
  END_VAR

  IF NOT onInit THEN
  IF strKr.ISVALIDREF_cmdOn XOR strKr.ISVALIDREF_cmdOff THEN
  	IF 	strKr.ISVALIDREF_cmdOn THEN
  		lastCmd:= 2; (*baseCmdOff*) 
  	ELSE
  		lastCmd:= 1; (*baseCmdOn*) 
  	END_IF;
  END_IF;
  onInit:=TRUE;
  END_IF;

  (* ---- Если управление с ВУ заблокировано, то в ИМ передаем команду из алгоритма ---- *)
  IF strKr.inOpcCommandsDisabled THEN
  	strKr.inCommand := strKr.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	strKr.inCommand := strKr.inCommand_ARM;
  END_IF;

  (* ---- Формирование состояния механизма ---- *)

  IF (strKr.ISVALIDREF_statOn) OR (strKr.ISVALIDREF_statOff) THEN
  	IF (strKr.ISVALIDREF_statOn) AND (strKr.ISVALIDREF_statOff) THEN
  	strKr.reliability:= statOn_reliability AND statOff_reliability;
  		_statOn  := statOn;
  		_statOff := statOff;
  	ELSIF (strKr.ISVALIDREF_statOn) THEN
                       strKr.reliability:= statOn_reliability;	
  		_statOn  := statOn;
  		_statOff := NOT statOn; 
  	ELSIF (strKr.ISVALIDREF_statOff) THEN
  		 strKr.reliability:= statOff_reliability;	
  		_statOn  := NOT statOff;
  		_statOff :=statOff; 
  	END_IF;

  	IF strKr.reliability THEN 
  		IF _statOn AND NOT _statOff 		THEN 	strKr.onStatus := _statusDualInput.STATUS_ON;
  		ELSIF _statOff AND NOT _statOn 	THEN 	strKr.onStatus := _statusDualInput.Status_OFF;
  		ELSIF NOT _statOn AND NOT _statOff 	THEN 	strKr.onStatus := _statusDualInput.STATUS_TRANSITIONAL;
  		ELSE					strKr.onStatus := _statusDualInput.STATUS_ERROR;
                      END_IF;

  	ELSE
  		strKr.onStatus := _statusDualInput.STATUS_NOTDEFINED; 

  	END_IF;
  ELSE
  	CASE BYTE_TO_INT(lastCmd) OF	
  		(*baseCmdOn*)  1: strKr.onStatus  := _statusDualInput.STATUS_ON; 
  		(*baseCmdOff*) 2: strKr.onStatus  := _statusDualInput.STATUS_OFF;

  	ELSE
  		 strKr.onStatus := _statusDualInput.STATUS_NOTDEFINED;

  	END_CASE;
  END_IF;


  strKr.Accident := inAccident.value AND inAccident.reliability;
  strKr.Ns := inNs.value AND inNs.reliability;
  strKr.Auto := inAuto.value AND inAuto.reliability;
  strKr.Manual := inManual.value AND inManual.reliability;
  strKr.Local := inLocal.value AND inLocal.reliability;
  strKr.Distance := inDistance.value AND inDistance.reliability;
  strKr.ErrorPowerOff := inErrorPowerOff.value AND inErrorPowerOff.reliability;
  strKr.ErrorBlock := inErrorBlock.value AND inErrorBlock.reliability;
  strKr.OpcCommandsDisabled := strKr.inOpcCommandsDisabled;

  (* ---- Формирование признака блокировки Открытия крана по высокому давлению ---- *)
  	IF strKr.ISVALIDREF_inDp THEN

  		strKr.Dp := NOT inDp.value AND inDp.reliability;

  		dP_Trig(CLK := strKr.Dp );
  		dP_Trig_reliability(CLK :=NOT inDp.reliability);

  		IF dP_Trig.Q OR dP_Trig_reliability.Q THEN  
  			BlockedOpenControl := TRUE; 
  		END_IF;
  		(* ---- автоматический сброс *)
  		resetBlockedOpenControl_Trig(CLK := (inDp.value) AND inDp.reliability);
  		IF resetBlockedOpenControl_Trig.Q THEN 
  			BlockedOpenControl := FALSE;
  		END_IF;
  	ELSE
  		strKr.Dp  := FALSE;
  		BlockedOpenControl := FALSE;
  	END_IF;

  (* ---- Формирование признака сдвига ---- *)	
  getSdvig := FALSE;
  IF (strKr.ISVALIDREF_cmdOn OR strKr.ISVALIDREF_cmdOff) AND NOT strKr.Local THEN
  	IF NOT (strKr.CmdOn OR strKr.CmdOff) THEN
  		IF (lastOnStatus <> strKr.onStatus AND 
  		(strKr.onStatus <> _statusDualInput.STATUS_NOTDEFINED AND strKr.onStatus <> _statusDualInput.STATUS_ERROR) AND
  		(lastOnStatus <> _statusDualInput.STATUS_NOTDEFINED AND lastOnStatus <> _statusDualInput.STATUS_ERROR)) THEN
  			strKr.sdvig   := TRUE;
  		END_IF;
  	END_IF;
  END_IF;

  IF getSdvig THEN strKr.sdvig:= TRUE; END_IF;

  sdvigReset(IN:=strKr.sdvig, PT:=T#15S);

  IF sdvigReset.Q THEN strKr.sdvig:=FALSE; END_IF;

  lastOnStatus := strKr.onStatus;

  (* ---- Распаковка команды ---- *)
  _sunpackerCommand(command := strKr.inCommand);
  	cmd := _sunpackerCommand.cmd;
  	source := _sunpackerCommand.source;

  (* ---- Обработка команды ---- *)
  IF cmd <> 0 AND lastCmd <> cmd and (((NOT strKr.opcCommandsDisabled) AND source > 0) OR source = 0) then
  	CASE BYTE_TO_INT(cmd) OF
  	(*cmd_open*) 1 : 
  			IF NOT BlockedOpenControl THEN
                                IF  strKr.ISVALIDREF_cmdOn THEN strKr.CmdOn := TRUE;
  				IF strKr.ISVALIDREF_cmdOff THEN strKr.CmdOff := FALSE; END_IF;
  			ELSIF  strKr.ISVALIDREF_cmdOff THEN strKr.CmdOff := FALSE;  END_IF;
  			errorCMDTimer(IN := false);

  			_commandErrorTimer := true;
  			strKr.lastCmdIsOn := true;
                                END_IF;
  	(*cmd_close*) 2 : 
  			IF strKr.ISVALIDREF_cmdOff THEN strKr.CmdOff := TRUE;
  				IF strKr.ISVALIDREF_cmdOn THEN strKr.CmdOn := FALSE; END_IF;
  			ELSIF strKr.ISVALIDREF_cmdOn THEN strKr.CmdOn := FALSE; END_IF;
  			errorCMDTimer(IN := false);

  			_commandErrorTimer := true;
  			strKr.lastCmdIsOn := false;
  	(*cmd_reset*) 3 :   IF (strKr.ISVALIDREF_statOn) OR (strKr.ISVALIDREF_statOff) THEN
  			strKr.CmdOn := FALSE;
  			strKr.CmdOff := FALSE;
                                lastCmd := 0;
  			_commandErrorTimer := false;
  			strKr.lastCmdIsOn := false;
                                END_IF;

  	END_CASE;	
  	source_for_Status := source;
  	cmd_for_Status := cmd;
  	command_error_for_Status := 0;
  END_IF;
  lastCmd := cmd;

  errorCMDTimer(In := _commandErrorTimer, PT :=T#90s);


  continueHoldCommandTimer(IN:=(strKr.onStatus = _statusDualInput.STATUS_ON) OR
  (strKr.onStatus = _statusDualInput.STATUS_OFF), PT:=strKr.continueHoldCommand);


  (* ---- алгоритм  для команды ВКЛючить ---- *)
  IF (strKr.onStatus = _statusDualInput.STATUS_ON) and strKr.lastCmdIsOn  then
  	IF strKr.ISVALIDREF_cmdOn AND strKr.ISVALIDREF_cmdOff then  
            IF continueHoldCommandTimer.Q THEN 
            strKr.cmdOn := false; END_IF;
            END_IF;
  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- off ---- *)
  IF (strKr.onStatus = _statusDualInput.STATUS_OFF) and  (NOT strKr.lastCmdIsOn) then
  	IF strKr.ISVALIDREF_cmdOn AND strKr.ISVALIDREF_cmdOff then
            IF continueHoldCommandTimer.Q THEN
            strKr.cmdOff := false; END_IF;
            END_IF;
  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- ошибка исполнения команды ---- *)
  if errorCMDTimer.Q and (cmd_for_Status <> 0) then
  	command_error_for_Status :=  cmd_for_Status;
  	_commandErrorTimer := false;
  	strKr.CmdOn := false;
  	strKr.CmdOff := false;
  	(*lastCmd := 0;*)
  END_IF;

  (* ---- сброс ошибки команды ---- *)
  strKr.CommandFault := command_error_for_Status <> 0;
  _errorReset(IN := command_error_for_Status <> 0, PT := T#5S);
  IF _errorReset.Q THEN
  	cmd_for_Status := 0;
  	source_for_Status := 0;
  	command_error_for_Status := 0;

  END_IF;

  outputsSets(in := (strKr.ISVALIDREF_cmdOn and strKr.cmdOn ) OR (strKr.ISVALIDREF_cmdOff and strKr.cmdOff), PT := T#2S);
  	IF NOT outputsSets.Q THEN
  		strKr.So := inSo._inversed AND inSo.reliability AND strKr.ISVALIDREF_inSo;
  		strKr.Sz := inSz._inversed AND inSz.reliability AND strKr.ISVALIDREF_inSz;
  	END_IF;

  cmdOn := strKr.cmdOn;
  cmdOff:= strKr.cmdOff;       

  (* ---- формирование зашифрованного статуса для АРМа ---- *)
  strKr.status := shl(BYTE_TO_DWORD(source_for_Status), 29) 
  		OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
  		OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
  		OR shl(bool_to_DWORD(strKr.sdvig), 22)
  		OR shl(bool_to_DWORD(strKr.OpcCommandsDisabled), 21)
                      OR shl(bool_to_DWORD(strKr.Dp), 14) 
                      OR shl(BOOL_TO_DWORD(strKr.Sz), 13) 
  		OR shl(BOOL_TO_DWORD(strKr.So), 12)
  		OR shl(BOOL_TO_DWORD(strKr.ErrorBlock), 11) 
  		OR shl(BOOL_TO_DWORD(strKr.ErrorPowerOff), 10) 
  		OR shl(BOOL_TO_DWORD(strKr.Manual), 8) 
  		OR shl(BOOL_TO_DWORD(strKr.Auto), 7) 
  		OR shl(BOOL_TO_DWORD(strKr.Distance), 6) 
  		OR shl(BOOL_TO_DWORD(strKr.Local), 5) 
  		OR shl(BOOL_TO_DWORD(strKr.Ns), 4) 
                  	OR shl(BOOL_TO_DWORD(strKr.Accident ),3)
  		OR BYTE_TO_DWORD(strKr.onStatus);
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_OilPump
  VAR_INPUT
    statOn : BOOL;
    statOff : BOOL;
    statOn_reliability : BOOL;
    statOff_reliability : BOOL;
  END_VAR
  VAR_IN_OUT
    StrSw : struct_OilPump;
  END_VAR
  VAR_INPUT
    inNs : TYPE_ReliableBit;
    inAccident : TYPE_ReliableBit;
    inLocal : TYPE_ReliableBit;
    inDistance : TYPE_ReliableBit;
    inBreakCmdOn : TYPE_ReliableBit;
    inBreakCmdOff : TYPE_ReliableBit;
  END_VAR
  VAR
    onInit : BOOL    := FALSE;
    _statOn : BOOL;
    _statOff : BOOL;
    getSdvig : BOOL;
    lastOnStatus : BYTE;
    cmd : BYTE;
    source : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    _sunpackerCommand : fb_sunpackerCommand;
    _statusDualInput : TYPE_statusDualInput;
    _commandDualInput : TYPE_commandDualInput;
    _commandErrorTimer : BOOL;
    resetErrorTimer : BOOL;
    _changWithoutCommand : BOOL;
    errorCMDTimer : TON;
    sdvigReset : TON;
    _errorReset : TON;
    outputsSets : TOF;
  END_VAR
  VAR_IN_OUT
    cmdOn : BOOL;
    cmdOff : BOOL;
  END_VAR

  IF NOT onInit THEN
  IF StrSw.ISVALIDREF_cmdOn XOR StrSw.ISVALIDREF_cmdOff THEN
  	IF 	StrSw.ISVALIDREF_cmdOn THEN
  		lastCmd:= 2; (*baseCmdOff*) 
  	ELSE
  		lastCmd:= 1; (*baseCmdOn*) 
  	END_IF;
  END_IF;
  onInit:=TRUE;
  END_IF;

  (* ---- Если управление с ВУ заблокировано, то в ИМ передаем команду из алгоритма ---- *)
  IF StrSw.inOpcCommandsDisabled THEN
  	StrSw.inCommand := StrSw.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	StrSw.inCommand := StrSw.inCommand_ARM;
  END_IF;

  (* ---- Формирование состояния механизма ---- *)

  IF (StrSw.ISVALIDREF_statOn) OR (StrSw.ISVALIDREF_statOff) THEN
  	IF (StrSw.ISVALIDREF_statOn) AND (StrSw.ISVALIDREF_statOff) THEN
  	StrSw.reliability:= statOn_reliability AND statOff_reliability;
  		_statOn  := statOn;
  		_statOff := statOff;
  	ELSIF (StrSw.ISVALIDREF_statOn) THEN
                       StrSw.reliability:= statOn_reliability;	
  		_statOn  := statOn;
  		_statOff := NOT statOn; 
  	ELSIF (StrSw.ISVALIDREF_statOff) THEN
  		 StrSw.reliability:= statOff_reliability;	
  		_statOn  := NOT statOff;
  		_statOff :=statOff; 
  	END_IF;

  	IF StrSw.reliability THEN
  		IF _statOn AND NOT _statOff 		THEN 	StrSw.onStatus := _statusDualInput.STATUS_ON;
  		ELSIF _statOff AND NOT _statOn 	THEN 	StrSw.onStatus := _statusDualInput.Status_OFF;
  		ELSIF NOT _statOn AND NOT _statOff 	THEN 	StrSw.onStatus := _statusDualInput.STATUS_TRANSITIONAL;
  		ELSE					StrSw.onStatus := _statusDualInput.STATUS_ERROR;
                      END_IF;

  	ELSE
  		StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;

  	END_IF;
  ELSE
  	CASE BYTE_TO_INT(lastCmd) OF	
  		(*baseCmdOn*) 1: StrSw.onStatus  := _statusDualInput.STATUS_ON; 
  		(*baseCmdOff*) 2: StrSw.onStatus  := _statusDualInput.STATUS_OFF;

  	ELSE
  		 StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;

  	END_CASE;
  END_IF;


  StrSw.Accident := inAccident.value AND inAccident.reliability;
  StrSw.Ns := inNs.value AND inNs.reliability;
  StrSw.Local := inLocal.value AND inLocal.reliability;
  StrSw.Distance := inDistance.value AND inDistance.reliability;
  StrSw.OpcCommandsDisabled := StrSw.inOpcCommandsDisabled;

  StrSw.Blocked:=StrSw.Accident OR StrSw.Local OR StrSw.breakCmdOn OR StrSw.breakCmdOff OR StrSw.inBlocked;

  StrSw.Rezervny:=NOT StrSw.Osnovnoy;

  (* ---- Формирование признака сдвига ---- *)

  getSdvig := FALSE;
  IF (StrSw.ISVALIDREF_cmdOn OR StrSw.ISVALIDREF_cmdOff) AND NOT StrSw.Local THEN
  	IF NOT (StrSw.CmdOn OR StrSw.CmdOff) THEN
                       IF (lastOnStatus <> StrSw.onStatus AND 
  		(StrSw.onStatus <> _statusDualInput.STATUS_NOTDEFINED AND
                       StrSw.onStatus <> _statusDualInput.STATUS_ERROR)     AND
  		(lastOnStatus <> _statusDualInput.STATUS_NOTDEFINED   AND
                       lastOnStatus <> _statusDualInput.STATUS_ERROR))      
                      THEN
  			getSdvig   := TRUE;
  		END_IF;
  	END_IF;
  END_IF;

  IF getSdvig THEN StrSw.sdvig:= TRUE; END_IF;

  sdvigReset(IN:=StrSw.sdvig, PT:=T#15S);

  IF sdvigReset.Q THEN StrSw.sdvig:=FALSE; END_IF;

  lastOnStatus := StrSw.onStatus;

  (* ---- Распаковка команды ---- *)
  _sunpackerCommand(command := StrSw.inCommand);
  	cmd := _sunpackerCommand.cmd;
  	source := _sunpackerCommand.source;

  (* ---- Обработка команды ---- *)
  IF cmd <> 0 AND lastCmd <> cmd and (((NOT StrSw.opcCommandsDisabled) AND source > 0) OR source = 0) then
  	CASE BYTE_TO_INT(cmd) OF
  	(*cmd_on*) 1 : 
  			IF  StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := TRUE;
  				IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE; END_IF;
  			ELSIF  StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE;  END_IF;
  			errorCMDTimer(IN := false);
  			_commandErrorTimer := true;
  			StrSw.lastCmdIsOn := true;
  	(*cmd_off*) 2 : 
  			IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := TRUE;
  				IF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
  			ELSIF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
  			errorCMDTimer(IN := false);

  			_commandErrorTimer := true;
  			StrSw.lastCmdIsOn := false;
  	(*cmd_reset*) 3 :    IF StrSw.ISVALIDREF_statOn OR StrSw.ISVALIDREF_statOff THEN
  			StrSw.CmdOn := FALSE;
  			StrSw.CmdOff := FALSE;
                                lastCmd := 0;
  			_commandErrorTimer := false;
  			StrSw.lastCmdIsOn := false;
                                 END_IF;
  	END_CASE;	
  	source_for_Status := source;
  	cmd_for_Status := cmd;
  	command_error_for_Status := 0;
  END_IF;

  lastCmd := cmd;
  errorCMDTimer(In := _commandErrorTimer, PT :=T#10s);

  (* ---- алгоритм  для команды ВКЛючить ---- *)
  IF (StrSw.onStatus = _statusDualInput.STATUS_ON) and StrSw.lastCmdIsOn then
  	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOn := false; END_IF;

  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- off ---- *)
  IF (StrSw.onStatus = _statusDualInput.STATUS_OFF) and (NOT StrSw.lastCmdIsOn) then
  	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOff := false; END_IF;

  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- ошибка исполнения команды ---- *)
  if errorCMDTimer.Q and (cmd_for_Status <> 0) then
  	command_error_for_Status :=  cmd_for_Status;
  	_commandErrorTimer := false;
  	StrSw.CmdOn := false;
  	StrSw.CmdOff := false;
  	lastCmd := 0;
  end_if;

  (* ---- сброс ошибки команды ---- *)
  StrSw.CommandFault := command_error_for_Status <> 0;
  _errorReset(IN := command_error_for_Status <> 0, PT := T#5S);
  IF _errorReset.Q THEN
  	cmd_for_Status := 0;
  	source_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF;

  outputsSets(in := (StrSw.ISVALIDREF_cmdOn and StrSw.cmdOn ) OR (StrSw.ISVALIDREF_cmdOff and StrSw.cmdOff), PT := T#2S);
  	IF NOT outputsSets.Q THEN
  		StrSw.BreakCmdOn := inBreakCmdOn._inversed AND inBreakCmdOn.reliability AND StrSw.ISVALIDREF_inBreakCmdOn;
  		StrSw.BreakCmdOff := inBreakCmdOff._inversed AND inBreakCmdOff.reliability AND StrSw.ISVALIDREF_inBreakCmdOff;
  	END_IF;

  cmdOn := StrSw.cmdOn;
  cmdOff:= StrSw.cmdOff;           

  (* ---- формирование зашифрованного статуса для АРМа ---- *)
  StrSw.status := shl(BYTE_TO_DWORD(source_for_Status), 29) 
  		OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
  		OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
  		OR shl(bool_to_DWORD(StrSw.sdvig), 22)
  		OR shl(bool_to_DWORD(StrSw.OpcCommandsDisabled), 21)
                      OR shl(bool_to_DWORD(StrSw.lastCmdIsOn), 14)
                      OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOff), 13) 
  		OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOn), 12)
  		OR shl(BOOL_TO_DWORD(StrSw.Distance), 6) 
  		OR shl(BOOL_TO_DWORD(StrSw.Local), 5) 
  		OR shl(BOOL_TO_DWORD(StrSw.Ns), 4) 
                  	OR shl(BOOL_TO_DWORD(StrSw.Accident ),3)
  		OR BYTE_TO_DWORD(StrSw.onStatus);
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_SectionSwitch
  VAR_INPUT
    statOn : BOOL;
    statOff : BOOL;
    statOn_reliability : BOOL;
    statOff_reliability : BOOL;
  END_VAR
  VAR_IN_OUT
    StrSw : struct_SectionSwitch;
  END_VAR
  VAR_INPUT
    basketRolledIn : TYPE_ReliableBit;
    basketRolledOut : TYPE_ReliableBit;
    basketTest : TYPE_ReliableBit;
    inNs : TYPE_ReliableBit;
    inoffKNA : TYPE_ReliableBit;
    inAccident : TYPE_ReliableBit;
    inLocal : TYPE_ReliableBit;
    inDistance : TYPE_ReliableBit;
    inBreakCmdOn : TYPE_ReliableBit;
    inBreakCmdOff : TYPE_ReliableBit;
  END_VAR
  VAR
    onInit : BOOL    := FALSE;
    _statOn : BOOL;
    _statOff : BOOL;
    getSdvig : BOOL;
    lastOnStatus : BYTE;
    cmd : BYTE;
    source : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    _basketRolledIn : TYPE_ReliableBit;
    _basketRolledOut : TYPE_ReliableBit;
    _basketTest : TYPE_ReliableBit;
    _sunpackerCommand : fb_sunpackerCommand;
    _statusDualInput : TYPE_statusDualInput;
    _statusBasket : TYPE_basketStats;
    _commandDualInput : TYPE_commandDualInput;
    _commandErrorTimer : BOOL;
    resetErrorTimer : BOOL;
    _changWithoutCommand : BOOL;
    errorCMDTimer : TON;
    _errorReset : TON;
    sdvigReset : TON;
    outputsSets : TOF;
  END_VAR
  VAR_IN_OUT
    cmdOn : BOOL;
    cmdOff : BOOL;
  END_VAR

  IF NOT onInit THEN
  IF StrSw.ISVALIDREF_cmdOn XOR StrSw.ISVALIDREF_cmdOff THEN
  	IF 	StrSw.ISVALIDREF_cmdOn THEN
  		lastCmd:= 2; (*baseCmdOff*) 
  	ELSE
  		lastCmd:= 1; (*baseCmdOn*) 
  	END_IF;
  END_IF;
  onInit:=TRUE;
  END_IF;

  (* ---- Формирование состояния тележки ---- *)

  IF (NOT StrSw.ISVALIDREF_basketRolledIn) AND (NOT StrSw.ISVALIDREF_basketRolledOut) THEN
            StrSw.basketStatus:=_statusBasket.BASKET_NOTDEFINED;
  ELSE
  		IF StrSw.ISVALIDREF_basketTest THEN
  		_basketTest:=basketTest;
  	ELSE
  		_basketTest.reliability:=TRUE;
  		_basketTest.value :=FALSE;
  	END_IF;

  	IF StrSw.ISVALIDREF_basketRolledIn THEN
  		_basketRolledIn:=basketRolledIn;
  	ELSE
  		_basketRolledIn:=basketRolledOut;
  		IF StrSw.ISVALIDREF_basketTest THEN
  		_basketRolledIn.value:=NOT (_basketRolledIn.value OR _basketTest.value);	
  		ELSE
  		_basketRolledIn.value:= NOT _basketRolledIn.value;	
  		END_IF;

  	END_IF;

  	IF StrSw.ISVALIDREF_basketRolledOut THEN
  		_basketRolledOut:=basketRolledOut;
  	ELSE
  		_basketRolledOut:=basketRolledIn;
  		IF StrSw.ISVALIDREF_basketTest THEN
  		_basketRolledOut.value:= NOT (_basketRolledOut.value OR _basketTest.value );	
  		ELSE
  			_basketRolledOut.value := NOT _basketRolledout.value;	
  		END_IF;

  	END_IF;

  IF _basketRolledIn.reliability AND _basketRolledOut.reliability AND _basketTest.reliability THEN
  		IF (BOOL_TO_INT(_basketRolledIn.value)+BOOL_TO_INT(_basketRolledOut.value)+BOOL_TO_INT(_basketTest.value))=1 THEN
  			IF _basketRolledIn.value THEN
  				StrSw.basketStatus:=_statusBasket.BASKET_ROLLEDIN;
  			ELSIF _basketRolledOut.value THEN
  				StrSw.basketStatus:=_statusBasket.BASKET_ROLLEDOUT;
  			ELSIF _basketTest.value THEN
  				StrSw.basketStatus:=_statusBasket.BASKET_TEST;
  			END_IF;
  		ELSE			
  			StrSw.basketStatus:=_statusBasket.BASKET_ERROR;
  		END_IF;
  	ELSE
  		StrSw.basketStatus:=_statusBasket.BASKET_NOTDEFINED;
  	END_IF;
  END_IF;

  (* ---- Если управление с ВУ заблокировано, то в ИМ передаем команду из алгоритма ---- *)
  IF StrSw.inOpcCommandsDisabled THEN
  	StrSw.inCommand := StrSw.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	StrSw.inCommand := StrSw.inCommand_ARM;
  END_IF;

  (* ---- Формирование состояния механизма ---- *)

  IF (StrSw.ISVALIDREF_statOn) OR (StrSw.ISVALIDREF_statOff) THEN
  	IF (StrSw.ISVALIDREF_statOn) AND (StrSw.ISVALIDREF_statOff) THEN
  	StrSw.reliability:= statOn_reliability AND statOff_reliability;
  		_statOn  := statOn;
  		_statOff := statOff;
  	ELSIF (StrSw.ISVALIDREF_statOn) THEN
                       StrSw.reliability:= statOn_reliability;	
  		_statOn  := statOn;
  		_statOff := NOT statOn; 
  	ELSIF (StrSw.ISVALIDREF_statOff) THEN
  		 StrSw.reliability:= statOff_reliability;	
  		_statOn  := NOT statOff;
  		_statOff :=statOff; 
  	END_IF;

  	IF StrSw.reliability THEN
  		IF _statOn AND NOT _statOff 		THEN 	StrSw.onStatus := _statusDualInput.STATUS_ON;
  		ELSIF _statOff AND NOT _statOn 	THEN 	StrSw.onStatus := _statusDualInput.Status_OFF;
  		ELSIF NOT _statOn AND NOT _statOff 	THEN 	StrSw.onStatus := _statusDualInput.STATUS_TRANSITIONAL;
  		ELSE					StrSw.onStatus := _statusDualInput.STATUS_ERROR;
                      END_IF;

  	ELSE
  		StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;

  	END_IF;
  ELSE
  	CASE BYTE_TO_INT(lastCmd) OF	
  		(*baseCmdOn*) 1: StrSw.onStatus  := _statusDualInput.STATUS_ON; 
  		(*baseCmdOff*) 2: StrSw.onStatus  := _statusDualInput.STATUS_OFF;

  	ELSE
  		 StrSw.onStatus := _statusDualInput.STATUS_NOTDEFINED;

  	END_CASE;
  END_IF;


  StrSw.Accident := inAccident.value AND inAccident.reliability;
  StrSw.Ns := inNs.value AND inNs.reliability;
  StrSw.Local := inLocal.value AND inLocal.reliability;
  StrSw.Distance := inDistance.value AND inDistance.reliability;
  StrSw.OpcCommandsDisabled := StrSw.inOpcCommandsDisabled;
  StrSw.offKNA := inoffKNA.value AND inoffKNA.reliability;

  (* ---- Формирование признака сдвига ---- *)

  getSdvig := FALSE;
  IF (StrSw.ISVALIDREF_cmdOn OR StrSw.ISVALIDREF_cmdOff) AND NOT StrSw.Local THEN
  	IF NOT (StrSw.CmdOn OR StrSw.CmdOff) THEN
                       IF (lastOnStatus <> StrSw.onStatus AND 
  		(StrSw.onStatus <> _statusDualInput.STATUS_NOTDEFINED AND
                       StrSw.onStatus <> _statusDualInput.STATUS_ERROR)     AND
  		(lastOnStatus <> _statusDualInput.STATUS_NOTDEFINED   AND
                       lastOnStatus <> _statusDualInput.STATUS_ERROR))      
                      THEN
  			getSdvig   := TRUE;
  		END_IF;
  	END_IF;
  END_IF;

  IF getSdvig THEN StrSw.sdvig:= TRUE; END_IF;

  sdvigReset(IN:=StrSw.sdvig, PT:=T#15S);

  IF sdvigReset.Q THEN StrSw.sdvig:=FALSE; END_IF;

  lastOnStatus := StrSw.onStatus;

  (* ---- Распаковка команды ---- *)
  _sunpackerCommand(command := StrSw.inCommand);
  	cmd := _sunpackerCommand.cmd;
  	source := _sunpackerCommand.source;

  (* ---- Обработка команды ---- *)
  IF cmd <> 0 AND lastCmd <> cmd and (((NOT StrSw.opcCommandsDisabled) AND source > 0) OR source = 0) then
  	CASE BYTE_TO_INT(cmd) OF
  	(*cmd_open*) 1 : 
  			IF  StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := TRUE;
  				IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE; END_IF;
  			ELSIF  StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := FALSE;  END_IF;
  			errorCMDTimer(IN := false);
  			_commandErrorTimer := true;
  			StrSw.lastCmdIsOn := true;
  	(*cmd_close*) 2 : 
  			IF StrSw.ISVALIDREF_cmdOff THEN StrSw.CmdOff := TRUE;
  				IF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
  			ELSIF StrSw.ISVALIDREF_cmdOn THEN StrSw.CmdOn := FALSE; END_IF;
  			errorCMDTimer(IN := false);
  			_commandErrorTimer := true;
  			StrSw.lastCmdIsOn := false;
  	(*cmd_reset*) 3 :    IF StrSw.ISVALIDREF_statOn OR StrSw.ISVALIDREF_statOff THEN
  			StrSw.CmdOn := FALSE;
  			StrSw.CmdOff := FALSE;
                                lastCmd := 0;
  			_commandErrorTimer := false;
  			StrSw.lastCmdIsOn := false;
                                 END_IF;
  	END_CASE;	
  	source_for_Status := source;
  	cmd_for_Status := cmd;
  	command_error_for_Status := 0;
  END_IF;
  lastCmd := cmd;

  errorCMDTimer(In := _commandErrorTimer, PT :=T#10s);

  (* ---- алгоритм  для команды ВКЛючить ---- *)
  IF (StrSw.onStatus = _statusDualInput.STATUS_ON) and (StrSw.lastCmdIsOn) then
  	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOn := false; END_IF;

  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- off ---- *)
  IF (StrSw.onStatus = _statusDualInput.STATUS_OFF) and (NOT StrSw.lastCmdIsOn) then
  	IF StrSw.ISVALIDREF_cmdOn AND StrSw.ISVALIDREF_cmdOff then  StrSw.cmdOff := false; END_IF;

  	 errorCMDTimer(In := false); 
  	 _commandErrorTimer := false;
  	 cmd_for_Status := 0;
  	 source_for_Status := 0;
  END_IF;

  (* ---- ошибка исполнения команды ---- *)
  if errorCMDTimer.Q and (cmd_for_Status <> 0) then
  	command_error_for_Status :=  cmd_for_Status;
  	_commandErrorTimer := false;
  	StrSw.CmdOn := false;
  	StrSw.CmdOff := false;
  	lastCmd := 0;
  end_if;

  (* ---- сброс ошибки команды ---- *)
  StrSw.CommandFault := command_error_for_Status <> 0;
  _errorReset(IN := command_error_for_Status <> 0, PT := T#5S);
  IF _errorReset.Q THEN
  	cmd_for_Status := 0;
  	source_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF;

  outputsSets(in := (StrSw.ISVALIDREF_cmdOn and StrSw.cmdOn ) OR (StrSw.ISVALIDREF_cmdOff and StrSw.cmdOff), PT := T#2S);
  	IF NOT outputsSets.Q THEN
  		StrSw.BreakCmdOn := inBreakCmdOn._inversed AND inBreakCmdOn.reliability AND StrSw.ISVALIDREF_inBreakCmdOn;
  		StrSw.BreakCmdOff := inBreakCmdOff._inversed AND inBreakCmdOff.reliability AND StrSw.ISVALIDREF_inBreakCmdOff;
  	END_IF;

  cmdOn := StrSw.cmdOn;
  cmdOff:= StrSw.cmdOff;    

  (* ---- формирование зашифрованного статуса для АРМа ---- *)
  StrSw.status := shl(BYTE_TO_DWORD(source_for_Status), 29) 
  		OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
  		OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
  		OR shl(bool_to_DWORD(StrSw.sdvig), 22)
  		OR shl(bool_to_DWORD(StrSw.OpcCommandsDisabled), 21)
                      OR shl(BOOL_TO_DWORD(StrSw.offKNA), 17)
                      OR shl(bool_to_DWORD(StrSw.lastCmdIsOn), 14) 
                      OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOff), 13) 
  		OR shl(BOOL_TO_DWORD(StrSw.BreakCmdOn), 12)
                      OR shl(BYTE_TO_DWORD(StrSw.basketStatus), 8) 
  		OR shl(BOOL_TO_DWORD(StrSw.Distance), 6) 
  		OR shl(BOOL_TO_DWORD(StrSw.Local), 5) 
  		OR shl(BOOL_TO_DWORD(StrSw.Ns), 4) 
                  	OR shl(BOOL_TO_DWORD(StrSw.Accident ),3)
  		OR BYTE_TO_DWORD(StrSw.onStatus);
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_singleOutput
  VAR_IN_OUT
    signal : BOOL;
    str_SO : struct_singleOutput;
  END_VAR
  VAR
    pulseTimer : TON;
    resetCmdTimer : TON;
    TON_Command : TON;
    source : BYTE;
    cmd : BYTE;
    lastCmd : BYTE;
    source_for_Status : BYTE;
    cmd_for_Status : BYTE;
    command_error_for_Status : BYTE;
    pulseTimerPriznak : BOOL;
    resetCmdTimerPriznak : BOOL;
    _sunpackerCommand : fb_sunpackerCommand;
  END_VAR

  str_SO.OpcCommandsDisabled := str_SO.inOpcCommandsDisabled;

  (* ---- Если управление с ВУ заблокировано, то передаем команду из алгоритма ---- *)
  IF str_SO.inOpcCommandsDisabled THEN
  	str_SO.inCommand := str_SO.inCommand_Alg;
  ELSE (* иначе передаем команду с АРМа*)
  	str_SO.inCommand := str_SO.inCommand_ARM;
  END_IF;

  (*Распаковка команды*)
  _sunpackerCommand(command := str_SO.inCommand);
  	cmd := _sunpackerCommand.cmd;
  	source := _sunpackerCommand.source;

  (*Обработка команды*)
  IF cmd <> 0 AND lastCmd <> cmd and (((NOT str_SO.OpcCommandsDisabled) AND source > 0) OR source = 0) then
  	CASE BYTE_TO_INT(cmd) OF
  	(*cmd_on*) 1 : 
  			str_SO.Q := TRUE; 
  			pulseTimer(IN := FALSE);
  			pulseTimerPriznak := FALSE;
  			resetCmdTimer(IN := FALSE);
  			resetCmdTimerPriznak := TRUE;
  	(*cmd_off*) 2 : 
  			str_SO.Q := FALSE; 
  			pulseTimer(IN := FALSE);
  			pulseTimerPriznak := FALSE;
  			resetCmdTimer(IN := FALSE);
  			resetCmdTimerPriznak := TRUE;
  	(*cmd_pulse*) 3 :
  			str_SO.Q := TRUE;
                                pulseTimer(IN := FALSE); 
                                pulseTimerPriznak := TRUE;
  			resetCmdTimer(IN := FALSE);
                                resetCmdTimerPriznak := FALSE;
  	END_CASE;	
  	source_for_Status := source;
  	cmd_for_Status := cmd;
  	command_error_for_Status := 0;
  END_IF;
  lastCmd := cmd;

  pulseTimer(IN := pulseTimerPriznak, PT := str_SO.wait_time);
  pulseTimer();
  IF pulseTimer.Q THEN
  	pulseTimer(IN := FALSE);
  	pulseTimerPriznak := FALSE;

  	str_SO.Q := FALSE;

  	source_for_Status := 0;
  	cmd_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF;

  resetCmdTimer(IN := resetCmdTimerPriznak, PT := T#10S);
  resetCmdTimer();
  IF resetCmdTimer.Q THEN
  	resetCmdTimer(IN := FALSE);
  	resetCmdTimerPriznak := FALSE;

  	source_for_Status := 0;
  	cmd_for_Status := 0;
  	command_error_for_Status := 0;
  END_IF;

  signal:= str_SO.Q;

  (*TON_Command(IN:= (inCommand <> 0) AND (source = 0), PT:= T#2S);*)
      (*IF TON_Command.Q THEN*)
          (*inCommand := 0;*)
      (*END_IF;*)
  str_SO.status :=                           shl(BYTE_TO_DWORD(source_for_Status), 29) 
  				OR shl(BYTE_TO_DWORD(cmd_for_Status), 26) 
  				OR shl(BYTE_TO_DWORD(command_error_for_Status), 23)
  				OR shl(BOOL_TO_DWORD(str_SO.OpcCommandsDisabled), 21)		
  				OR BOOL_TO_DWORD(str_SO.Q);
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_singleSignal
  VAR_INPUT
    signal : TYPE_ReliableBit;
  END_VAR
  VAR_IN_OUT
    str_SS : struct_singleSignal;
  END_VAR
  VAR
    TimerOn : TON;
    TimerOff : TOF;
  END_VAR

  str_SS.reliability:=signal.reliability;

  IF NOT str_SS.inverse THEN
  TimerOn(IN:=(signal.value AND str_SS.reliability AND NOT str_SS.Disabled_Sig), PT:=str_SS.DelayOn);
  ELSE
  TimerOn(IN:=(signal._inversed AND str_SS.reliability AND NOT str_SS.Disabled_Sig), PT:=str_SS.DelayOn);	
  END_IF;

  TimerOff(IN:=TimerOn.Q, PT:=str_SS.DelayOff);

  str_SS.Q:=TimerOff.Q;

  str_SS.status:= SHL(BOOL_TO_DWORD(NOT str_SS.reliability), 15)
  	OR BOOL_TO_DWORD(str_SS.Q);
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

FUNCTION_BLOCK Proc_Do_Init
  VAR_INPUT
    init : BOOL;
  END_VAR
  VAR
    stDO_Ini : fb_DO_Init;
    inits : UINT;
  END_VAR
  VAR_INPUT
    initiales : UINT;
  END_VAR
  VAR_EXTERNAL
    od : DoConfig;
  END_VAR

  inits := 0;

  stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do1);
  inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

  stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do2);
  inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

  stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do3);
  inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

  stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do4);
  inits := inits + BOOL_TO_UINT(stDO_Ini.Init);

  stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.Do5);
  inits := inits + BOOL_TO_UINT(stDO_Ini.Init);


  initiales := 0;
  IF init THEN initiales := inits; END_IF;
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

FUNCTION_BLOCK Proc_Do
  VAR
    fb_Do1 : fb_DOSourceMlp;
    fb_Do2 : fb_DOSourceMlp;
    fb_Do3 : fb_DOSourceMlp;
    fb_Do4 : fb_DOSourceMlp;
    fb_Do5 : fb_DOSourceMlp;
  END_VAR
  VAR_EXTERNAL
    od : DoConfig;
    arDOUT_0 : TWordData;
    arDOUT_1 : TWordData;
    arDOUT_2 : TWordData;
    arDOUT_3 : TWordData;
    arDOUT_4 : TWordData;
    DO_0_wValue : UINT;
    DO_1_wValue : UINT;
    DO_2_wValue : UINT;
    DO_3_wValue : UINT;
    DO_4_wValue : UINT;
    arERR_1 : TItemDIN;
    arERR_2 : TItemDIN;
    arERR_3 : TItemDIN;
    arERR_4 : TItemDIN;
    arERR_5 : TItemDIN;
  END_VAR

  fb_Do1(arDout := arDOUT_0, strDO := od.Do1, err_mod := arERR_1);
  DO_0_wValue := arDOUT_0.wValue;

  fb_Do2(arDout := arDOUT_1, strDO := od.Do2, err_mod := arERR_2);
  DO_1_wValue := arDOUT_1.wValue;

  fb_Do3(arDout := arDOUT_2, strDO := od.Do3, err_mod := arERR_3);
  DO_2_wValue := arDOUT_2.wValue;

  fb_Do4(arDout := arDOUT_3, strDO := od.Do4, err_mod := arERR_4);
  DO_3_wValue := arDOUT_3.wValue;

  fb_Do5(arDout := arDOUT_4, strDO := od.Do5, err_mod := arERR_5);
  DO_4_wValue := arDOUT_4.wValue;

  (*gpio_out not initialized*)
END_FUNCTION_BLOCK

FUNCTION_BLOCK Proc_Di_Init
  VAR_INPUT
    init : BOOL;
  END_VAR
  VAR
    stDI_Ini : fb_DI_Init;
    inits : UINT;
  END_VAR
  VAR_INPUT
    initiales : UINT;
  END_VAR
  VAR_EXTERNAL
    di : DiConfig;
  END_VAR

  inits := 0;

  stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di);
  inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

  stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di1);
  inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

  stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di2);
  inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

  stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di3);
  inits := inits + BOOL_TO_UINT(stDI_Ini.Init);

  stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.Di4);
  inits := inits + BOOL_TO_UINT(stDI_Ini.Init);


  initiales := 0;
  IF init THEN initiales := inits; END_IF;
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

FUNCTION_BLOCK fb_DiSourceMlp
  VAR_INPUT
    arDIN : TItemDIN;
    err_mod : TItemDIN;
  END_VAR
  VAR_IN_OUT
    strDI : struct_DI;
  END_VAR
  VAR_OUTPUT
    Bounce : BOOL;
  END_VAR
  VAR
    _value : WORD;
    _reliability : BOOL;
    bitNumber : INT;
    bitNum : INT;
  END_VAR

  strDI.blConnect := (*((UINT_TO_WORD(arDIN.wFlags) = 1472) and*) (UINT_TO_WORD(err_mod.wValue) = 20) and (UINT_TO_WORD(err_mod.wFlags) = 192);
  Bounce := (UINT_TO_WORD(arDIN.wFlags) AND 16#0020) <> 0;

  If NOT strDI.imit THEN
  _value:=UINT_TO_WORD(arDIN.wValue);

      IF strDI.blConnect THEN
            strDI.reliability:=0;
            strDI.value:=0;
  	FOR bitNumber:=0 TO 7 BY 1 DO

  		_reliability:=WORD_TO_BOOL(SHR(_value, bitNumber*2) AND 16#2);
  		strDI.reliability:=strDI.reliability OR SHL(BOOL_TO_WORD(_reliability),bitNumber);
  		IF _reliability THEN
  			strDI.value:=strDI.value OR SHL((SHR(_value, bitNumber*2) AND 16#1),bitNumber);
  		END_IF;
  	END_FOR;
      ELSE
  	strDI.reliability := 0;
      END_IF;

      FOR bitNum:=0 TO 15 BY 1 DO
  	          strDI.bits[bitNum].reliability :=WORD_TO_BOOL(SHR(strDI.reliability, bitNum) AND 16#1);
  	IF strDI.bits[bitNum].reliability THEN
  		strDI.bits[bitNum].value :=WORD_TO_BOOL(SHR(strDI.value, bitNum) AND 16#1);
                      strDI.bits[bitNum]._inversed :=NOT strDI.bits[bitNum].value;
  	END_IF;
      END_FOR;



  END_IF;
END_FUNCTION_BLOCK

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
END_FUNCTION_BLOCK

FUNCTION_BLOCK Proc_Di
  VAR
    fb_Di : fb_DiSourceMlp;
    fb_Di1 : fb_DiSourceMlp;
    fb_Di2 : fb_DiSourceMlp;
    fb_Di3 : fb_DiSourceMlp;
    fb_Di4 : fb_DiSourceMlp;
  END_VAR
  VAR_EXTERNAL
    di : DiConfig;
    arDIN_0 : TItemDIN;
    arDIN_1 : TItemDIN;
    arDIN_2 : TItemDIN;
    arDIN_3 : TItemDIN;
    arDIN_4 : TItemDIN;
    DI_0_1_wValue : UDINT;
    DI_2_3_wValue : UDINT;
    arERR_1 : TItemDIN;
    arERR_2 : TItemDIN;
    arERR_3 : TItemDIN;
    arERR_4 : TItemDIN;
    arERR_5 : TItemDIN;
  END_VAR

  fb_Di(arDIN := arDIN_0, strDI := di.Di, err_mod := arERR_1);
  fb_Di1(arDIN := arDIN_1, strDI := di.Di1, err_mod := arERR_2);
  DI_0_1_wValue := DIwValue_Diag(arDIN_0.wValue, arDIN_1.wValue);

  fb_Di2(arDIN := arDIN_2, strDI := di.Di2, err_mod := arERR_3);
  fb_Di3(arDIN := arDIN_3, strDI := di.Di3, err_mod := arERR_4);
  DI_2_3_wValue := DIwValue_Diag(arDIN_2.wValue, arDIN_3.wValue);

  fb_Di4(arDIN := arDIN_4, strDI := di.Di4, err_mod := arERR_5);
END_FUNCTION_BLOCK

PROGRAM program0
  VAR
    Var0 : DINT;
  END_VAR

  Var0 := 1;
END_PROGRAM


CONFIGURATION config1
  VAR_GLOBAL
    systime_s AT %IL0.10.10 : ULINT;
    systime_ns AT %IL0.10.11 : ULINT;
    current_retrieve_us AT %IL0.10.12 : ULINT;
    current_config_us AT %IL0.10.13 : ULINT;
    current_publish_us AT %IL0.10.14 : ULINT;
    current_run_us AT %IL0.10.15 : ULINT;
    max_retrieve_us AT %QL0.10.16 : ULINT;
    max_config_us AT %QL0.10.17 : ULINT;
    max_publish_us AT %QL0.10.18 : ULINT;
    plc_run_number AT %IL0.10.19 : ULINT;
    arAIN_0 : TItemAIN;
    arAIN_1 : TItemAIN;
    arAIN_2 : TItemAIN;
    arAIN_3 : TItemAIN;
    arAIN_4 : TItemAIN;
    arAIN_5 : TItemAIN;
    arAIN_6 : TItemAIN;
    arAIN_7 : TItemAIN;
    arAIN_8 : TItemAIN;
    arAIN_9 : TItemAIN;
    arAIN_10 : TItemAIN;
    arAIN_11 : TItemAIN;
    arAIN_12 : TItemAIN;
    arAIN_13 : TItemAIN;
    arAIN_14 : TItemAIN;
    arAIN_15 : TItemAIN;
    arAIN_16 : TItemAIN;
    arAIN_17 : TItemAIN;
    arAIN_18 : TItemAIN;
    arAIN_19 : TItemAIN;
    arAIN_20 : TItemAIN;
    arAIN_21 : TItemAIN;
    arAIN_22 : TItemAIN;
    arAIN_23 : TItemAIN;
    arAIN_24 : TItemAIN;
    arAIN_25 : TItemAIN;
    arAIN_26 : TItemAIN;
    arAIN_27 : TItemAIN;
    arAIN_28 : TItemAIN;
    arAIN_29 : TItemAIN;
    arAIN_30 : TItemAIN;
    arAIN_31 : TItemAIN;
    arAIN_32 : TItemAIN;
    arAIN_33 : TItemAIN;
    arAIN_34 : TItemAIN;
    arAIN_35 : TItemAIN;
    arAIN_36 : TItemAIN;
    arAIN_37 : TItemAIN;
    arAIN_38 : TItemAIN;
    arAIN_39 : TItemAIN;
    arAIN_40 : TItemAIN;
    arAIN_41 : TItemAIN;
    arAIN_42 : TItemAIN;
    arAIN_43 : TItemAIN;
    arAIN_44 : TItemAIN;
    arAIN_45 : TItemAIN;
    arAIN_46 : TItemAIN;
    arAIN_47 : TItemAIN;
    arAIN_48 : TItemAIN;
    arAIN_49 : TItemAIN;
    arAIN_50 : TItemAIN;
    arAIN_51 : TItemAIN;
    arAIN_52 : TItemAIN;
    arAIN_53 : TItemAIN;
    arAIN_54 : TItemAIN;
    arAIN_55 : TItemAIN;
    arAIN_56 : TItemAIN;
    arAIN_57 : TItemAIN;
    arAIN_58 : TItemAIN;
    arAIN_59 : TItemAIN;
    arAIN_60 : TItemAIN;
    arAIN_61 : TItemAIN;
    arAIN_62 : TItemAIN;
    arAIN_63 : TItemAIN;
    arAIN_64 : TItemAIN;
    arAIN_65 : TItemAIN;
    arAIN_66 : TItemAIN;
    arAIN_67 : TItemAIN;
    arAIN_68 : TItemAIN;
    arAIN_69 : TItemAIN;
    arAIN_70 : TItemAIN;
    arAIN_71 : TItemAIN;
    arAIN_72 : TItemAIN;
    arAIN_73 : TItemAIN;
    arAIN_74 : TItemAIN;
    arAIN_75 : TItemAIN;
    arAIN_76 : TItemAIN;
    arAIN_77 : TItemAIN;
    arAIN_78 : TItemAIN;
    arAIN_79 : TItemAIN;
    arDIN_0 : TItemDIN;
    arDIN_1 : TItemDIN;
    arDIN_2 : TItemDIN;
    arDIN_3 : TItemDIN;
    arDIN_4 : TItemDIN;
    arDIN_5 : TItemDIN;
    arDIN_6 : TItemDIN;
    arDIN_7 : TItemDIN;
    arDIN_8 : TItemDIN;
    arDIN_9 : TItemDIN;
    arDIN_10 : TItemDIN;
    arDIN_11 : TItemDIN;
    arDIN_12 : TItemDIN;
    arDIN_13 : TItemDIN;
    arDIN_14 : TItemDIN;
    arDIN_15 : TItemDIN;
    arDIN_16 : TItemDIN;
    arDIN_17 : TItemDIN;
    arDIN_18 : TItemDIN;
    arDIN_19 : TItemDIN;
    arDIN_20 : TItemDIN;
    arDIN_21 : TItemDIN;
    arAOUT_0 : TDoubleData;
    arAOUT_1 : TDoubleData;
    arDOUT_0 : TWordData;
    arDOUT_1 : TWordData;
    arDOUT_2 : TWordData;
    arDOUT_3 : TWordData;
    arDOUT_4 : TWordData;
    arDOUT_5 : TWordData;
    arDOUT_6 : TWordData;
    arDOUT_7 : TWordData;
    arDOUT_8 : TWordData;
    arDOUT_9 : TWordData;
    arDOUT_10 : TWordData;
    arDOUT_11 : TWordData;
    arDOUT_12 : TWordData;
    arDOUT_13 : TWordData;
    arDOUT_66 : TWordData;
    arERR_0 : TItemDIN;
    arERR_1 : TItemDIN;
    arERR_2 : TItemDIN;
    arERR_3 : TItemDIN;
    arERR_4 : TItemDIN;
    arERR_5 : TItemDIN;
    arERR_6 : TItemDIN;
    arERR_7 : TItemDIN;
    arERR_8 : TItemDIN;
    arERR_9 : TItemDIN;
    arERR_10 : TItemDIN;
    arERR_11 : TItemDIN;
    arERR_12 : TItemDIN;
    arERR_13 : TItemDIN;
    arERR_14 : TItemDIN;
    arERR_15 : TItemDIN;
    arERR_16 : TItemDIN;
    arERR_17 : TItemDIN;
    arERR_18 : TItemDIN;
    arERR_19 : TItemDIN;
    arERR_20 : TItemDIN;
    arERR_21 : TItemDIN;
    arERR_22 : TItemDIN;
    arERR_23 : TItemDIN;
    arERR_24 : TItemDIN;
    arERR_25 : TItemDIN;
    arERR_66 : TItemDIN;
    arRelSt_0 : TItemDIN;
  END_VAR

  RESOURCE resource1 ON PLC
    VAR_GLOBAL CONSTANT
      gMaint_Time : REAL;
    END_VAR
    VAR_GLOBAL
      Ai : AiConfig;
      Im : ImConfig;
      di : DiConfig;
      od : DoConfig;
      cur_Cycle : REAL;
      gStart_Tmr : REAL;
    END_VAR
    VAR_GLOBAL CONSTANT
      req_Cycle : REAL := 0.02;
    END_VAR
    VAR_GLOBAL
      gF_T_100mSec : BOOL;
      gT_1Sec : BOOL;
      gF_T_1Sec : BOOL;
      gT_1Min : BOOL;
      gR_T_1Min : BOOL;
      gF_T_1Min : BOOL;
      T_1SEC : REAL;
      del_T : REAL;
      NotHasRezervNU : BOOL;
      Reset_HasNU : BOOL;
      AI_A1_HA AT %QL0.8 : LREAL;
      AI_A1_HL AT %QL0.4 : LREAL;
      AI_A1_HW AT %QL0.10 : LREAL;
      AI_A1_LA AT %QL0.12 : LREAL;
      AI_A1_LL AT %QL0.5 : LREAL;
      AI_A1_LW AT %QL0.14 : LREAL;
      AI_A1_command AT %QW0.2 : UINT;
      AI_A1_newHA AT %QL0.9 : LREAL;
      AI_A1_newHL AT %QL0.6 : LREAL;
      AI_A1_newHW AT %QL0.11 : LREAL;
      AI_A1_newLA AT %QL0.13 : LREAL;
      AI_A1_newLL AT %QL0.7 : LREAL;
      AI_A1_newLW AT %QL0.15 : LREAL;
      AI_A1_status AT %QD0.1 : UDINT;
      AI_A1_value AT %QL0.3 : LREAL;
      AI_A2_HA AT %QL0.23 : LREAL;
      AI_A2_HL AT %QL0.19 : LREAL;
      AI_A2_HW AT %QL0.25 : LREAL;
      AI_A2_LA AT %QL0.27 : LREAL;
      AI_A2_LL AT %QL0.20 : LREAL;
      AI_A2_LW AT %QL0.29 : LREAL;
      AI_A2_command AT %QW0.17 : UINT;
      AI_A2_newHA AT %QL0.24 : LREAL;
      AI_A2_newHL AT %QL0.21 : LREAL;
      AI_A2_newHW AT %QL0.26 : LREAL;
      AI_A2_newLA AT %QL0.28 : LREAL;
      AI_A2_newLL AT %QL0.22 : LREAL;
      AI_A2_newLW AT %QL0.30 : LREAL;
      AI_A2_status AT %QD0.16 : UDINT;
      AI_A2_value AT %QL0.18 : LREAL;
      A1_10_err_mode AT %QW0.825 : UINT;
      A1_11_err_mode AT %QW0.826 : UINT;
      A1_12_err_mode AT %QW0.827 : UINT;
      A1_13_err_mode AT %QW0.828 : UINT;
      A1_14_err_mode AT %QW0.829 : UINT;
      A1_15_err_mode AT %QW0.830 : UINT;
      A1_1_err_mode AT %QW0.816 : UINT;
      A1_2_err_mode AT %QW0.817 : UINT;
      A1_3_err_mode AT %QW0.818 : UINT;
      A1_4_err_mode AT %QW0.819 : UINT;
      A1_5_err_mode AT %QW0.820 : UINT;
      A1_6_err_mode AT %QW0.821 : UINT;
      A1_7_err_mode AT %QW0.822 : UINT;
      A1_8_err_mode AT %QW0.823 : UINT;
      A1_9_err_mode AT %QW0.824 : UINT;
      A2_10_err_mode AT %QW0.840 : UINT;
      A2_11_err_mode AT %QW0.841 : UINT;
      A2_12_err_mode AT %QW0.842 : UINT;
      A2_13_err_mode AT %QW0.843 : UINT;
      A2_14_err_mode AT %QW0.844 : UINT;
      A2_15_err_mode AT %QW0.845 : UINT;
      A2_1_err_mode AT %QW0.831 : UINT;
      A2_2_err_mode AT %QW0.832 : UINT;
      A2_3_err_mode AT %QW0.833 : UINT;
      A2_4_err_mode AT %QW0.834 : UINT;
      A2_5_err_mode AT %QW0.835 : UINT;
      A2_6_err_mode AT %QW0.836 : UINT;
      A2_7_err_mode AT %QW0.837 : UINT;
      A2_8_err_mode AT %QW0.838 : UINT;
      A2_9_err_mode AT %QW0.839 : UINT;
      AI_0_dblValue AT %QL0.736 : LREAL;
      AI_10_dblValue AT %QL0.746 : LREAL;
      AI_11_dblValue AT %QL0.747 : LREAL;
      AI_12_dblValue AT %QL0.748 : LREAL;
      AI_13_dblValue AT %QL0.749 : LREAL;
      AI_14_dblValue AT %QL0.750 : LREAL;
      AI_15_dblValue AT %QL0.751 : LREAL;
      AI_16_dblValue AT %QL0.752 : LREAL;
      AI_17_dblValue AT %QL0.753 : LREAL;
      AI_18_dblValue AT %QL0.754 : LREAL;
      AI_19_dblValue AT %QL0.755 : LREAL;
      AI_1_dblValue AT %QL0.737 : LREAL;
      AI_20_dblValue AT %QL0.756 : LREAL;
      AI_21_dblValue AT %QL0.757 : LREAL;
      AI_22_dblValue AT %QL0.758 : LREAL;
      AI_23_dblValue AT %QL0.759 : LREAL;
      AI_24_dblValue AT %QL0.760 : LREAL;
      AI_25_dblValue AT %QL0.761 : LREAL;
      AI_26_dblValue AT %QL0.762 : LREAL;
      AI_27_dblValue AT %QL0.763 : LREAL;
      AI_28_dblValue AT %QL0.764 : LREAL;
      AI_29_dblValue AT %QL0.765 : LREAL;
      AI_2_dblValue AT %QL0.738 : LREAL;
      AI_30_dblValue AT %QL0.766 : LREAL;
      AI_31_dblValue AT %QL0.767 : LREAL;
      AI_32_dblValue AT %QL0.768 : LREAL;
      AI_33_dblValue AT %QL0.769 : LREAL;
      AI_34_dblValue AT %QL0.770 : LREAL;
      AI_35_dblValue AT %QL0.771 : LREAL;
      AI_36_dblValue AT %QL0.772 : LREAL;
      AI_37_dblValue AT %QL0.773 : LREAL;
      AI_38_dblValue AT %QL0.774 : LREAL;
      AI_39_dblValue AT %QL0.775 : LREAL;
      AI_3_dblValue AT %QL0.739 : LREAL;
      AI_40_dblValue AT %QL0.776 : LREAL;
      AI_41_dblValue AT %QL0.777 : LREAL;
      AI_42_dblValue AT %QL0.778 : LREAL;
      AI_43_dblValue AT %QL0.779 : LREAL;
      AI_44_dblValue AT %QL0.780 : LREAL;
      AI_45_dblValue AT %QL0.781 : LREAL;
      AI_46_dblValue AT %QL0.782 : LREAL;
      AI_47_dblValue AT %QL0.783 : LREAL;
      AI_48_dblValue AT %QL0.784 : LREAL;
      AI_49_dblValue AT %QL0.785 : LREAL;
      AI_4_dblValue AT %QL0.740 : LREAL;
      AI_50_dblValue AT %QL0.786 : LREAL;
      AI_51_dblValue AT %QL0.787 : LREAL;
      AI_52_dblValue AT %QL0.788 : LREAL;
      AI_53_dblValue AT %QL0.789 : LREAL;
      AI_54_dblValue AT %QL0.790 : LREAL;
      AI_55_dblValue AT %QL0.791 : LREAL;
      AI_56_dblValue AT %QL0.792 : LREAL;
      AI_57_dblValue AT %QL0.793 : LREAL;
      AI_58_dblValue AT %QL0.794 : LREAL;
      AI_59_dblValue AT %QL0.795 : LREAL;
      AI_5_dblValue AT %QL0.741 : LREAL;
      AI_60_dblValue AT %QL0.796 : LREAL;
      AI_61_dblValue AT %QL0.797 : LREAL;
      AI_62_dblValue AT %QL0.798 : LREAL;
      AI_63_dblValue AT %QL0.799 : LREAL;
      AI_64_dblValue AT %QL0.800 : LREAL;
      AI_65_dblValue AT %QL0.801 : LREAL;
      AI_66_dblValue AT %QL0.802 : LREAL;
      AI_67_dblValue AT %QL0.803 : LREAL;
      AI_68_dblValue AT %QL0.804 : LREAL;
      AI_69_dblValue AT %QL0.805 : LREAL;
      AI_6_dblValue AT %QL0.742 : LREAL;
      AI_70_dblValue AT %QL0.806 : LREAL;
      AI_71_dblValue AT %QL0.807 : LREAL;
      AI_72_dblValue AT %QL0.808 : LREAL;
      AI_73_dblValue AT %QL0.809 : LREAL;
      AI_74_dblValue AT %QL0.810 : LREAL;
      AI_75_dblValue AT %QL0.811 : LREAL;
      AI_76_dblValue AT %QL0.812 : LREAL;
      AI_77_dblValue AT %QL0.813 : LREAL;
      AI_78_dblValue AT %QL0.814 : LREAL;
      AI_79_dblValue AT %QL0.815 : LREAL;
      AI_7_dblValue AT %QL0.743 : LREAL;
      AI_8_dblValue AT %QL0.744 : LREAL;
      AI_9_dblValue AT %QL0.745 : LREAL;
      BS_Core1 AT %QD0.603 : REAL;
      BS_Core2 AT %QD0.675 : REAL;
      BS_Core3 AT %QD0.683 : REAL;
      BS_Core4 AT %QD0.709 : REAL;
      BS_FreeMemory AT %QD0.730 : REAL;
      BS_Temp1 AT %QD0.734 : REAL;
      BS_Temp2 AT %QD0.735 : REAL;
      DI_0_1_wValue AT %QD0.852 : UDINT;
      DI_10_11_wValue AT %QD0.857 : UDINT;
      DI_12_13_wValue AT %QD0.858 : UDINT;
      DI_14_15_wValue AT %QD0.859 : UDINT;
      DI_16_17_wValue AT %QD0.860 : UDINT;
      DI_18_19_wValue AT %QD0.861 : UDINT;
      DI_20_21_wValue AT %QD0.862 : UDINT;
      DI_2_3_wValue AT %QD0.853 : UDINT;
      DI_4_5_wValue AT %QD0.854 : UDINT;
      DI_6_7_wValue AT %QD0.855 : UDINT;
      DI_8_9_wValue AT %QD0.856 : UDINT;
      DO_0_wValue AT %QW0.846 : UINT;
      DO_1_wValue AT %QW0.847 : UINT;
      DO_2_wValue AT %QW0.848 : UINT;
      DO_3_wValue AT %QW0.849 : UINT;
      DO_4_wValue AT %QW0.850 : UINT;
      DO_5_wValue AT %QW0.851 : UINT;
      IM_Avom1_inCommand_ARM AT %QW0.43 : UINT;
      IM_Avom1_status AT %QD0.44 : UDINT;
      IM_Avom2_inCommand_ARM AT %QW0.45 : UINT;
      IM_Avom2_status AT %QD0.46 : UDINT;
      IM_Avom3_inCommand_ARM AT %QW0.47 : UINT;
      IM_Avom3_status AT %QD0.48 : UDINT;
      IM_Avom4_inCommand_ARM AT %QW0.49 : UINT;
      IM_Avom4_status AT %QD0.50 : UDINT;
      IM_Kran1_inCommand_ARM AT %QW0.31 : UINT;
      IM_Kran1_status AT %QD0.32 : UDINT;
      IM_Kran2_inCommand_ARM AT %QW0.35 : UINT;
      IM_Kran2_status AT %QD0.36 : UDINT;
      IM_Kran3_inCommand_ARM AT %QW0.37 : UINT;
      IM_Kran3_status AT %QD0.38 : UDINT;
      IM_Kran4_inCommand_ARM AT %QW0.33 : UINT;
      IM_Kran4_status AT %QD0.34 : UDINT;
      IM_Mv_inCommand_ARM AT %QW0.51 : UINT;
      IM_Mv_status AT %QD0.52 : UDINT;
      IM_Nu2_inCommand_ARM AT %QW0.41 : UINT;
      IM_Nu2_status AT %QD0.42 : UDINT;
      IM_Nu_inCommand_ARM AT %QW0.39 : UINT;
      IM_Nu_status AT %QD0.40 : UDINT;
      IM_SectionSwitch1_inCommand_ARM AT %QW0.53 : UINT;
      IM_SectionSwitch1_status AT %QD0.54 : UDINT;
      IM_SingleSignals_SI0_status AT %QD0.55 : UDINT;
      IM_SingleSignals_SI1_status AT %QD0.56 : UDINT;
      IM_SingleSignals_SI2_status AT %QD0.57 : UDINT;
      IM_SingleSignals_SI3_status AT %QD0.58 : UDINT;
      IM_SingleSignals_SI4_status AT %QD0.59 : UDINT;
      IM_SingleSignals_SI5_status AT %QD0.60 : UDINT;
      IM_SingleSignals_SI6_status AT %QD0.61 : UDINT;
      Protections_AiP1_inCommand_ARM AT %QW0.74 : UINT;
      Protections_AiP1_status AT %QD0.75 : UDINT;
      Protections_AiP2_inCommand_ARM AT %QW0.76 : UINT;
      Protections_AiP2_status AT %QD0.77 : UDINT;
      Protections_AiP3_inCommand_ARM AT %QW0.78 : UINT;
      Protections_AiP3_status AT %QD0.79 : UDINT;
      Protections_Ap1_inCommand_ARM AT %QW0.72 : UINT;
      Protections_Ap1_status AT %QD0.73 : UDINT;
      Protections_DiP1_inCommand_ARM AT %QW0.62 : UINT;
      Protections_DiP1_status AT %QD0.63 : UDINT;
      Protections_DiP2_inCommand_ARM AT %QW0.64 : UINT;
      Protections_DiP2_status AT %QD0.65 : UDINT;
      Protections_DiP3_inCommand_ARM AT %QW0.66 : UINT;
      Protections_DiP3_status AT %QD0.67 : UDINT;
      Protections_DiP4_inCommand_ARM AT %QW0.68 : UINT;
      Protections_DiP4_status AT %QD0.69 : UDINT;
      Protections_DiP5_inCommand_ARM AT %QW0.70 : UINT;
      Protections_DiP5_status AT %QD0.71 : UDINT;
    END_VAR
    TASK task0(INTERVAL := T#5ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
