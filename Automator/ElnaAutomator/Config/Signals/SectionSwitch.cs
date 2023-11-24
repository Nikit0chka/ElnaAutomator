namespace ElnaAutomator.Config.Signals;

public class SectionSwitch:ExecutiveMechanism
{
    public DiscreteInput? BasketInDiscreteInput { get; init; }
    public int? BasketInDiscreteInputBit { get; init; }
    public DiscreteInput? BasketOutDiscreteInput { get; init; }
    public int? BasketOutDiscreteInputBit { get; init; }
    public DiscreteInput? BasketTestDiscreteInput { get; init; }
    public int? BasketTestDiscreteInputBit { get; init; }
    public DiscreteInput? InBreakCmdOn { get; init; }
    public int? InBreakCmdOnBit { get; init; }
    public DiscreteInput? InBreakCmdOff { get; init; }
    public int? InBreakCmdOffBit { get; init; }
}