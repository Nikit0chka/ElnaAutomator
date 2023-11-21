using System;
using System.Linq;
using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.ConfigPages;

public partial class ConfigsPage
{
    private readonly App _currentApp;

    //инициализация
    public ConfigsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
    }

    //вызов нужных генераторов по нажатию кнопок
    private void AnalogSignalsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            DataTypesGenerator.GenerateAiConfig(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void DiscreteInputsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            DataTypesGenerator.GenerateDiConfig(_currentApp.PathToProject, _currentApp.DiscreteInputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void DiscreteOutputsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            DataTypesGenerator.GenerateDoConfig(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ProtectionsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            DataTypesGenerator.GenerateProtectionsConfig(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void ImConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            DataTypesGenerator.GenerateImConfig(_currentApp.PathToProject,
                _currentApp.Krans,
                _currentApp.OilPumps,
                _currentApp.Switches,
                _currentApp.SectionSwitches);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void SingleOutput_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            DataTypesGenerator.GenerateImSingleOutputs(_currentApp.PathToProject, _currentApp.SingleOutputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }

    private void SingleInput_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            DataTypesGenerator.GenerateImSingleSignals(_currentApp.PathToProject, _currentApp.SingleInputs);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex}", "Error!");
        }
    }
}