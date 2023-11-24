using System.Collections.Generic;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.FileOperations;

/// <summary>
/// Переделка конфига в json и позже запись его
/// </summary>
public class ConfigJson
{
    public required List<AnalogInput> AnalogInputs { get; init; }
    public required List<DiscreteInput> DiscreteInputs { get; init; }
    public required List<DiscreteOutput> DiscreteOutputs { get; init; }
    public required List<SingleInput> SingleInputs { get; init; }
    public required List<SingleOutput> SingleOutputs { get; init; }
    public required List<AnalogSignalProtection> AnalogSignalProtections { get; init; }
    public required List<DiscreteSignalProtection> DiscreteSignalProtections { get; init; }
    public required List<Kran> Krans { get; init; }
    public required List<Switch> Switches { get; init; }
    public required List<OilPump> OilPumps { get; init; }
    public required List<SectionSwitch> SectionSwitches { get; init; }
}