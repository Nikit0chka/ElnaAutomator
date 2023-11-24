namespace ElnaAutomator.Config.Signals;

public class OilPump:ExecutiveMechanism
{
    public DiscreteInput? InBreakCmdOn { get; init; }
    public int? InBreakCmdOnBit { get; init; }
    public DiscreteInput? InBreakCmdOff { get; init; }
    public int? InBreakCmdOffBit { get; init; }
}