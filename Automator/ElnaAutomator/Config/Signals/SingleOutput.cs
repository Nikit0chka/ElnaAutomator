namespace ElnaAutomator.Config.Signals;

public class SingleOutput
{
    public required string Name { get; init; }
    public DiscreteOutput? DiscreteOutput { get; init; }
    public int? Address { get; init; }
}