namespace ElnaAutomator.Config.ConfigStructs;

abstract public class ExecutiveMechanism
{
    public required string Name {get; init; }
    public DiscreteInput? StatOnDiscreteInput { get; init; }
    public int? StatOnDiscreteInputBit { get; init; }
    public DiscreteInput? StatOffDiscreteInput { get; init; }
    public int? StatOffDiscreteInputBit { get; init; }
    public DiscreteInput? StatOnReabDiscreteInput { get; init; }
    public int? StatOnReabDiscreteInputBit { get; init; }
    public DiscreteInput? StatOffReabDiscreteInput { get; init; }
    public int? StatOffReabDiscreteInputBit { get; init; }
    public DiscreteOutput? CmdOnDiscreteOutput { get; init; }
    public int? CmdOnDiscreteOutputBit { get; init; }
    public DiscreteOutput? CmdOffDiscreteOutput { get; init; }
    public int? CmdOffDiscreteOutputBit { get; init; }
}