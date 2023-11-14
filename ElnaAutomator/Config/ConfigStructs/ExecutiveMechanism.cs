namespace ElnaAutomator.Config.ConfigStructs;

abstract public class ExecutiveMechanism
{
    public required string Name {get; set; }
    public DiscreteInput? StatOnDiscreteInput { get; set; }
    public int? StatOnDiscreteInputBit { get; set; }
    public DiscreteInput? StatOffDiscreteInput { get; set; }
    public int? StatOffDiscreteInputBit { get; set; }
    public DiscreteInput? InSoDiscreteInput { get; set; }
    public int? InSoDiscreteInputBit { get; set; }
    public DiscreteInput? InSzDiscreteInput { get; set; }
    public int? InSzDiscreteInputBit { get; set; }
    public DiscreteOutput? CmdOnDiscreteOutput { get; set; }
    public int? CmdOnDiscreteOutputBit { get; set; }
    public DiscreteOutput? CmdOffDiscreteOutput { get; set; }
    public int? CmdOffDiscreteOutputBit { get; set; }
}