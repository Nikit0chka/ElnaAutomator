using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionsPage;

public partial class FunctionsPage
{
    private readonly App _currentApp;

    //инициализация
    public FunctionsPage()
    {
        _currentApp = (App) Application.Current;

        InitializeComponent();
    }

    //вызов нужного генератора по нажатию кнопок
    private void AnyAnalogPs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateAnyAnalogPs(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void AnyAnalogNs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateAnyAnalogNs(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void AnyDiscretePs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateAnyDiscretePs(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void AnyProtectionInRemont_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateAnyProtectionRemont(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void AnyProtectionSignaling_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateAnyProtectionSignalling(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void AutoRunProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateAutoRunProtections(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void BlockAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateBlockAllProtections(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void DisableAiLimits_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateDisableAiLimits(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void AnyDiscreteNs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateAnyDiscreteNs(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void EnableAiLimits_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateEnableAiLimits(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void RemontAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateRemontAllProtections(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ResetAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateResetAllProtections(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ResetAllSignalling_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateResetAllSignalling(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void UnBlockAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            FunctionsGenerator.GenerateUnBlockAllProtections(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void BlockAllIm_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            FunctionsGenerator.GenerateBlockAllIm(_currentApp.PathToProject, executiveMechanisms);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void NsCepeiControl_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            FunctionsGenerator.GenerateNsCepeiControl(_currentApp.PathToProject, executiveMechanisms);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void NsCepeiUpravlenya_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            FunctionsGenerator.GenerateNsCepeiUpravlenya(_currentApp.PathToProject, executiveMechanisms);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void UnBlockAllIm_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            FunctionsGenerator.GenerateUnBlockAllIm(_currentApp.PathToProject, executiveMechanisms);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }
}