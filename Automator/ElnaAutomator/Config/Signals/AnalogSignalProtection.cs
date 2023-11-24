namespace ElnaAutomator.Config.Signals;

public class AnalogSignalProtection
{
    public required string Name { get; init; }
    public AnalogInput? AnalogInput { get; init; }
    public required int Delay { get; init; }
    public required bool IsRunOnStart { get; init; }

    public required bool IsUpperLimitProtection { get; init; }
}