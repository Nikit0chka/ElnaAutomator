namespace ElnaAutomator.Config.Signals;

public class SingleInput
{
    public required string Name { get; init; }
    public DiscreteInput? DiscreteInput { get; init; }
    public required bool IsInversed { get; init; }
    public required bool IsProtectionsSignalling { get; set; }
    public int? Address { get; init; }
}