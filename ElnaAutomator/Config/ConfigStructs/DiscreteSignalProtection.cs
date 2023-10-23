namespace ElnaAutomator.Config.ConfigStructs;

public class DiscreteSignalProtection
{
    public required string Name{ get; set; }
    public required SingleInput SingleInput { get; set; }
    public required bool IsOnLimitProtection { get; set; }
}