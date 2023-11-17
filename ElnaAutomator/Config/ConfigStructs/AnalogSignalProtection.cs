namespace ElnaAutomator.Config.ConfigStructs;

public class AnalogSignalProtection
{
    public required string Name { get; init; }
    public AnalogInput? AnalogInput { get; set; }
    public required int Delay { get; set; }
    public required bool IsRunOnStart { get; set; }

    public required bool IsUpperLimitProtection { get; set; }
}