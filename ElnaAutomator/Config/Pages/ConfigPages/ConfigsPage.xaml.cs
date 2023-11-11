using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.ConfigPages;

public partial class ConfigsPage
{
    private readonly App? _currentApp;

    public ConfigsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
    }

    private void AnalogSignalsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            DataTypesGenerator.GenerateAiConfig(_currentApp.PathToProject, _currentApp.AnalogInputs);
    }

    private void DiscreteInputsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            DataTypesGenerator.GenerateDiConfig(_currentApp.PathToProject, _currentApp.DiscreteInputs);
    }

    private void DiscreteOutputsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            DataTypesGenerator.GenerateDoConfig(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
    }

    private void ProtectionsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            DataTypesGenerator.GenerateProtectionsConfig(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
    }
    private void ImConfig_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            DataTypesGenerator.GenerateImConfig(_currentApp.PathToProject,
                _currentApp.Krans,
                _currentApp.OilPumps,
                _currentApp.Switches,
                _currentApp.SectionSwitches);
    }
}