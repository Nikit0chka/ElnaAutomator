using System;
using System.Collections.Generic;
using System.Text;
using ElnaAutomator.Config.ConfigStructs;
using ElnaAutomator.Config.FileOperations;

namespace ElnaAutomator.Config.Generators;

public static class FunctionsGenerator
{
    public const string FunctionsFolderName = "Functions";

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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyAnalogsPs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyAnalogsPs', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyAnalogsNs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyAnalogsNs', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyDiscretPs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyDiscretPs', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyProtectionInRemont.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyProtectionInRemont', {ex}");
        }
    }

    public static void GenerateAnyProtectionSignalling(string pathToProjectDirectory,
        List<AnalogSignalProtection> analogSignalProtections,
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyProtectionSignaling.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyProtectionSignaling', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AutoRunProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AutoRunProtections', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\BlockAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'BlockAllProtections', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\DisableAiLimits.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'DisableAiLimits', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyDiscretNs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyDiscretNs', {ex}");
        }
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

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\EnableAiLimits.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'EnableAiLimits', {ex}");
        }
    }

    public static void GenerateRemontAllProtections(string pathToProjectDirectory,
        List<AnalogSignalProtection> analogSignalProtections, List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION RemontAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");
        content.Append("VAR CONSTANT\n\tcmdRemont : WORD := 4;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"Protections.{analogSignalProtection.Name}.inCommand_Alg := cmdRemont;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"Protections.{discreteSignalProtection.Name}.inCommand_Alg := cmdRemont;\n");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\RemontAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'RemontAllProtections', {ex}");
        }
    }

    public static void GenerateResetAllProtections(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION ResetAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"ResetAiProtection({analogSignalProtection.Name});\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"ResetDiProtection({discreteSignalProtection.Name});\n");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\ResetAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ResetAllProtections', {ex}");
        }
    }

    public static void GenerateResetAllSignalling(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION ResetAllSignaling : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append(
                $"IF {analogSignalProtection.Name}.Signalling THEN\n\tResetAiProtection(tProtections.{analogSignalProtection.Name}); END_IF;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append(
                $"IF {discreteSignalProtection.Name}.Signalling THEN\n\tResetDiProtection(tProtections.{discreteSignalProtection.Name}); END_IF;\n");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\ResetAllSignaling.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ResetAllSignaling', {ex}");
        }
    }

    public static void GenerateUnBlockAllProtections(string pathToProjectDirectory,
        List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION UnBlockAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"protections.{analogSignalProtection.Name}.inOpcCommandsDisabled := FALSE;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"protections.{discreteSignalProtection.Name}.inOpcCommandsDisabled := FALSE;\n");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\UnBlockAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'UnBlockAllProtections', {ex}");
        }
    }

    public static void GenerateBlockAllIm(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION BlockAllIm : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tIM : ImConfig;\nEND_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append(
                $"IF NOT IM.{executiveMechanism.Name}.inOpcCommandsDisabled THEN IM.{executiveMechanism.Name}.inOpcCommandsDisabled := TRUE; END_IF;\n");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\BlockAllIm.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'BlockAllIm', {ex}");
        }
    }

    public static void GenerateUnBlockAllIm(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION UnBlockAllIm : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tIM : ImConfig;\nEND_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append(
                $"IF IM.{executiveMechanism.Name}.inOpcCommandsDisabled THEN IM.{executiveMechanism.Name}.inOpcCommandsDisabled := FALSE; END_IF;\n");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\UnBlockAllIm.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'UnBlockAllIm', {ex}");
        }
    }

    public static void GenerateNsCepeiControl(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION NsCepeiControl : BOOL\n\n");
        content.Append("VAR_INPUT\n\tIM : ImConfig;\nEND_VAR\n\n");
        content.Append("NsCepeiControl := NOT (\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append(
                $"\tIM.{executiveMechanism.Name}.reliability OR\n");

        content.Length -= 4;
        content.Append(");");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\NsCepeiControl.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'NsCepeyControl', {ex}");
        }
    }

    public static void GenerateNsCepeiUpravlenya(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION NsCepeiUpravlenya : BOOL\n\n");
        content.Append("VAR_INPUT\n\tIM : ImConfig;\nEND_VAR\n\n");
        content.Append("NsCepeiUpravlenya := (\n");

        foreach (var executiveMechanism in executiveMechanisms)
        {
            if (executiveMechanism is Kran)
            {
                content.Append($"\tIM.{executiveMechanism.Name}.So OR IM.{executiveMechanism.Name}.Sz OR\n");
                continue;
            }
            content.Append(
                $"\tIM.{executiveMechanism.Name}.breakCmdOn OR\n");
        }

        content.Length -= 4;
        content.Append(");");

        try
        {
            FileWork.CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\NsCepeiUpravlenya.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'NsCepeyUpravlenya', {ex}");
        }
    }
}