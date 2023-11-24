using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Generators;

public static class DataTypesGenerator
{
    public const string DataTypesFolderName = "DataTypes";

    public async static Task GenerateAiConfigAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nAiConfig : STRUCT\n");

        foreach (var analogInput in analogInputs)
            content.Append($"\t{analogInput.Name} : struct_AI;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{DataTypesFolderName}\AiConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AiConfig', {ex.Message}");
        }
    }

    public async static Task GenerateDiConfigAsync(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nDiConfig : STRUCT\n");

        foreach (var discreteInput in discreteInputs)
            content.Append($"\t{discreteInput.Name} : struct_DI;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{DataTypesFolderName}\DiConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'DiConfig', {ex.Message}");
        }
    }

    public async static Task GenerateDoConfigAsync(string pathToProjectDirectory, List<DiscreteOutput> discreteOutputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nDoConfig : STRUCT\n");

        foreach (var discreteInput in discreteOutputs)
            content.Append($"\t{discreteInput.Name} : struct_DO;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{DataTypesFolderName}\DoConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'DoConfig', {ex.Message}");
        }
    }

    public async static Task GenerateProtectionsConfigAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();
        content.Append("TYPE\nProtectionsConfig : STRUCT\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"\t{analogSignalProtection.Name} : struct_AiProtection;\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"\t{discreteSignalProtection.Name} : struct_DiProtection;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{DataTypesFolderName}\ProtectionsConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ProtectionsConfig', {ex.Message}");
        }
    }

    public async static Task GenerateImConfigAsync(string pathToProjectDirectory, List<Kran> krans, List<OilPump> oilPumps, List<Switch> switches,
        List<SectionSwitch> sectionSwitches)
    {
        StringBuilder content = new();
        content.Append("TYPE\nImConfig : STRUCT \n");

        foreach (var kran in krans)
            content.Append($"\t{kran.Name} : struct_Kran;\n");
        foreach (var oilPump in oilPumps)
            content.Append($"\t{oilPump.Name} : struct_OilPump;\n");
        foreach (var @switch in switches)
            content.Append($"\t{@switch.Name} : struct_Switch;\n");
        foreach (var sectionSwitch in sectionSwitches)
            content.Append($"\t{sectionSwitch.Name} : struct_SectionSwitch;\n");

        content.Append("\tSingleSignals : Im_singleSignals;\n\tSingleOutputs : Im_singleOutputs;\n");
        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{DataTypesFolderName}\ImConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ImConfig', {ex.Message}");
        }
    }

    public async static Task GenerateImSingleSignalsAsync(string pathToProjectDirectory, List<SingleInput> singleInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nIm_singleSignals : STRUCT\n");

        foreach (var singleInput in singleInputs)
            content.Append($"\t{singleInput.Name} : struct_singleSignal;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{DataTypesFolderName}\Im_singleSignals.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Im_singleSignals', {ex.Message}");
        }
    }

    public async static Task GenerateImSingleOutputsAsync(string pathToProjectDirectory, List<SingleOutput> singleOutputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nIm_singleOutputs : STRUCT\n");

        foreach (var singleOutput in singleOutputs)
            content.Append($"\t{singleOutput.Name} : struct_singleOutput;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{DataTypesFolderName}\Im_singleOutputs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Im_singleOutputs', {ex.Message}");
        }
    }
}