using System;
using System.Collections.Generic;
using System.Windows;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Generators;
using ElnaAutomator.Config.Signals;

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
    private async void ProcAiInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcAiInitAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcAi_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcAiAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcDi_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcDiAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcDiInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcDiInitAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcDo_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcDoAsync(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcDoInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcDoInitAsync(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcIm_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            await FunctionBlocksGenerator.GenerateProcImAsync(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs, _currentApp.SingleOutputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcImInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            await FunctionBlocksGenerator.GenerateProcImInitAsync(_currentApp.PathToProject,
                executiveMechanisms,
                _currentApp.SingleInputs,
                _currentApp.SingleOutputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcProtectionsAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProcProtectionsInit_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateProcProtectionsInitAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void OpcAiGet_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.GenerateOpcAiGetAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            await FunctionBlocksGenerator.GenerateOpcAiSetAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            await FunctionBlocksGenerator.GenerateOpcAiInitAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);

            ExcelWork.CreateOpcAiTags(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void OpcImGet_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            await FunctionBlocksGenerator.CreateOpcImGetAsync(_currentApp.PathToProject, executiveMechanisms);
            await FunctionBlocksGenerator.CreateOpcImSetAsync(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs);

            ExcelWork.CreateOpcImTags(_currentApp.PathToProject, _currentApp.SingleInputs, executiveMechanisms);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void OpcProtectionsGet_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionBlocksGenerator.CreateOpcProtectionsSetAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            await FunctionBlocksGenerator.CreateOpcProtectionsGetAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);

            ExcelWork.CreateOpcProtectionsTags(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }
}