using System;
using System.Collections.Generic;
using System.Windows;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Signals;
using ElnaAutomator.Config.Windows;

namespace ElnaAutomator.Config;

public partial class App
{
    //сигналы
    public List<AnalogInput> AnalogInputs;
    public List<DiscreteInput> DiscreteInputs;
    public List<DiscreteOutput> DiscreteOutputs;
    public List<SingleInput> SingleInputs;
    public List<SingleOutput> SingleOutputs;
    public List<AnalogSignalProtection> AnalogSignalProtections;
    public List<DiscreteSignalProtection> DiscreteSignalProtections;
    public List<Kran> Krans;
    public List<OilPump> OilPumps;
    public List<Switch> Switches;
    public List<SectionSwitch> SectionSwitches;
    readonly public string PathToProject = null!;

    public App()
    {
        AnalogInputs = new List<AnalogInput>();
        DiscreteInputs = new List<DiscreteInput>();
        DiscreteOutputs = new List<DiscreteOutput>();
        SingleInputs = new List<SingleInput>();
        SingleOutputs = new List<SingleOutput>();
        AnalogSignalProtections = new List<AnalogSignalProtection>();
        DiscreteSignalProtections = new List<DiscreteSignalProtection>();
        Krans = new List<Kran>();
        OilPumps = new List<OilPump>();
        Switches = new List<Switch>();
        SectionSwitches = new List<SectionSwitch>();

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

    //Обработчик не обработанных исключений
    private void Application_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
    {
        MessageBox.Show($"{e.Exception.Message}", "Unhandled exception!");
        Console.WriteLine(e.Exception.ToString());
        e.Handled = true;
    }
}