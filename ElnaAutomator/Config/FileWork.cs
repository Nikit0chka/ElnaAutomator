using System;
using System.IO;
using System.Text.Json;
using System.Windows;
using Microsoft.Win32;

namespace ElnaAutomator.Config;

public static class FileWork
{
    private readonly static App CurrentApp = (App) Application.Current;

    public static string GetLocalConfigDirectory()
    {
        OpenFileDialog openFileDialog = new();

        if (openFileDialog.ShowDialog() != true) throw new Exception("Exception trying choose project directory. Directory didnt chosen");

        var path = Path.GetDirectoryName(openFileDialog.FileName);

        return path ?? "";
    }

    public  static void ReadConfig(string path)
    {
        if (!File.Exists(path + "config.txt"))
            return;

        try
        {
            var data = File.ReadAllText(path);

            var json = JsonSerializer.Deserialize<ConfigJson>(data);

            if (json == null)
                return;

            CurrentApp.AnalogInputs = json.AnalogInputs;
            CurrentApp.AnalogSignalProtections = json.AnalogSignalProtections;
            CurrentApp.DiscreteInputs = json.DiscreteInputs;
            CurrentApp.DiscreteOutputs = json.DiscreteOutputs;
            CurrentApp.DiscreteSignalProtections = json.DiscreteSignalProtections;
            CurrentApp.Krans = json.Krans;
            CurrentApp.Switches = json.Switches;
            CurrentApp.OilPumps = json.OilPumps;
            CurrentApp.SingleInputs = json.SingleInputs;
            CurrentApp.SingleOutputs = json.SingleOutputs;
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying create config {ex}");
        }
    }

    public static void WriteConfigToTxt(string path)
    {
        var json = new ConfigJson
        {
            AnalogInputs = CurrentApp.AnalogInputs,
            AnalogSignalProtections = CurrentApp.AnalogSignalProtections,
            DiscreteInputs = CurrentApp.DiscreteInputs,
            DiscreteOutputs = CurrentApp.DiscreteOutputs,
            DiscreteSignalProtections = CurrentApp.DiscreteSignalProtections,
            OilPumps = CurrentApp.OilPumps,
            Krans = CurrentApp.Krans,
            Switches = CurrentApp.Switches,
            SingleInputs = CurrentApp.SingleInputs,
            SingleOutputs = CurrentApp.SingleOutputs
        };

        var data = JsonSerializer.Serialize(json);

        try
        {
            File.WriteAllText(path, data);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying write config to file {ex}");
        }
    }
}