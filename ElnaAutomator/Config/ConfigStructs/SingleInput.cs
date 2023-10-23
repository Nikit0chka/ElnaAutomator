namespace ElnaAutomator.Config.ConfigStructs;

public class SingleInput
{
    public required string Name { get; set; }
    public required DiscreteInput DiscreteInput { get; set; }
    public required int Address { get; set; }
}