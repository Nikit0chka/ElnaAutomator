using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.Windows;
using Microsoft.Win32;

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
    public required string PathToProject;

    public App()
    {

        var ai = new AnalogInput
        {
            Name = "A1", HighLimit = 100, LowLimit = 0, HighAlarm = 90,
            LowAlarm = 10, HighWarning = 80, LowWarning = 20, ModuleName = "A",
            Address = 0, ModuleAddress = 0
        };
        var ai2 = new AnalogInput
        {
            Name = "A1", HighLimit = 100, LowLimit = 0, HighAlarm = 90,
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
            AnalogInput = ai, IsUpperLimitProtection = false, Name = "Ap1"
        };

        var discreteSignalProtection = new DiscreteSignalProtection
        {
            IsOnLimitProtection = true, Name = "Dip1", SingleInput = singleInput
        };

        var kran = new Kran
        {
            Name = "Kran1",
            CmdOffDiscreteInput = do1,
            CmdOffDiscreteInputBit = 0,
            CmdOnDiscreteInput = do1,
            CmdOnDiscreteInputBit = 1,
            StatOnDiscreteInput = di,
            StatOnDiscreteInputBit = 1,
            StatOffDiscreteInput = di,
            StatOffDiscreteInputBit = 2
        };

        var switch1 = new Switch
        {
            Name = "Switch1",
            CmdOffDiscreteInput = do1,
            CmdOffDiscreteInputBit = 0,
            CmdOnDiscreteInput = do1,
            CmdOnDiscreteInputBit = 1,
            StatOnDiscreteInput = di,
            StatOnDiscreteInputBit = 1,
            StatOffDiscreteInput = di,
            StatOffDiscreteInputBit = 2
        };

        var oilPump = new OilPump
        {
            Name = "OilPump1",
            CmdOffDiscreteInput = do1,
            CmdOffDiscreteInputBit = 0,
            CmdOnDiscreteInput = do1,
            CmdOnDiscreteInputBit = 1,
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

        ChooseLocalConfigDirectory();
        MainWindow mainWindow = new();
        mainWindow.Show();
    }

    private void ChooseLocalConfigDirectory()
    {
        OpenFileDialog openFileDialog = new()
        {
            ValidateNames = false,
            CheckFileExists = false,
        };

        if (openFileDialog.ShowDialog() != true) return;

        var path = Path.GetDirectoryName(openFileDialog.FileName);

        if (path == null)
            return;

        PathToProject = path;
        CreateConfigByTxt(path);
    }

    private void CreateConfigByTxt(string path)
    {
        if (!File.Exists(path + "config.txt"))
            return;

        try
        {
            var data = File.ReadAllText(path);

            var json = JsonSerializer.Deserialize<ConfigJson>(data);

            if (json == null)
                return;

            AnalogInputs = json.AnalogInputs;
            AnalogSignalProtections = json.AnalogSignalProtections;
            DiscreteInputs = json.DiscreteInputs;
            DiscreteOutputs = json.DiscreteOutputs;
            DiscreteSignalProtections = json.DiscreteSignalProtections;
            Krans = json.Krans;
            Switches = json.Switches;
            OilPumps = json.OilPumps;
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
            OilPumps = OilPumps,
            Krans = Krans,
            Switches = Switches,
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

    // private void CreateConfigByExcel()
    // {
    // }
}