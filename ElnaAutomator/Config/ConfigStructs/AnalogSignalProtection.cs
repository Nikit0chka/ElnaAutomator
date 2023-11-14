using System.Linq;
using System.Text.Json.Serialization;
using System.Windows;

namespace ElnaAutomator.Config.ConfigStructs;

public class AnalogSignalProtection
{
    [JsonIgnore] private readonly App _currentApp = (App) Application.Current;
    public required string Name { get; init; }
    public string? AnalogInputName { get; set; }

    [JsonIgnore]
    public AnalogInput? AnalogInput
    {
        get => _currentApp.AnalogInputs.FirstOrDefault(ai => ai.Name == Name);
        set => AnalogInputName = value?.Name;
    }

    public required bool IsUpperLimitProtection { get; set; }
}