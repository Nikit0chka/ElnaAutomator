namespace ElnaAutomator.Config.ConfigStructs;

public class AnalogInput
{
    public required string Name{ get; set; }
    public required int HighLimit{ get; set; }
    public required int LowLimit{ get; set; }
    public int? HighAlarm{ get; set; }
    public int? LowAlarm{ get; set; }
    public int? HighWarning{ get; set; }
    public int? LowWarning { get; set; }
}