using System.Linq;
using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.ConfigPages;

public partial class ConfigsPage
{
    private readonly App _currentApp;

    public ConfigsPage()
    {
        InitializeComponent();
        _currentApp = (App)Application.Current;
    }

    private void AnalogSignalsConfig_OnClick(object sender, RoutedEventArgs e) =>
        DataTypesGenerator.GenerateAiConfig(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());

    private void DiscreteInputsConfig_OnClick(object sender, RoutedEventArgs e) =>
        DataTypesGenerator.GenerateDiConfig(_currentApp.PathToProject, _currentApp.DiscreteInputs);

    private void DiscreteOutputsConfig_OnClick(object sender, RoutedEventArgs e) =>
        DataTypesGenerator.GenerateDoConfig(_currentApp.PathToProject, _currentApp.DiscreteOutputs);

    private void ProtectionsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        DataTypesGenerator.GenerateProtectionsConfig(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);
    }

    private void ImConfig_OnClick(object sender, RoutedEventArgs e)
    {
        DataTypesGenerator.GenerateImConfig(_currentApp.PathToProject,
            _currentApp.Krans,
            _currentApp.OilPumps,
            _currentApp.Switches,
            _currentApp.SectionSwitches);
    }
}