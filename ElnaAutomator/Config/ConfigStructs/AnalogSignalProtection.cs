namespace ElnaAutomator.ConfigStructs;

public class AnalogSignalProtection
{
    public required string Name { get; set; }
    public required AnalogInput AnalogInput { get; set; }
    public required bool IsUpperLimitProtection { get; set; }
}