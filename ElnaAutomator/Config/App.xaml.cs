using System.Collections.Generic;
using System.IO;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.Windows;
using ElnaAutomator.ConfigStructs;
using Microsoft.Win32;

namespace ElnaAutomator.Config;

/// <summary>
/// Interaction logic for App.xaml
/// </summary>
public partial class App : Application
{
    private List<DiscreteInput> _discreteInputs;
    private List<DiscreteOutput> _discreteOutputs;
    private List<SingleInput> _singleInputs;
    private List<SingleOutput> _singleOutputs;
    private List<AnalogSignalProtection> _analogSignalProtections;
    private List<DiscreteSignalProtection> _discreteSignalProtections;

    public App()
    {
        _discreteInputs = new List<DiscreteInput>();
        _discreteOutputs = new List<DiscreteOutput>();
        _singleInputs = new List<SingleInput>();
        _singleOutputs = new List<SingleOutput>();
        _analogSignalProtections = new List<AnalogSignalProtection>();
        _discreteSignalProtections = new List<DiscreteSignalProtection>();

        ChooseLocalConfigFile();
        MainWindow mainWindow = new();
        mainWindow.Show();
    }

    public List<DiscreteInput> GetDiscreteInputsConfig() => _discreteInputs;
    public List<DiscreteOutput> GetDiscreteOutputs() => _discreteOutputs;
    public List<SingleInput> GetSingleInputs() => _singleInputs;
    public List<SingleOutput> GetSingleOutputs() => _singleOutputs;
    public List<AnalogSignalProtection> GetAnalogSignalProtections() => _analogSignalProtections;
    public List<DiscreteSignalProtection> GetDiscreteSignalProtections() => _discreteSignalProtections;

    private void ChooseLocalConfigFile()
    {
        MessageBoxResult messageBoxResult =
            MessageBox.Show("Do you have a configuration file?", "Hello!", MessageBoxButton.YesNo);
        if (messageBoxResult != MessageBoxResult.Yes) return;

        OpenFileDialog openFileDialog = new()
        {
            Filter = "Excel Files (*.xls, *.xlsx)|*.xls;*.xlsx|Text Files (*.txt)|*.txt"
        };        
        
        if (openFileDialog.ShowDialog() != true) return;
        
        string extension = Path.GetExtension(openFileDialog.FileName);
        switch (extension)
        {
            case ".xls" or ".xlsx":
                CreateConfigByExcel();
                break;
            case ".txt":
                CreateConfigByTxt();
                break;
        }
    }

    private void CreateConfigByTxt()
    {
        //eshe ne pridumal;
    }

    private void CreateConfigByExcel()
    {
        //eshe ne pridumal;
    }
}