using System;
using System.Collections.Generic;
using System.Windows;
using ElnaAutomator.Config.Generators;
using ElnaAutomator.Config.Signals;

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
    private async void AnyAnalogPs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateAnyAnalogPsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void AnyAnalogNs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateAnyAnalogsNsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void AnyDiscretePs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateAnyDiscretePsAsync(_currentApp.PathToProject, _currentApp.SingleInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void AnyProtectionInRemont_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateAnyProtectionRemontAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void AnyProtectionSignaling_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateAnyProtectionSignallingAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void AutoRunProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateAutoRunProtectionsAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void BlockAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateBlockAllProtectionsAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void DisableAiLimits_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateDisableAiLimitsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void AnyDiscreteNs_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateAnyDiscreteNsAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void EnableAiLimits_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateEnableAiLimitsAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void RemontAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateRemontAllProtectionsAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ResetAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateResetAllProtectionsAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ResetAllSignalling_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateResetAllSignallingAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void UnBlockAllProtections_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await FunctionsGenerator.GenerateUnBlockAllProtectionsAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void BlockAllIm_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            await FunctionsGenerator.GenerateBlockAllImAsync(_currentApp.PathToProject, executiveMechanisms);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void NsCepeiControl_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            await FunctionsGenerator.GenerateNsCepeiControlAsync(_currentApp.PathToProject, executiveMechanisms);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void NsCepeiUpravlenya_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            await FunctionsGenerator.GenerateNsCepeiUpravlenyaAsync(_currentApp.PathToProject, executiveMechanisms);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void UnBlockAllIm_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            List<ExecutiveMechanism> executiveMechanisms = new();
            executiveMechanisms.AddRange(_currentApp.Krans);
            executiveMechanisms.AddRange(_currentApp.OilPumps);
            executiveMechanisms.AddRange(_currentApp.Switches);
            executiveMechanisms.AddRange(_currentApp.SectionSwitches);

            await FunctionsGenerator.GenerateUnBlockAllImAsync(_currentApp.PathToProject, executiveMechanisms);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }
}