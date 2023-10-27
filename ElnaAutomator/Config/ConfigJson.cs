using System.Collections.Generic;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Windows;

/// <summary>
/// Logic for writing/reading config from json
/// </summary>
public class ConfigJson
{
    public required List<AnalogInput> AnalogInputs { get; set; }
    public required List<AnalogSignalProtection> AnalogSignalProtections { get; set; }
    public required List<DiscreteInput> DiscreteInputs { get; set; }
    public required List<DiscreteOutput> DiscreteOutputs { get; set; }
    public required List<DiscreteSignalProtection> DiscreteSignalProtections { get; set; }
    public required List<ExecutiveMechanism> ExecutiveMechanisms { get; set; }
    public required List<SingleInput> SingleInputs { get; set; }
    public required List<SingleOutput> SingleOutputs { get; set; }
}