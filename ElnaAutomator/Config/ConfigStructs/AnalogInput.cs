namespace ElnaAutomator.Config.ConfigStructs;

public class AnalogInput
{
    public required string Name { get; init; }
    public required int HighLimit { get; set; }
    public required int LowLimit { get; set; }
    public required int ModuleAddress { get; init; }
    public required int Address { get; init; }
    public int? HighAlarm { get; init; }
    public int? LowAlarm { get; init; }
    public int? HighWarning { get; init; }
    public int? LowWarning { get; init; }
}