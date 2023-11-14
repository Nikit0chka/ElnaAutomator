using System.Collections.Generic;
using System.Linq;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionsPage;

public partial class FunctionsPage
{
    private readonly App _currentApp;

    public FunctionsPage()
    {
        InitializeComponent();
        _currentApp = (App)Application.Current;
    }

    private void AnyAnalogPs_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAnyAnalogPs(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());

    private void AnyAnalogNs_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAnyAnalogNs(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());

    private void AnyDiscretePs_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAnyDiscretePs(_currentApp.PathToProject, _currentApp.DiscreteInputs);

    private void AnyProtectionInRemont_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAnyProtectionRemont(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void AnyProtectionSignaling_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAnyProtectionSignalling(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void AutoRunProtections_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAutoRunProtections(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void BlockAllProtections_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateBlockAllProtections(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void DisableAiLimits_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateDisableAiLimits(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());

    private void AnyDiscreteNs_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAnyDiscreteNs(_currentApp.PathToProject, _currentApp.DiscreteInputs);

    private void EnableAiLimits_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateEnableAiLimits(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());

    private void RemontAllProtections_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateRemontAllProtections(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void ResetAllProtections_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetAllProtections(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void ResetAllSignalling_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetAllSignalling(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void UnBlockAllProtections_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateUnBlockAllProtections(_currentApp.PathToProject,
            _currentApp.AnalogSignalProtections,
            _currentApp.DiscreteSignalProtections);

    private void AskQuestion_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateAskQuestion(_currentApp.PathToProject);

    private void ImpulseSo_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateImpulseSo(_currentApp.PathToProject);

    private void ResetAiProtection_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetAiProtection(_currentApp.PathToProject);

    private void ResetAndDisable_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetAndDisable(_currentApp.PathToProject);

    private void ResetDiProtection_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetDiProtection(_currentApp.PathToProject);

    private void ResetIfRunning_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetIfRunning(_currentApp.PathToProject);

    private void ResetIfRunningSo_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetIfRunningSo(_currentApp.PathToProject);

    private void ResetPhase_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetPhase(_currentApp.PathToProject);

    private void ResetQuestion_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateResetQuestion(_currentApp.PathToProject);

    private void RunAiProtection_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateRunAiProtection(_currentApp.PathToProject);

    private void RunDiProtection_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateRunDiProtection(_currentApp.PathToProject);

    private void RunIfNotRunning_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateRunIfNotRunning(_currentApp.PathToProject);

    private void RunIfNotRunningSo_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateRunIfNotRunningSo(_currentApp.PathToProject);

    private void RunPhase_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateRunPhase(_currentApp.PathToProject);

    private void TwoUint_To_UDINT_OnClick(object sender, RoutedEventArgs e) =>
        FunctionsGenerator.GenerateTwoUintToUdint(_currentApp.PathToProject);

    private void BlockAllIm_OnClick(object sender, RoutedEventArgs e)
    {
        List<ExecutiveMechanism> executiveMechanisms = new();
        executiveMechanisms.AddRange(_currentApp.Krans);
        executiveMechanisms.AddRange(_currentApp.OilPumps);
        executiveMechanisms.AddRange(_currentApp.Switches);
        executiveMechanisms.AddRange(_currentApp.SectionSwitches);

        FunctionsGenerator.GenerateBlockAllIm(_currentApp.PathToProject, executiveMechanisms);
    }

    private void NsCepeiControl_OnClick(object sender, RoutedEventArgs e)
    {
        List<ExecutiveMechanism> executiveMechanisms = new();
        executiveMechanisms.AddRange(_currentApp.Krans);
        executiveMechanisms.AddRange(_currentApp.OilPumps);
        executiveMechanisms.AddRange(_currentApp.Switches);
        executiveMechanisms.AddRange(_currentApp.SectionSwitches);

        FunctionsGenerator.GenerateNsCepeiControl(_currentApp.PathToProject, executiveMechanisms);
    }

    private void NsCepeiUpravlenya_OnClick(object sender, RoutedEventArgs e)
    {
        List<ExecutiveMechanism> executiveMechanisms = new();
        executiveMechanisms.AddRange(_currentApp.Krans);
        executiveMechanisms.AddRange(_currentApp.OilPumps);
        executiveMechanisms.AddRange(_currentApp.Switches);
        executiveMechanisms.AddRange(_currentApp.SectionSwitches);

        FunctionsGenerator.GenerateNsCepeiUpravlenya(_currentApp.PathToProject, executiveMechanisms);
    }

    private void UnBlockAllIm_OnClick(object sender, RoutedEventArgs e)
    {
        List<ExecutiveMechanism> executiveMechanisms = new();
        executiveMechanisms.AddRange(_currentApp.Krans);
        executiveMechanisms.AddRange(_currentApp.OilPumps);
        executiveMechanisms.AddRange(_currentApp.Switches);
        executiveMechanisms.AddRange(_currentApp.SectionSwitches);

        FunctionsGenerator.GenerateUnBlockAllIm(_currentApp.PathToProject, executiveMechanisms);
    }
}