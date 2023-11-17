namespace ElnaAutomator.Config.ConfigStructs;

public class SingleInput
{
    public required string Name { get; set; }
    public DiscreteInput? DiscreteInput { get; set; }
    public required bool IsInversed { get; set; }
    public int? Address { get; set; }
}