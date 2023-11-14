using System.Linq;
using System.Text.Json.Serialization;
using System.Windows;

namespace ElnaAutomator.Config.ConfigStructs;

public class DiscreteSignalProtection
{
    [JsonIgnore] private readonly App _currentApp = (App) Application.Current;
    public required string Name{ get; init; }
    
    public string? SingleInputName { get; set; }
    public SingleInput? SingleInput { get => _currentApp.SingleInputs.FirstOrDefault(signal => signal.Name == SingleInputName);
        set => SingleInputName = value?.Name; }
    public required bool IsOnLimitProtection { get; set; }
}