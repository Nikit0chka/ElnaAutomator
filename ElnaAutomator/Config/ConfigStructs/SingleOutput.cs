namespace ElnaAutomator.Config.ConfigStructs;

public class SingleOutput
{
    public required string Name { get; set; }
    public DiscreteOutput? DigitalOutput { get; set; }
}