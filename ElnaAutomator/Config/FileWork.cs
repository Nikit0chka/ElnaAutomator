﻿using System;
using System.IO;
using Newtonsoft.Json;
using System.Windows;
using ElnaAutomator.Config.Generators;
using Microsoft.WindowsAPICodePack.Dialogs;

namespace ElnaAutomator.Config;

public static class FileWork
{
    private const string ConfigFileName = "config.txt";
    private readonly static App CurrentApp = (App) Application.Current;

    private readonly static JsonSerializerSettings Settings = new()
        { PreserveReferencesHandling = PreserveReferencesHandling.Objects };

    public static string GetLocalConfigDirectory()
    {
        var folderDialog = new CommonOpenFileDialog()
        {
            IsFolderPicker = true,
            Title = "Choose project directory"
        };

        if (folderDialog.ShowDialog() != CommonFileDialogResult.Ok)
            throw new Exception("Exception trying choose project directory. Directory didnt chosen");

        if (folderDialog.FileName == null)
            throw new Exception("Exception trying choose project directory. File name is null");

        var path = Path.GetFullPath(folderDialog.FileName);

        if (path == null)
            throw new Exception("Exception trying choose project directory. Directory is null");

        return path;
    }

    public static void ReadConfig(string path)
    {
        if (!File.Exists(@$"{path}\{ConfigFileName}"))
            return;

        try
        {
            var data = File.ReadAllText(@$"{path}\{ConfigFileName}");

            var json = JsonConvert.DeserializeObject<ConfigJson>(data);

            if (json == null)
                throw new Exception("Exception reading json, json is null");

            CurrentApp.AnalogInputs = json.AnalogInputs;
            CurrentApp.AnalogSignalProtections = json.AnalogSignalProtections;
            CurrentApp.DiscreteInputs = json.DiscreteInputs;
            CurrentApp.DiscreteOutputs = json.DiscreteOutputs;
            CurrentApp.DiscreteSignalProtections = json.DiscreteSignalProtections;
            CurrentApp.Krans = json.Krans;
            CurrentApp.Switches = json.Switches;
            CurrentApp.SectionSwitches = json.SectionSwitches;
            CurrentApp.OilPumps = json.OilPumps;
            CurrentApp.SingleInputs = json.SingleInputs;
            CurrentApp.SingleOutputs = json.SingleOutputs;
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception reading json, {ex}");
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
            Krans = CurrentApp.Krans,
            Switches = CurrentApp.Switches,
            OilPumps = CurrentApp.OilPumps,
            SectionSwitches = CurrentApp.SectionSwitches,
            SingleInputs = CurrentApp.SingleInputs,
            SingleOutputs = CurrentApp.SingleOutputs
        };

        var data = JsonConvert.SerializeObject(json, Formatting.Indented, Settings);


        try
        {
            File.WriteAllText(@$"{path}\{ConfigFileName}", data);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying write config to file {ex}");
        }
    }

    public static void CreateFoldersIfNotExist(string path)
    {
        try
        {
            if (!Directory.Exists(@$"{path}\{FunctionsGenerator.FunctionsFolderName}"))
                Directory.CreateDirectory(@$"{path}\{FunctionsGenerator.FunctionsFolderName}");

            if (!Directory.Exists(@$"{path}\{FunctionBlocksGenerator.FunctionBlocksFolderName}"))
                Directory.CreateDirectory(@$"{path}\{FunctionBlocksGenerator.FunctionBlocksFolderName}");

            if (!Directory.Exists(@$"{path}\{DataTypesGenerator.DataTypesFolderName}"))
                Directory.CreateDirectory(@$"{path}\{DataTypesGenerator.DataTypesFolderName}");

            if (!Directory.Exists(@$"{path}\{ExcelWork.ExcelFolderName}"))
                Directory.CreateDirectory(@$"{path}\{ExcelWork.ExcelFolderName}");
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying create folders, {ex}");
        }
    }
}