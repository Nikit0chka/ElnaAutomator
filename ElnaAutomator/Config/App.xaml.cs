using System;
using System.Collections.Generic;
using System.Windows;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.Windows;

namespace ElnaAutomator.Config;

/// <summary>
/// Interaction logic for App.xaml
/// </summary>
public partial class App
{
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
    readonly public string PathToProject;

    public App()
    {
        PathToProject = "";
        
var ai = new AnalogInput
        {
            Name = "A1", HighLimit = 100, LowLimit = 0, HighAlarm = 90,
            LowAlarm = 10, HighWarning = 80, LowWarning = 20, ModuleName = "A",
            Address = 0, ModuleAddress = 0
        };
        var ai2 = new AnalogInput
        {
            Name = "A2", HighLimit = 100, LowLimit = 0, HighAlarm = 90,
            LowAlarm = 10, HighWarning = 80, LowWarning = 20, ModuleName = "A",
            Address = 0, ModuleAddress = 0
        };
        var di = new DiscreteInput
        {
            Name = "Di"
        };
        
        var do1 = new DiscreteOutput
        {
            Name = "Do1"
        };
        
        var singleInput = new SingleInput
        {
            Name = "SingleInput", DiscreteInput = di
        };
        
        var singleOutput = new SingleOutput
        {
            Name = "SingleOutput", DigitalOutput = do1
        };
        
        var analogSignalProtection = new AnalogSignalProtection
        {
            AnalogInput = ai, AnalogInputName = "A1", IsUpperLimitProtection = false, Name = "Ap1"
        };
        
        var discreteSignalProtection = new DiscreteSignalProtection
        {
            IsOnLimitProtection = true, SingleInputName = "SingleInput", Name = "Dip1", SingleInput = singleInput
        };
        
        var kran = new Kran
        {
            Name = "Kran1",
            CmdOffDiscreteOutput = do1,
            CmdOffDiscreteOutputBit = 0,
            CmdOnDiscreteOutput = do1,
            CmdOnDiscreteOutputBit = 1,
            StatOnDiscreteInput = di,
            StatOnDiscreteInputBit = 1,
            StatOffDiscreteInput = di,
            StatOffDiscreteInputBit = 2
        };
        
        var switch1 = new Switch
        {
            Name = "Switch1",
            CmdOffDiscreteOutput = do1,
            CmdOffDiscreteOutputBit = 0,
            CmdOnDiscreteOutput = do1,
            CmdOnDiscreteOutputBit = 1,
            StatOnDiscreteInput = di,
            StatOnDiscreteInputBit = 1,
            StatOffDiscreteInput = di,
            StatOffDiscreteInputBit = 2
        };
        
        var oilPump = new OilPump
        {
            Name = "OilPump1",
            CmdOffDiscreteOutput = do1,
            CmdOffDiscreteOutputBit = 0,
            CmdOnDiscreteOutput = do1,
            CmdOnDiscreteOutputBit = 1,
            StatOnDiscreteInput = di,
            StatOnDiscreteInputBit = 1,
            StatOffDiscreteInput = di,
            StatOffDiscreteInputBit = 2
        };
        
        var sectionSwitch = new SectionSwitch
        {
            Name = "Sw1"
        };
        
        AnalogInputs = new List<AnalogInput>
            {ai, ai2};
        DiscreteInputs = new List<DiscreteInput>
            {di};
        DiscreteOutputs = new List<DiscreteOutput>
            {do1};
        SingleInputs = new List<SingleInput>
            {singleInput};
        SingleOutputs = new List<SingleOutput>
            {singleOutput};
        AnalogSignalProtections = new List<AnalogSignalProtection>
            {analogSignalProtection};
        DiscreteSignalProtections = new List<DiscreteSignalProtection>
            {discreteSignalProtection};
        Krans = new List<Kran>
            {kran};
        OilPumps = new List<OilPump> {oilPump};
        Switches = new List<Switch> {switch1};
        SectionSwitches = new List<SectionSwitch> {sectionSwitch};
        try
        {
            PathToProject = FileWork.GetLocalConfigDirectory();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message);
            Current.Shutdown();
        }

        // try
        // {
        //     FileWork.ReadConfig(PathToProject);
        // }
        // catch (Exception ex)
        // {
        //     MessageBox.Show(ex.Message);
        // }

        MainWindow mainWindow = new();
        mainWindow.Show();
    }
}