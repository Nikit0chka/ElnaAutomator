using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionsPage;

public partial class FunctionsPage
{
    private readonly App? _currentApp;

    public FunctionsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
    }

    private void AnyAnalogPs_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAnyAnalogPs(_currentApp.PathToProject, _currentApp.AnalogInputs);
    }

    private void AnyAnalogNs_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAnyAnalogNs(_currentApp.PathToProject, _currentApp.AnalogInputs);
    }

    private void AnyDiscretePs_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAnyDiscretePs(_currentApp.PathToProject, _currentApp.DiscreteInputs);
    }

    private void AnyProtectionInRemont_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAnyProtectionRemont(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
    }

    private void AnyProtectionSignaling_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAnyProtectionSignalling(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
    }

    private void AutoRunProtections_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAutoRunProtections(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
    }

    private void BlockAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateBlockAllProtections(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
    }

    private void DisableAiLimits_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateDisableAiLimits(_currentApp.PathToProject, _currentApp.AnalogInputs);
    }

    private void AnyDiscreteNs_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAnyDiscreteNs(_currentApp.PathToProject, _currentApp.DiscreteInputs);
    }

    private void EnableAiLimits_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateEnableAiLimits(_currentApp.PathToProject, _currentApp.AnalogInputs);
    }

    private void RemontAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateRemontAllProtections(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
    }

    private void ResetAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetAllProtections(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
    }

    private void ResetAllSignalling_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetAllSignalling(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
    }
}