using System;
using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class DataTypesPage
{
    private readonly App _currentApp;

    //инициализация
    public DataTypesPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
    }

    //вызов нужных генераторов по нажатию кнопок
    private async void AnalogSignalsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await DataTypesGenerator.GenerateAiConfigAsync(_currentApp.PathToProject, _currentApp.AnalogInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void DiscreteInputsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await DataTypesGenerator.GenerateDiConfigAsync(_currentApp.PathToProject, _currentApp.DiscreteInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void DiscreteOutputsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await DataTypesGenerator.GenerateDoConfigAsync(_currentApp.PathToProject, _currentApp.DiscreteOutputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ProtectionsConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await DataTypesGenerator.GenerateProtectionsConfigAsync(_currentApp.PathToProject,
                _currentApp.AnalogSignalProtections,
                _currentApp.DiscreteSignalProtections);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void ImConfig_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await DataTypesGenerator.GenerateImConfigAsync(_currentApp.PathToProject,
                _currentApp.Krans,
                _currentApp.OilPumps,
                _currentApp.Switches,
                _currentApp.SectionSwitches);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void SingleOutput_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await DataTypesGenerator.GenerateImSingleOutputsAsync(_currentApp.PathToProject, _currentApp.SingleOutputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }

    private async void SingleInput_OnClick(object sender, RoutedEventArgs e)
    {
        try
        {
            await DataTypesGenerator.GenerateImSingleSignalsAsync(_currentApp.PathToProject, _currentApp.SingleInputs);
            MessageBox.Show("Success");
        }
        catch (Exception ex)
        {
            MessageBox.Show($"{ex.Message}", "Error!");
        }
    }
}