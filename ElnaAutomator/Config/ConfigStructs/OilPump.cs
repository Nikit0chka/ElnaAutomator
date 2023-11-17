﻿namespace ElnaAutomator.Config.ConfigStructs;

public class OilPump:ExecutiveMechanism
{    public DiscreteInput? InBreakCmdOn { get; set; }
    public int? InBreakCmdOnBit { get; set; } 
    public DiscreteInput? InBreakCmdOff { get; set; }
    public int? InBreakCmdOffBit { get; set; }
}