namespace ElnaAutomator.Config.ConfigStructs;

public class Kran:ExecutiveMechanism
{
    public DiscreteInput? InDpDiscreteInput { get; set; }
    public int? InDpDiscreteInputBit { get; set; }
    public DiscreteInput? InSoDiscreteInput { get; set; }
    public int? InSoDiscreteInputBit { get; set; }
    public DiscreteInput? InSzDiscreteInput { get; set; }
    public int? InSzDiscreteInputBit { get; set; }

}