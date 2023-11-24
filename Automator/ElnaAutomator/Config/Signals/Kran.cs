namespace ElnaAutomator.Config.Signals;

public class Kran:ExecutiveMechanism
{
    public DiscreteInput? InDpDiscreteInput { get; init; }
    public int? InDpDiscreteInputBit { get; init; }
    public DiscreteInput? InSoDiscreteInput { get; init; }
    public int? InSoDiscreteInputBit { get; init; }
    public DiscreteInput? InSzDiscreteInput { get; init; }
    public int? InSzDiscreteInputBit { get; init; }

}