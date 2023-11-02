﻿using System.Collections.Generic;
using System.IO;
using System.Text;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Generators;

public static class ConfigGenerator
{
    private const string DataTypesFolderName = "DataTypes";

    public static void GenerateAiConfig(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nAiConfig : STRUCT\n");

        foreach (var analogInput in analogInputs)
            content.Append($"\t{analogInput.Name} : struct_AI;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\AiConfig.st", content);
    }

    public static void GenerateDiConfig(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nDiConfig : STRUCT\n");

        foreach (var discreteInput in discreteInputs)
            content.Append($"\t{discreteInput.Name} : struct_DI;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\DiConfig.st", content);
    }

    public static void GenerateDoConfig(string pathToProjectDirectory, List<DiscreteOutput> discreteOutputs)
    {
        StringBuilder content = new();
        content.Append("TYPE\nDoConfig : STRUCT\n");

        foreach (var discreteInput in discreteOutputs)
            content.Append($"\t{discreteInput.Name} : struct_DO;\n");

        content.Append("END_STRUCT;\nEND_TYPE");

        CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\DoConfig.st", content);
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

        CreateFile($@"{pathToProjectDirectory}\{DataTypesFolderName}\ProtectionsConfig.st", content);
    }
    private static void CreateFile(string path, StringBuilder content)
    {
        File.WriteAllText(path, content.ToString());
    }
}