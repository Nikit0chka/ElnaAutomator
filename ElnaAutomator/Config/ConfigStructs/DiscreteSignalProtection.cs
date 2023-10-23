using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.ConfigStructs;

public class DiscreteSignalProtection
{
    public required string Name{ get; set; }
    public required SingleInput SingleInput { get; set; }
    public required bool IsOnLimitProtection { get; set; }
}