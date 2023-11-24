namespace ElnaAutomator.Config.Signals;

abstract public class ExecutiveMechanism
{
    public required string Name {get; init; }
    public DiscreteInput? StatOnDiscreteInput { get; init; }
    public int? StatOnDiscreteInputBit { get; init; }
    public bool IsStatOnInversed { get; set; }
    public DiscreteInput? StatOffDiscreteInput { get; init; }
    public int? StatOffDiscreteInputBit { get; init; }
    public bool IsStatOffInversed { get; set; }
    public DiscreteOutput? CmdOnDiscreteOutput { get; init; }
    public int? CmdOnDiscreteOutputBit { get; init; }
    public DiscreteOutput? CmdOffDiscreteOutput { get; init; }
    public int? CmdOffDiscreteOutputBit { get; init; }
}