using System;
using System.Collections.Generic;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Windows;

namespace ElnaAutomator.Config;

/// <summary>
/// Interaction logic for App.xaml
/// </summary>
public partial class App
{
    //сигналы
    public List<AnalogInput> AnalogInputs = null!;
    public List<DiscreteInput> DiscreteInputs = null!;
    public List<DiscreteOutput> DiscreteOutputs = null!;
    public List<SingleInput> SingleInputs = null!;
    public List<SingleOutput> SingleOutputs = null!;
    public List<AnalogSignalProtection> AnalogSignalProtections = null!;
    public List<DiscreteSignalProtection> DiscreteSignalProtections = null!;
    public List<Kran> Krans = null!;
    public List<OilPump> OilPumps = null!;
    public List<Switch> Switches = null!;
    public List<SectionSwitch> SectionSwitches = null!;
    readonly public string PathToProject = null!;

    public App()
    {
        //чтение конфига, создание нужных папок
        try
        {
            PathToProject = FileWork.GetLocalConfigDirectory();
            FileWork.ReadConfig(PathToProject);
            FileWork.CreateFoldersIfNotExist(PathToProject);
        }
        //в случае ошибки - останов приложения
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message);
            Current.Shutdown();
            return;
        }
        //октрытие основного окна
        MainWindow mainWindow = new();
        mainWindow.Show();
    }
}