namespace ElnaAutomator.Config.Signals;

public class DiscreteSignalProtection
{
    public required string Name { get; init; }

    public SingleInput? SingleInput { get; init; }
    public required int Delay { get; init; }
    public required bool IsRunOnStart { get; init; }
}