namespace ElnaAutomator.Config.ConfigStructs;

abstract public class ExecutiveMechanism
{
    public required string Name {get; set; }
    public DiscreteInput? StatOnDiscreteInput { get; set; }
    public int? StatOnDiscreteInputBit { get; set; }
    public DiscreteInput? StatOffDiscreteInput { get; set; }
    public int? StatOffDiscreteInputBit { get; set; }
    public DiscreteInput? StatOnReabDiscreteInput { get; set; }
    public int? StatOnReabDiscreteInputBit { get; set; }
    public DiscreteInput? StatOffReabDiscreteInput { get; set; }
    public int? StatOffReabDiscreteInputBit { get; set; }
    public DiscreteOutput? CmdOnDiscreteOutput { get; set; }
    public int? CmdOnDiscreteOutputBit { get; set; }
    public DiscreteOutput? CmdOffDiscreteOutput { get; set; }
    public int? CmdOffDiscreteOutputBit { get; set; }
}