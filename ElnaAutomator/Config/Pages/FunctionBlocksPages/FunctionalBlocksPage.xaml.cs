using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionBlocksPages;

public partial class FunctionalBlocksPage
{
    private readonly App _currentApp;

    //инициализация
    public FunctionalBlocksPage()
    {
        _currentApp = (App) Application.Current;

        InitializeComponent();
    }

    //вызов нужного генератора по нажатию кнопок
    private void ProcAiInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcAiInit(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcAi_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcAi(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcDi_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcDi(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcDiInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcDiInit(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcDo_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcDo(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcDoInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcDoInit(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcIm_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            FunctionBlocksGenerator.GenerateProcIm(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs, _currentApp.SingleOutputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcImInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            FunctionBlocksGenerator.GenerateProcImInit(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs, _currentApp.SingleOutputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcProtections(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProcProtectionsInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateProcProtectionsInit(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void OpcAiGet_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.GenerateOpcAiGet(_currentApp.PathToProject, _currentApp.AnalogInputs);
            FunctionBlocksGenerator.GenerateOpcAiSet(_currentApp.PathToProject, _currentApp.AnalogInputs);
            FunctionBlocksGenerator.GenerateOpcAiInit(_currentApp.PathToProject, _currentApp.AnalogInputs);

            ExcelWork.CreateOpcAiTags(_currentApp.PathToProject, _currentApp.AnalogInputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void OpcImGet_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            FunctionBlocksGenerator.CreateOpcImGet(_currentApp.PathToProject, executiveMechanisms);
            FunctionBlocksGenerator.CreateOpcImSet(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs);

            ExcelWork.CreateOpcImTags(_currentApp.PathToProject, _currentApp.SingleInputs, executiveMechanisms);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void OpcProtectionsGet_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionBlocksGenerator.CreateOpcProtectionsSet(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
            FunctionBlocksGenerator.CreateOpcProtectionsGet(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);

            ExcelWork.CreateOpcProtectionsTags(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }
}