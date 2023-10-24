using System.Collections.Generic;
using System.IO;
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
    public List<DiscreteInput> DiscreteInputs;
    public List<DiscreteOutput> DiscreteOutputs;
    public List<SingleInput> SingleInputs;
    public List<SingleOutput> SingleOutputs;
    public List<AnalogSignalProtection> AnalogSignalProtections;
    public List<DiscreteSignalProtection> DiscreteSignalProtections;

    public App()
    {
        DiscreteInputs = new List<DiscreteInput>();
        DiscreteOutputs = new List<DiscreteOutput>();
        SingleInputs = new List<SingleInput>();
        SingleOutputs = new List<SingleOutput>();
        AnalogSignalProtections = new List<AnalogSignalProtection>();
        DiscreteSignalProtections = new List<DiscreteSignalProtection>();

        ChooseLocalConfigFile();
        MainWindow mainWindow = new();
        mainWindow.Show();
    }
    
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