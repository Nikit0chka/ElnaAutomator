namespace ElnaAutomator.Config.ConfigStructs;

public class SingleOutput
{
    public required string Name { get; set; }
    public DiscreteOutput? DiscreteOutput { get; set; }
    public int? Address { get; set; }
}