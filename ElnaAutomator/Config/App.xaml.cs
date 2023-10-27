using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.Windows;
using Microsoft.Win32;

namespace ElnaAutomator.Config;

/// <summary>
/// Interaction logic for App.xaml
/// </summary>
public partial class App : Application
{
    public List<AnalogInput> AnalogInputs;
    public List<DiscreteInput> DiscreteInputs;
    public List<DiscreteOutput> DiscreteOutputs;
    public List<SingleInput> SingleInputs;
    public List<SingleOutput> SingleOutputs;
    public List<AnalogSignalProtection> AnalogSignalProtections;
    public List<DiscreteSignalProtection> DiscreteSignalProtections;
    public List<ExecutiveMechanism> ExecutiveMechanisms;

    public App()
    {
        AnalogInputs = new List<AnalogInput>()
        {
            new AnalogInput { Name = "A1", HighLimit = 100, LowLimit = 0, HighAlarm = 90, LowAlarm = 10, HighWarning = 80, LowWarning = 20 }
        };
        DiscreteInputs = new List<DiscreteInput>(){new DiscreteInput{Name = "Di1"}};
        DiscreteOutputs = new List<DiscreteOutput>() { new DiscreteOutput { Name = "Do1" } };
        SingleInputs = new List<SingleInput>(){new SingleInput{Name = "Di1"}};
        SingleOutputs = new List<SingleOutput>(){new DiscreteInput{Name = "Di1"};
        AnalogSignalProtections = new List<AnalogSignalProtection>(){new DiscreteInput{Name = "Di1"};
        DiscreteSignalProtections = new List<DiscreteSignalProtection>(){new DiscreteInput{Name = "Di1"};

        ChooseLocalConfigDirectory();
        MainWindow mainWindow = new();
        mainWindow.Show();
    }
    
    private void ChooseLocalConfigDirectory()
    {
        var messageBoxResult =
            MessageBox.Show("Do you have a configuration file?", "Hello!", MessageBoxButton.YesNo);
        if (messageBoxResult != MessageBoxResult.Yes) return;

        OpenFileDialog openFileDialog = new()
        {
            Filter = "Excel Files (*.xls, *.xlsx)|*.xls;*.xlsx|Text Files (*.txt)|*.txt"
        };        
        
        if (openFileDialog.ShowDialog() != true) return;
        
        var extension = Path.GetExtension(openFileDialog.FileName);
        var path = Path.GetFullPath(openFileDialog.FileName);
        
        switch (extension)
        {
            case ".xls" or ".xlsx":
                CreateConfigByExcel();
                break;
            case ".txt":
                CreateConfigByTxt(path);
                break;
        }
    }

    private void CreateConfigByTxt(string path)
    {
        try
        {
            var data = File.ReadAllText(path);

            var json = JsonSerializer.Deserialize<ConfigJson>(data);

            AnalogInputs = json.AnalogInputs;
            AnalogSignalProtections = json.AnalogSignalProtections;
            DiscreteInputs = json.DiscreteInputs;
            DiscreteOutputs = json.DiscreteOutputs;
            DiscreteSignalProtections = json.DiscreteSignalProtections;
            ExecutiveMechanisms = json.ExecutiveMechanisms;
            SingleInputs = json.SingleInputs;
            SingleOutputs = json.SingleOutputs;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception by trying to read config from file {ex.Message}");
        }
    }

    public void WriteConfigToTxt(string path)
    {
        var json = new ConfigJson
        {
            AnalogInputs = AnalogInputs,
            AnalogSignalProtections = AnalogSignalProtections,
            DiscreteInputs = DiscreteInputs,
            DiscreteOutputs = DiscreteOutputs,
            DiscreteSignalProtections = DiscreteSignalProtections,
            ExecutiveMechanisms = ExecutiveMechanisms,
            SingleInputs = SingleInputs,
            SingleOutputs = SingleOutputs
        };

        var data = JsonSerializer.Serialize(json);

        try
        {
            File.WriteAllText(path, data);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error trying write config to file {ex.Message}");
        }
    }

    private void CreateConfigByExcel()
    {
        
    }
}