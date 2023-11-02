namespace ElnaAutomator.Config.ConfigStructs;

public class AnalogSignalProtection
{
    public required string Name { get; set; }
    public  AnalogInput? AnalogInput { get; set; }
    public required bool IsUpperLimitProtection { get; set; }
}