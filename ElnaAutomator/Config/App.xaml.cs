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
            LowAlarm = 10, HighWarning = 80, LowWarning = 20,
            Address = 0, ModuleId = 0
        };
        var ai2 = new AnalogInput
        {
            Name = "A2", HighLimit = 100, LowLimit = 0, HighAlarm = 90,
            LowAlarm = 10, HighWarning = 80, LowWarning = 20,
            Address = 0, ModuleId = 0
        };
        var di = new DiscreteInput
        {
            Name = "Di", ModuleId = 0
        };

        var do1 = new DiscreteOutput
        {
            Name = "Do1",
            ModuleId = 0
        };

        var singleInput = new SingleInput
        {
            Name = "SingleInput", DiscreteInput = di, Address = 1, IsInversed = false
        };

        var singleOutput = new SingleOutput
        {
            Name = "SingleOutput", DiscreteOutput = do1, Address = 1
        };

        var analogSignalProtection = new AnalogSignalProtection
        {
            AnalogInput = ai, IsUpperLimitProtection = false, Name = "Ap1", Delay = 2, IsRunOnStart = false
        };

        var discreteSignalProtection = new DiscreteSignalProtection
        {
            Name = "Dip1", SingleInput = singleInput, Delay = 3, IsRunOnStart = false
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
            StatOffDiscreteInputBit = 2,
            InSoDiscreteInput = di,
            InSoDiscreteInputBit = 3,
            InSzDiscreteInput = di,
            InSzDiscreteInputBit = 2,
            InDpDiscreteInput = di,
            InDpDiscreteInputBit = 2,
            StatOffReabDiscreteInput = di,
            StatOnReabDiscreteInput = di,
            StatOffReabDiscreteInputBit = 2,
            StatOnReabDiscreteInputBit = 3
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
            StatOffDiscreteInputBit = 2,
            StatOffReabDiscreteInput = di,
            StatOffReabDiscreteInputBit = 1,
            StatOnReabDiscreteInput = di,
            StatOnReabDiscreteInputBit = 1,
            InBreakCmdOff = di,
            InBreakCmdOn = di,
            InBreakCmdOffBit = 2,
            InBreakCmdOnBit = 3,
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
            StatOffDiscreteInputBit = 2,
            StatOffReabDiscreteInput = di,
            StatOffReabDiscreteInputBit = 1,
            StatOnReabDiscreteInput = di,
            StatOnReabDiscreteInputBit = 1,
            InBreakCmdOff = di,
            InBreakCmdOn = di,
            InBreakCmdOffBit = 2,
            InBreakCmdOnBit = 3,
        };

        var sectionSwitch = new SectionSwitch
        {
            Name = "Mv",
            CmdOffDiscreteOutput = do1,
            CmdOffDiscreteOutputBit = 0,
            CmdOnDiscreteOutput = do1,
            CmdOnDiscreteOutputBit = 1,
            StatOnDiscreteInput = di,
            StatOnDiscreteInputBit = 1,
            StatOffDiscreteInput = di,
            StatOffDiscreteInputBit = 2,
            BasketInDiscreteInput = di,
            BasketOutDiscreteInput = di,
            BasketInDiscreteInputBit = 2,
            BasketOutDiscreteInputBit = 3,
            StatOffReabDiscreteInput = di,
            StatOffReabDiscreteInputBit = 1,
            StatOnReabDiscreteInput = di,
            StatOnReabDiscreteInputBit = 1,
            InBreakCmdOff = di,
            InBreakCmdOn = di,
            InBreakCmdOffBit = 2,
            InBreakCmdOnBit = 3,
            BasketTestDiscreteInput = di,
            BasketTestDiscreteInputBit = 3            
        };

        AnalogInputs = new List<AnalogInput>
            { ai, ai2 };
        DiscreteInputs = new List<DiscreteInput>
            { di };
        DiscreteOutputs = new List<DiscreteOutput>
            { do1 };
        SingleInputs = new List<SingleInput>
            { singleInput };
        SingleOutputs = new List<SingleOutput>
            { singleOutput };
        AnalogSignalProtections = new List<AnalogSignalProtection>
            { analogSignalProtection };
        DiscreteSignalProtections = new List<DiscreteSignalProtection>
            { discreteSignalProtection };
        Krans = new List<Kran>
            { kran };
        OilPumps = new List<OilPump> { oilPump };
        Switches = new List<Switch> { switch1 };
        SectionSwitches = new List<SectionSwitch> { sectionSwitch };

        try
        {
            PathToProject = FileWork.GetLocalConfigDirectory();
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message);
            Current.Shutdown();
            return;
        }

        // try
        // {
        //     FileWork.ReadConfig(PathToProject);
        // }
        // catch (Exception ex)
        // {
        //     MessageBox.Show(ex.Message);
        //Current.Shutdown();
        //return;
        // }

        MainWindow mainWindow = new();
        mainWindow.Show();
    }
}