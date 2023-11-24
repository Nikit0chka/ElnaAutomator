using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Generators;

public static class FunctionsGenerator
{
    public const string FunctionsFolderName = "Functions";

    public async static Task GenerateAnyAnalogPsAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyAnalogsPs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tAi : AiConfig;\nEND_VAR\n\n");
        content.Append("VAR\n\tstatusAi : TYPE_StatusAi;\nEND_VAR\n\n");

        content.Append("AnyAnalogsPs := \n");

        foreach (var analogInput in analogInputs.Where(analogInput => analogInput.HighWarning != null))
            content.Append($"Ai.{analogInput.Name}.interval = statusAi.HW OR\n");

        foreach (var analogInput in analogInputs.Where(analogInput => analogInput.LowWarning != null))
            content.Append($"Ai.{analogInput.Name}.interval = statusAi.LW OR\n");

        content.Length -= 4;
        content.Append(';');

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyAnalogsPs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyAnalogsPs', {ex.Message}");
        }
    }

    public async static Task GenerateAnyAnalogsNsAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyAnalogsNs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tAi : AiConfig;\nEND_VAR\n\n");
        content.Append("VAR\n\tstatusAi : TYPE_StatusAi;\nEND_VAR\n\n");

        content.Append("AnyAnalogsNs := \n");

        foreach (var analogInput in analogInputs)
            content.Append($"((Ai.{analogInput.Name}.interval < statusAi.Normal) AND NOT Ai.{analogInput.Name}.Remont) OR\n");

        content.Length -= 4;
        content.Append(';');

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyAnalogsNs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyAnalogsNs', {ex.Message}");
        }
    }

    public async static Task GenerateAnyDiscretePsAsync(string pathToProjectDirectory, List<SingleInput> singleInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyDiscretPs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tIm : ImConfig;\nEND_VAR\n\n");

        content.Append("AnyDiscretPs := \n");

        foreach (var singleInput in singleInputs.Where(singleInput => singleInput.IsProtectionsSignalling))
            content.Append($"Im.SingleSignals.{singleInput.Name}.Q OR\n");

        content.Length -= 4;
        content.Append(';');

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyDiscretPs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyDiscretPs', {ex.Message}");
        }
    }

    public async static Task GenerateAnyProtectionRemontAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
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
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyProtectionInRemont.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyProtectionInRemont', {ex.Message}");
        }
    }

    public async static Task GenerateAnyProtectionSignallingAsync(string pathToProjectDirectory,
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
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyProtectionSignaling.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyProtectionSignaling', {ex.Message}");
        }
    }

    public async static Task GenerateAutoRunProtectionsAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AutoRunProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections.Where(analogSignalProtection => analogSignalProtection.IsRunOnStart))
            content.Append($"RunAiProtection(Protections.{analogSignalProtection.Name});\n");
        foreach (var discreteSignalProtection in discreteSignalProtections.Where(discreteSignalProtection => discreteSignalProtection.IsRunOnStart))
            content.Append($"RunDiProtection(Protections.{discreteSignalProtection.Name});\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\AutoRunProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AutoRunProtections', {ex.Message}");
        }
    }

    public async static Task GenerateBlockAllProtectionsAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION BlockAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"Protections.{analogSignalProtection.Name}.inOpcCommandsDisabled := TRUE;\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"Protections.{discreteSignalProtection.Name}.inOpcCommandsDisabled := TRUE;\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\BlockAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'BlockAllProtections', {ex.Message}");
        }
    }

    public async static Task GenerateDisableAiLimitsAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION DisableAiLimits : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tAi : AiConfig;\nEND_VAR\n\n");

        foreach (var analogInput in analogInputs.Where(analogInput => analogInput.LowAlarm != null))
            content.Append($"Ai.{analogInput.Name}.Disabled_LA := TRUE;\n");

        foreach (var analogInput in analogInputs.Where(analogInput => analogInput.LowWarning != null))
            content.Append($"Ai.{analogInput.Name}.Disabled_LW := TRUE;\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\DisableAiLimits.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'DisableAiLimits', {ex.Message}");
        }
    }

    public async static Task GenerateAnyDiscreteNsAsync(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
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
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyDiscretNs.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'AnyDiscretNs', {ex.Message}");
        }
    }

    public async static Task GenerateEnableAiLimitsAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION EnableAiLimits : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tAi : AiConfig;\nEND_VAR\n\n");

        foreach (var analogInput in analogInputs.Where(analogInput => analogInput.LowAlarm != null))
            content.Append($"Ai.{analogInput.Name}.Disabled_LA := FALSE;\n");

        foreach (var analogInput in analogInputs.Where(analogInput => analogInput.LowWarning != null))
            content.Append($"Ai.{analogInput.Name}.Disabled_LW := FALSE;\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\EnableAiLimits.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'EnableAiLimits', {ex.Message}");
        }
    }

    public async static Task GenerateRemontAllProtectionsAsync(string pathToProjectDirectory,
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
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\RemontAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'RemontAllProtections', {ex.Message}");
        }
    }

    public async static Task GenerateResetAllProtectionsAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION ResetAllProtections : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"ResetAiProtection(Protections.{analogSignalProtection.Name});\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"ResetDiProtection(Protections.{discreteSignalProtection.Name});\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\ResetAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ResetAllProtections', {ex.Message}");
        }
    }

    public async static Task GenerateResetAllSignallingAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION ResetAllSignaling : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append(
                $"IF Protections.{analogSignalProtection.Name}.Signaling THEN\n\tResetAiProtection(Protections.{analogSignalProtection.Name}); END_IF;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append(
                $"IF Protections.{discreteSignalProtection.Name}.Signaling THEN\n\tResetDiProtection(Protections.{discreteSignalProtection.Name}); END_IF;\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\ResetAllSignaling.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'ResetAllSignaling', {ex.Message}");
        }
    }

    public async static Task GenerateUnBlockAllProtectionsAsync(string pathToProjectDirectory,
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
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\UnBlockAllProtections.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'UnBlockAllProtections', {ex.Message}");
        }
    }

    public async static Task GenerateBlockAllImAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION BlockAllIm : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tIM : ImConfig;\nEND_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append(
                $"IF NOT IM.{executiveMechanism.Name}.inOpcCommandsDisabled THEN IM.{executiveMechanism.Name}.inOpcCommandsDisabled := TRUE; END_IF;\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\BlockAllIm.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'BlockAllIm', {ex.Message}");
        }
    }

    public async static Task GenerateUnBlockAllImAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION UnBlockAllIm : BOOL\n\n");
        content.Append("VAR_IN_OUT\n\tIM : ImConfig;\nEND_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append(
                $"IF IM.{executiveMechanism.Name}.inOpcCommandsDisabled THEN IM.{executiveMechanism.Name}.inOpcCommandsDisabled := FALSE; END_IF;\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\UnBlockAllIm.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'UnBlockAllIm', {ex.Message}");
        }
    }

    public async static Task GenerateNsCepeiControlAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
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
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\NsCepeiControl.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'NsCepeyControl', {ex.Message}");
        }
    }

    public async static Task GenerateNsCepeiUpravlenyaAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION NsCepeiUpravlenya : BOOL\n\n");
        content.Append("VAR_INPUT\n\tIM : ImConfig;\nEND_VAR\n\n");
        content.Append("NsCepeiUpravlenya := (\n");

        foreach (var executiveMechanism in executiveMechanisms)
            switch (executiveMechanism)
            {
                case Kran kran:
                {
                    if (kran is { InSzDiscreteInputBit: not null, InSzDiscreteInput: not null })
                        content.Append($"\tIM.{executiveMechanism.Name}.Sz OR\n");
                    if (kran is { InSoDiscreteInput: not null, InSoDiscreteInputBit: not null })
                        content.Append($"\tIM.{executiveMechanism.Name}.So OR\n");
                    continue;
                }
                case OilPump { InBreakCmdOn: not null, InBreakCmdOnBit: not null } or Switch { InBreakCmdOn: not null, InBreakCmdOnBit: not null }
                    or SectionSwitch { InBreakCmdOn: not null, InBreakCmdOnBit: not null }:
                    content.Append(
                        $"\tIM.{executiveMechanism.Name}.breakCmdOn OR\n");
                    break;
            }

        content.Length -= 4;
        content.Append(");");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionsFolderName}\NsCepeiUpravlenya.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'NsCepeyUpravlenya', {ex.Message}");
        }
    }
}