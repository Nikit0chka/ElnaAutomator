namespace ElnaAutomator.Config.ConfigStructs;

public class SectionSwitch:ExecutiveMechanism
{
    public DiscreteInput? BasketInDiscreteInput { get; set; }
    public int? BasketInDiscreteInputBit { get; set; }
    public DiscreteInput? BasketOutDiscreteInput { get; set; }
    public int? BasketOutDiscreteInputBit { get; set; }
    public DiscreteInput? BasketTestDiscreteInput { get; set; }
    public int? BasketTestDiscreteInputBit { get; set; }
    public DiscreteInput? InBreakCmdOn { get; set; }
    public int? InBreakCmdOnBit { get; set; }
    public DiscreteInput? InBreakCmdOff { get; set; }
    public int? InBreakCmdOffBit { get; set; }
}