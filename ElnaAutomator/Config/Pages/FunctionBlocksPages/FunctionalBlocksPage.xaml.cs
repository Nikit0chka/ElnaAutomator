using System.Collections.Generic;
using System.Linq;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionBlocksPages;

public partial class FunctionalBlocksPage
{
    private readonly App _currentApp;

    public FunctionalBlocksPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
    }

    private void ProcAiInit_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcAiInit(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());

    private void ProcAi_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcAi(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
    private void ProcDi_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcDi(_currentApp.PathToProject, _currentApp.DiscreteInputs);
    private void ProcDiInit_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcDiInit(_currentApp.PathToProject, _currentApp.DiscreteInputs);
    private void ProcDo_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcDo(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
    private void ProcDoInit_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcDoInit(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
    private void ProcIm_OnClick(object sender, RoutedEventArgs e)
    {
        List<ExecutiveMechanism> executiveMechanisms = new();
        executiveMechanisms.AddRange(_currentApp.Krans);
        executiveMechanisms.AddRange(_currentApp.OilPumps);
        executiveMechanisms.AddRange(_currentApp.Switches);
        executiveMechanisms.AddRange(_currentApp.SectionSwitches);

        FunctionBlocksGenerator.GenerateProcIm(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs, _currentApp.SingleOutputs);
    }
    private void ProcImInit_OnClick(object sender, RoutedEventArgs e)
    {
        List<ExecutiveMechanism> executiveMechanisms = new();
        executiveMechanisms.AddRange(_currentApp.Krans);
        executiveMechanisms.AddRange(_currentApp.OilPumps);
        executiveMechanisms.AddRange(_currentApp.Switches);
        executiveMechanisms.AddRange(_currentApp.SectionSwitches);

        FunctionBlocksGenerator.GenerateProcImInit(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs, _currentApp.SingleOutputs);
    }
    private void ProcProtections_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcProtections(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
    private void ProcProtectionsInit_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcProtectionsInit(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
}