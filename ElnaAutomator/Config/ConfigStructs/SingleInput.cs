namespace ElnaAutomator.Config.ConfigStructs;

public class SingleInput
{
    public required string Name { get; init; }
    public DiscreteInput? DiscreteInput { get; init; }
    public required bool IsInversed { get; init; }
    public int? Address { get; init; }
}