using System;
using System.Collections.Generic;
using System.Text;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.FileOperations;

namespace ElnaAutomator.Config.Generators;

public static class DataTypesGenerator
{
    public const string DataTypesFolderName = "DataTypes";

    public static void GenerateAiConfig(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nAiConfig : STRUCT\n");

        foreach (var analogInput in analogInputs)
            content.Append($"\t{analogInput.Name} : struct_AI;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\AiConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AiConfig', {ex}");
        }
    }

    public static void GenerateDiConfig(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nDiConfig : STRUCT\n");

        foreach (var discreteInput in discreteInputs)
            content.Append($"\t{discreteInput.Name} : struct_DI;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\DiConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'DiConfig', {ex}");
        }
    }

    public static void GenerateDoConfig(string pathToProjectDirectory, List<DiscreteOutput> discreteOutputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nDoConfig : STRUCT\n");

        foreach (var discreteInput in discreteOutputs)
            content.Append($"\t{discreteInput.Name} : struct_DO;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\DoConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'DoConfig', {ex}");
        }
    }

    public static void GenerateProtectionsConfig(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
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
            FileWork.CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\ProtectionsConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ProtectionsConfig', {ex}");
        }
    }

    public static void GenerateImConfig(string pathToProjectDirectory, List<Kran> krans, List<OilPump> oilPumps, List<Switch> switches,
        List<SectionSwitch> sectionSwitches)
    {
        StringBuilder content = new();
        content.Append("TYPE\nstruct_SectionSwitch : STRUCT \n");

        foreach (var kran in krans)
            content.Append($"\t{kran.Name} : struct_Kran;\n");
        foreach (var oilPump in oilPumps)
            content.Append($"\t{oilPump.Name} : struct_OilPump;\n");
        foreach (var @switch in switches)
            content.Append($"\t{@switch.Name} : struct_Switch;\n");
        foreach (var sectionSwitch in sectionSwitches)
            content.Append($"\t{sectionSwitch.Name} : struct_SectionSwitch;\n");

        content.Append("SingleSignals : IM_singleSignals;\n\tSingleOutputs : IM_singleOutputs;\n");
        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\ImConfig.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ImConfig', {ex}");
        }
    }

    public static void GenerateImSingleSignals(string pathToProjectDirectory, List<SingleInput> singleInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nIm_singleSignals : STRUCT\n");

        foreach (var singleInput in singleInputs)
            content.Append($"\t{singleInput.Name} : struct_singleSignal;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\Im_singleSignals.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Im_singleSignals', {ex}");
        }
    }

    public static void GenerateImSingleOutputs(string pathToProjectDirectory, List<SingleOutput> singleOutputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nIm_singleOutputs : STRUCT\n");

        foreach (var singleOutput in singleOutputs)
            content.Append($"\t{singleOutput.Name} : struct_singleOutput;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\Im_singleOutputs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Im_singleOutputs', {ex}");
        }
    }
}