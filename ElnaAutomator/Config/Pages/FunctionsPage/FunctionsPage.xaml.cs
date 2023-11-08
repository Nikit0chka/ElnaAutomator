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

    private void UnBlockAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateUnBlockAllProtections(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
    }
    private void AskQuestion_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAskQuestion(_currentApp.PathToProject);
    }
    private void ImpulseSo_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateImpulseSo(_currentApp.PathToProject);
    }
    private void ResetAiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetAiProtection(_currentApp.PathToProject);
    }
    private void ResetAndDisable_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetAndDisable(_currentApp.PathToProject);
    }
    private void ResetDiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetDiProtection(_currentApp.PathToProject);
    }
    private void ResetIfRunning_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetIfRunning(_currentApp.PathToProject);
    }
    private void ResetIfRunningSo_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetIfRunningSo(_currentApp.PathToProject);
    }
    private void ResetPhase_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetPhase(_currentApp.PathToProject);
    }
    private void ResetQuestion_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateResetQuestion(_currentApp.PathToProject);
    }
    private void RunAiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateRunAiProtection(_currentApp.PathToProject);
    }
    private void RunDiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateRunDiProtection(_currentApp.PathToProject);
    }
    private void RunIfNotRunning_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateRunIfNotRunning(_currentApp.PathToProject);
    }
    private void RunIfNotRunningSo_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateRunIfNotRunningSo(_currentApp.PathToProject);
    }
    private void RunPhase_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateRunPhase(_currentApp.PathToProject);
    }
    private void TwoUint_To_UDINT_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateTwoUintToUdint(_currentApp.PathToProject);
    }
}