using System;
using System.Collections.Generic;
using System.Windows;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Generators;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Windows;

public partial class GeneratorChooseWindow
{
    private readonly App _currentApp;

    public GeneratorChooseWindow()
    {
        _currentApp = (App) Application.Current;
        InitializeComponent();
    }

    private async void GenerateButton_OnClick(object sender, RoutedEventArgs e)
    {
        var error = string.Empty;

        if (AiConfigCheckBox.IsChecked ?? false)
            try
            {
                await DataTypesGenerator.GenerateAiConfigAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            }
            catch (Exception ex)
            {
                error += ex;
            }

        try
        {
            if (DiConfigCheckBox.IsChecked ?? false)
                await DataTypesGenerator.GenerateDiConfigAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (DoConfigCheckBox.IsChecked ?? false)
                await DataTypesGenerator.GenerateDoConfigAsync(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ImConfigCheckBox.IsChecked ?? false)
                await DataTypesGenerator.GenerateImConfigAsync(_currentApp.PathToProject,
                    _currentApp.Krans,
                    _currentApp.OilPumps,
                    _currentApp.Switches,
                    _currentApp.SectionSwitches);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (SingleOutputCheckBox.IsChecked ?? false)
                await DataTypesGenerator.GenerateImSingleOutputsAsync(_currentApp.PathToProject, _currentApp.SingleOutputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (SingleInputCheckBox.IsChecked ?? false)
                await DataTypesGenerator.GenerateImSingleSignalsAsync(_currentApp.PathToProject, _currentApp.SingleInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProtectionsConfigCheckBox.IsChecked ?? false)
            {
                await DataTypesGenerator.GenerateProtectionsConfigAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);

                ExcelWork.CreateOpcProtectionsTags(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (AnyAnalogNsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateAnyAnalogsNsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (AnyAnalogPsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateAnyAnalogPsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (DisableAiLimitsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateDisableAiLimitsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (EnableAiLimitsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateEnableAiLimitsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (AnyDiscretePsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateAnyDiscretePsAsync(_currentApp.PathToProject, _currentApp.SingleInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (AnyDiscretNsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateAnyDiscreteNsAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (RemontAllProtectionsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateRemontAllProtectionsAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (AnyProtectionInRemontCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateAnyProtectionRemontAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (AnyProtectionSignallingCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateAnyProtectionSignallingAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (AutoRunProtectionsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateAutoRunProtectionsAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (UnblockAllProtectionsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateUnBlockAllProtectionsAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (BlockAllProtectionsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateBlockAllProtectionsAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ResetAllProtectionsCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateResetAllProtectionsAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (BlockAllImCheckBox.IsChecked ?? false)
            {
                List<ExecutiveMechanism> executiveMechanisms = new();
                executiveMechanisms.AddRange(_currentApp.Krans);
                executiveMechanisms.AddRange(_currentApp.OilPumps);
                executiveMechanisms.AddRange(_currentApp.Switches);
                executiveMechanisms.AddRange(_currentApp.SectionSwitches);

                await FunctionsGenerator.GenerateBlockAllImAsync(_currentApp.PathToProject,
                    executiveMechanisms);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (UnBlockAllImCheckBox.IsChecked ?? false)
            {
                List<ExecutiveMechanism> executiveMechanisms = new();
                executiveMechanisms.AddRange(_currentApp.Krans);
                executiveMechanisms.AddRange(_currentApp.OilPumps);
                executiveMechanisms.AddRange(_currentApp.Switches);
                executiveMechanisms.AddRange(_currentApp.SectionSwitches);

                await FunctionsGenerator.GenerateUnBlockAllImAsync(_currentApp.PathToProject,
                    executiveMechanisms);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (NsCepeiControlCheckBox.IsChecked ?? false)
            {
                List<ExecutiveMechanism> executiveMechanisms = new();
                executiveMechanisms.AddRange(_currentApp.Krans);
                executiveMechanisms.AddRange(_currentApp.OilPumps);
                executiveMechanisms.AddRange(_currentApp.Switches);
                executiveMechanisms.AddRange(_currentApp.SectionSwitches);

                await FunctionsGenerator.GenerateNsCepeiControlAsync(_currentApp.PathToProject,
                    executiveMechanisms);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (NsCepeiUpravlenyaCheckBox.IsChecked ?? false)
            {
                List<ExecutiveMechanism> executiveMechanisms = new();
                executiveMechanisms.AddRange(_currentApp.Krans);
                executiveMechanisms.AddRange(_currentApp.OilPumps);
                executiveMechanisms.AddRange(_currentApp.Switches);
                executiveMechanisms.AddRange(_currentApp.SectionSwitches);

                await FunctionsGenerator.GenerateNsCepeiUpravlenyaAsync(_currentApp.PathToProject,
                    executiveMechanisms);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ResetAllSignallingCheckBox.IsChecked ?? false)
                await FunctionsGenerator.GenerateResetAllSignallingAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcAiInitCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcAiInitAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcAiCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcAiAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcDiInitCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcDiInitAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcDiCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcDiAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcDoCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcDoAsync(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcDoInitCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcDoInitAsync(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcImCheckBox.IsChecked ?? false)
            {
                List<ExecutiveMechanism> executiveMechanisms = new();
                executiveMechanisms.AddRange(_currentApp.Krans);
                executiveMechanisms.AddRange(_currentApp.OilPumps);
                executiveMechanisms.AddRange(_currentApp.Switches);
                executiveMechanisms.AddRange(_currentApp.SectionSwitches);

                await FunctionBlocksGenerator.GenerateProcImAsync(_currentApp.PathToProject,
                    executiveMechanisms,
                    _currentApp.SingleInputs,
                    _currentApp.SingleOutputs);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcImInitCheckBox.IsChecked ?? false)
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
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcProtectionsCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcProtectionsAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (ProcProtectionsInitCheckBox.IsChecked ?? false)
                await FunctionBlocksGenerator.GenerateProcProtectionsInitAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (OpcAiCheckBox.IsChecked ?? false)
            {
                await FunctionBlocksGenerator.GenerateOpcAiGetAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
                await FunctionBlocksGenerator.GenerateOpcAiSetAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
                await FunctionBlocksGenerator.GenerateOpcAiInitAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);

                ExcelWork.CreateOpcAiTags(_currentApp.PathToProject, _currentApp.AnalogInputs);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (OpcImCheckBox.IsChecked ?? false)
            {
                List<ExecutiveMechanism> executiveMechanisms = new();
                executiveMechanisms.AddRange(_currentApp.Krans);
                executiveMechanisms.AddRange(_currentApp.OilPumps);
                executiveMechanisms.AddRange(_currentApp.Switches);
                executiveMechanisms.AddRange(_currentApp.SectionSwitches);

                await FunctionBlocksGenerator.CreateOpcImGetAsync(_currentApp.PathToProject, executiveMechanisms);
                await FunctionBlocksGenerator.CreateOpcImSetAsync(_currentApp.PathToProject, executiveMechanisms, _currentApp.SingleInputs);

                ExcelWork.CreateOpcImTags(_currentApp.PathToProject, _currentApp.SingleInputs, executiveMechanisms);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        try
        {
            if (OpcProtectionsCheckBox.IsChecked ?? false)
            {
                await FunctionBlocksGenerator.CreateOpcProtectionsSetAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);
                await FunctionBlocksGenerator.CreateOpcProtectionsGetAsync(_currentApp.PathToProject,
                    _currentApp.AnalogSignalProtections,
                    _currentApp.DiscreteSignalProtections);

                ExcelWork.CreateOpcProtectionsTags(_currentApp.PathToProject, _currentApp.AnalogSignalProtections, _currentApp.DiscreteSignalProtections);
            }
        }
        catch (Exception ex)
        {
            error += ex;
        }

        MessageBox.Show(error != string.Empty? error : "Success");
    }
}