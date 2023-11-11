namespace ElnaAutomator.Config.ConfigStructs;

public class SectionSwitch:ExecutiveMechanism
{
    public DiscreteInput? BasketInDiscreteInput { get; set; }
    public int? BasketInDiscreteInputBit { get; set; }
    public DiscreteInput? BasketOutDiscreteInput { get; set; }
    public int? BasketOutDiscreteInputBit { get; set; }
}