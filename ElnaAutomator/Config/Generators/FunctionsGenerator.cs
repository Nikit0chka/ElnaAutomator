using System.Collections.Generic;
using System.IO;
using System.Text;
using ElnaAutomator.Config.ConfigStructs;
using Microsoft.Extensions.Primitives;

namespace ElnaAutomator.Config.Generators;

public static class FunctionsGenerator
{
    private const string FunctionsFolderName = "Functions";

    public static void GenerateAnyAnalogPs(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyAnalogsPs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tAi : AiConfig;\nEND_VAR\n\n");
        content.Append("VAR\n\tstatusAi : TYPE_StatusAi;\nEND_VAR\n\n");

        content.Append("AnyAnalogsPs := \n");

        foreach (var analogInput in analogInputs)
        {
            content.Append($"Ai.{analogInput.Name}.interval = statusAi.HW OR\n");
            content.Append($"Ai.{analogInput.Name}.interval = statusAi.LW OR\n");
        }

        content.Length -= 4;
        content.Append(';');

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyAnalogsPs.st", content);
    }

    public static void GenerateAnyAnalogNs(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyAnalogNs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tAi : AiConfig;\nEND_VAR\n\n");
        content.Append("VAR\n\tstatusAi : TYPE_StatusAi;\nEND_VAR\n\n");

        content.Append("anyAnalogsPs := \n");

        foreach (var analogInput in analogInputs)
            content.Append($"((Ai.{analogInput.Name}.interval < statusAi.Normal) AND NOT Ai.{analogInput.Name}.Remont) OR\n");

        content.Length -= 4;
        content.Append(';');

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyAnalogsNs.st", content);
    }

    public static void GenerateAnyDiscretePs(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyDiscretPs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tIm : ImConfig;\nEND_VAR\n\n");

        content.Append("AnyDiscretPs := \n");

        foreach (var discreteInput in discreteInputs)
            content.Append($"Im.{discreteInput.Name}.Q OR\n");

        content.Length -= 4;
        content.Append(';');

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyDiscretPs.st", content);
    }

    public static void GenerateAnyProtectionRemont(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyProtectionInRemont : BOOL\n\n");
        content.Append("VAR_INPUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        content.Append("AnyProtectionInRemont := \n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"Protections.{analogSignalProtection.Name}.Remont OR\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"Protections.{discreteSignalProtection.Name}.Remont OR\n");

        content.Length -= 4;
        content.Append(';');

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyProtectionInRemont.st", content);
    }

    public static void GenerateAnyProtectionSignalling(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyProtectionSignaling : BOOL\n\n");
        content.Append("VAR_INPUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        content.Append("AnyProtectionSignaling := \n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"Protections.{analogSignalProtection.Name}.Signaling OR\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"Protections.{discreteSignalProtection.Name}.Signaling OR\n");

        content.Length -= 4;
        content.Append(';');

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyProtectionSignaling.st", content);
    }

    public static void GenerateAutoRunProtections(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AutoRunProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"RunAiProtection(Protections.{analogSignalProtection.Name});\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"RunDiProtection(Protections.{discreteSignalProtection.Name});\n");

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AutoRunProtections.st", content);
    }

    public static void GenerateBlockAllProtections(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION BlockAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"Protections.{analogSignalProtection.Name}.inOpcCommandDisabled := TRUE;\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"Protections.{discreteSignalProtection.Name}.inOpcCommandDisabled := TRUE;\n");

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\BlockAllProtections.st", content);
    }

    public static void GenerateDisableAiLimits(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION DisableAiLimits : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tAi : AiConfig;\nEND_VAR\n\n");

        foreach (var analogInput in analogInputs)
        {
            content.Append($"Ai.{analogInput.Name}.Disabled_LA := TRUE;\n");
            content.Append($"Ai.{analogInput.Name}.Disabled_LW := TRUE;\n");
        }

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\DisableAiLimits.st", content);
    }

    public static void GenerateAnyDiscreteNs(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyDiscretNs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tDi : DiConfig;\nEND_VAR\n\n");

        content.Append("AnyDiscretNs := \n(");
        foreach (var discreteInput in discreteInputs)
            content.Append($"(Di.{discreteInput.Name}.reliability <> 255) OR\n");

        content.Length -= 4;
        content.Append(");");
        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyDiscretNs.st", content);
    }

    public static void GenerateEnableAiLimits(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION EnableAiLimits : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tAi : AiConfig;\nEND_VAR\n\n");

        content.Append("EnableAiLimits := \n");
        foreach (var analogInput in analogInputs)
        {
            content.Append($"Ai.{analogInput.Name}.Disabled_LA := FALSE;\n");
            content.Append($"Ai.{analogInput.Name}.Disabled_LW := FALSE;\n");
        }

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\EnableAiLimits.st", content);
    }
    
    public static void GenerateRemontAllProtections(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections, List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION RemontAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");
        content.Append("VAR CONSTANT\n\tcmdRemont : WORD := 4;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"Protections.{analogSignalProtection.Name}.inCommand_Alg := cmdRemont;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"Protections.{discreteSignalProtection.Name}.inCommand_Alg := cmdRemont;\n");

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\RemontAllProtections.st", content);
    }
    
    public static void GenerateResetAllProtections(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections, List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION ResetAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"ResetAiProtection({analogSignalProtection.Name});\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"ResetDiProtection({discreteSignalProtection.Name});\n");

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\ResetAllProtections.st", content);
    }
    
    public static void GenerateResetAllSignalling(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections, List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION ResetAllSignaling : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"IF {analogSignalProtection.Name}.Signalling THEN\n\tResetAiProtection(tProtections.{analogSignalProtection.Name}); END_IF;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"IF {discreteSignalProtection.Name}.Signalling THEN\n\tResetDiProtection(tProtections.{discreteSignalProtection.Name}); END_IF;\n");

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\ResetAllSignaling.st", content);
    }

    public static void GenerateUnBlockAllProtections(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {StringBuilder content = new();

        content.Append("FUNCTION UnBlockAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"protections.{analogSignalProtection.Name}.inOpcCommandsDisabled := FALSE;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"protections.{discreteSignalProtection.Name}.inOpcCommandsDisabled := FALSE;\n");

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\UnBlockAllProtections.st", content);
    }
    

    private static void CreateFile(string path, StringBuilder content)
    {
        File.WriteAllText(path, content.ToString());
    }
}