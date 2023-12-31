﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Generators;

public static class FunctionBlocksGenerator
{
    public const string FunctionBlocksFolderName = "FunctionBlocks";

    public async static Task GenerateProcAiInitAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Ai_Init\n\n");
        content.Append("VAR_INPUT\n\tinit : BOOL;\nEND_VAR\n\n");
        content.Append("VAR\n\tstAI_Ini : fb_AI_Init;\n\tinits : UINT;\nEND_VAR\n\n");
        content.Append("VAR_INPUT\n\tinitiales : UINT;\nEND_VAR\n\n");
        content.Append("VAR_EXTERNAL\n\tAi : AiConfig;\nEND_VAR\n\n");

        content.Append("inits := 0;\n\n");

        foreach (var analogInput in analogInputs)
        {
            content.Append($"stAI_Ini(data_Ini := TRUE, dLL := {analogInput.LowLimit}.0, dHL := {analogInput.HighLimit}.0,\n");
            if (analogInput.LowWarning != null)
                content.Append($"ISVALIDREF_LW := TRUE, dLW := {analogInput.LowWarning}.0,\n");
            if (analogInput.HighWarning != null)
                content.Append($"ISVALIDREF_HW := TRUE, dHW := {analogInput.HighWarning}.0,\n");
            if (analogInput.LowAlarm != null)
                content.Append($"ISVALIDREF_LA := TRUE, dLA := {analogInput.LowAlarm}.0,\n");
            if (analogInput.HighAlarm != null)
                content.Append($"ISVALIDREF_HA := TRUE, dHA := {analogInput.HighAlarm}.0,\n");

            content.Append($"strAI := Ai.{analogInput.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stAI_Ini.Init);\n\n");
        }

        content.Append("\ninitiales := 0;\nIF init THEN initiales := inits; END_IF;");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Ai_Init.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Ai_Init', {ex.Message}");
        }
    }

    public async static Task GenerateProcAiAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Ai\n\n");
        content.Append("VAR\n");

        foreach (var analogInput in analogInputs)
            content.Append($"\tfb_{analogInput.Name} : fb_AiSourceMlp;\n");

        content.Append("END_VAR\n\n");
        content.Append("VAR_EXTERNAL\n");
        content.Append("\tAi : AiConfig;\n");

        for (var i = 0; i < analogInputs.Count; i++)
            content.Append($"\tarAIN_{i} : TItemAIN;\n");
        for (var i = 0; i < analogInputs.Count; i++)
            content.Append($"\tAI_{i}_dblValue : LREAL;\n");

        foreach (var moduleId in analogInputs.Select(analogInput => analogInput.ModuleId).Distinct().ToList())
            content.Append($"\tarERR_{moduleId} : TItemDIN;;\n");

        content.Append("END_VAR\n\n");

        for (var i = 0; i < analogInputs.Count; i++)
        {
            content.Append(
                $"fb_{analogInputs[i].Name}(arAIN := arAIN_{i}, strAI := Ai.{analogInputs[i].Name}, err_mod := arERR_{analogInputs[i].ModuleId});\n");
            content.Append(
                $"AI_{i}_dblValue := arAIN_{i}.dblValue;\n\n");
        }

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Ai.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Ai', {ex.Message}");
        }
    }

    public async static Task GenerateProcDiInitAsync(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Di_Init\n\n");
        content.Append("VAR_INPUT\n\tinit : BOOL;\nEND_VAR\n\n");
        content.Append("VAR\n\tstDI_Ini : fb_DI_Init;\n\tinits : UINT;\nEND_VAR\n\n");
        content.Append("VAR_INPUT\n\tinitiales : UINT;\nEND_VAR\n\n");
        content.Append("VAR_EXTERNAL\n\tdi : DiConfig;\nEND_VAR\n\n");

        content.Append("inits := 0;\n\n");

        foreach (var discreteInput in discreteInputs)
        {
            content.Append($"stDI_Ini(data_Ini := TRUE, imit := FALSE, strDI := di.{discreteInput.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stDI_Ini.Init);\n\n");
        }

        content.Append("\ninitiales := 0;\nIF init THEN initiales := inits; END_IF;");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Di_Init.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Di_Init', {ex.Message}");
        }
    }


    public async static Task GenerateProcDiAsync(string pathToProjectDirectory, List<DiscreteInput> discreteInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Di\n\n");
        content.Append("VAR\n");

        foreach (var discreteInput in discreteInputs)
            content.Append($"\tfb_{discreteInput.Name} : fb_DiSourceMlp;\n");

        content.Append("END_VAR\n\n");
        content.Append("VAR_EXTERNAL\n");
        content.Append("\tdi : DiConfig;\n");

        for (var i = 0; i < discreteInputs.Count; i++)
            content.Append($"\tarDIN_{i} : TItemDIN;\n");

        for (var i = 0; i < discreteInputs.Count; i += 2)
        {
            if (i + 1 >= discreteInputs.Count)
                continue;

            content.Append($"\tDI_{i}_{i + 1}_wValue : UDINT;\n");
        }


        foreach (var moduleId in discreteInputs.Select(analogInput => analogInput.ModuleId).Distinct().ToList())
            content.Append($"\tarERR_{moduleId} : TItemDIN;;\n");

        content.Append("END_VAR\n\n");

        for (var i = 0; i < discreteInputs.Count; i += 2)
        {
            content.Append(
                $"fb_{discreteInputs[i].Name}(arDIN := arDIN_{i}, strDI := di.{discreteInputs[i].Name}, err_mod := arERR_{discreteInputs[i].ModuleId});\n");

            if (i + 1 >= discreteInputs.Count)
                continue;

            content.Append(
                $"fb_{discreteInputs[i + 1].Name}(arDIN := arDIN_{i + 1}, strDI := di.{discreteInputs[i + 1].Name}, err_mod := arERR_{discreteInputs[i + 1].ModuleId});\n");
            content.Append(
                $"DI_{i}_{i + 1}_wValue := DIwValue_Diag(arDIN_{i}.wValue, arDIN_{i + 1}.wValue);\n\n");
        }

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Di.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Di', {ex.Message}");
        }
    }
    public async static Task GenerateProcDoInitAsync(string pathToProjectDirectory, List<DiscreteOutput> discreteOutputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Do_Init\n\n");
        content.Append("VAR_INPUT\n\tinit : BOOL;\nEND_VAR\n\n");
        content.Append("VAR\n\tstDO_Ini : fb_DO_Init;\n\tinits : UINT;\nEND_VAR\n\n");
        content.Append("VAR_INPUT\n\tinitiales : UINT;\nEND_VAR\n\n");
        content.Append("VAR_EXTERNAL\n\tod : DoConfig;\nEND_VAR\n\n");

        content.Append("inits := 0;\n\n");

        foreach (var discreteOutput in discreteOutputs)
        {
            content.Append($"stDO_Ini(data_Ini := TRUE, imit := FALSE, strDO := od.{discreteOutput.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stDO_Ini.Init);\n\n");
        }

        content.Append("\ninitiales := 0;\nIF init THEN initiales := inits; END_IF;");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Do_Init.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Do_Init', {ex.Message}");
        }
    }


    public async static Task GenerateProcDoAsync(string pathToProjectDirectory, List<DiscreteOutput> discreteOutputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Do\n\n");
        content.Append("VAR\n");

        foreach (var discreteInput in discreteOutputs)
            content.Append($"\tfb_{discreteInput.Name} : fb_DOSourceMlp;\n");

        content.Append("END_VAR\n\n");
        content.Append("VAR_EXTERNAL\n");
        content.Append("\tod : DoConfig;\n");

        for (var i = 0; i < discreteOutputs.Count; i++)
            content.Append($"\tarDOUT_{i} : TWordData;\n");
        for (var i = 0; i < discreteOutputs.Count; i++)
            content.Append($"\tDO_{i}_wValue : UINT;\n");

        foreach (var moduleId in discreteOutputs.Select(analogInput => analogInput.ModuleId).Distinct().ToList())
            content.Append($"\tarERR_{moduleId} : TItemDIN;;\n");

        content.Append("END_VAR\n\n");

        for (var i = 0; i < discreteOutputs.Count; i++)
        {
            content.Append(
                $"fb_{discreteOutputs[i].Name}(arDout := arDOUT_{i}, strDO := od.{discreteOutputs[i].Name}, err_mod := arERR_{discreteOutputs[i].ModuleId});\n");
            content.Append(
                $"DO_{i}_wValue := arDOUT_{i}.wValue;\n\n");
        }
        content.Append("(*gpio_out not initialized*)");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Do.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Do', {ex.Message}");
        }
    }


    public async static Task GenerateProcImAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms,
        List<SingleInput> singleInputs, List<SingleOutput> singleOutputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Im\n\n");
        content.Append("VAR\n");

        foreach (var executiveMechanism in executiveMechanisms.OrderBy(executiveMechanism => executiveMechanism.GetType().ToString()).ToList())
            switch (executiveMechanism)
            {
                case Kran:
                    content.Append($"\tfb_{executiveMechanism.Name} : fb_Kran;\n");
                    break;
                case OilPump:
                    content.Append($"\tfb_{executiveMechanism.Name} : fb_OilPump;\n");
                    break;
                case Switch:
                    content.Append($"\tfb_{executiveMechanism.Name} : fb_Switch;\n");
                    break;
                case SectionSwitch:
                    content.Append($"\tfb_{executiveMechanism.Name} : fb_SectionSwitch;\n");
                    break;
            }

        foreach (var singleOutput in singleOutputs)
            content.Append($"\tfb_{singleOutput.Name} : fb_singleOutput;\n");
        foreach (var singleInput in singleInputs)
            content.Append($"\tfb_{singleInput.Name} : fb_singleSignal;\n");
        content.Append("END_VAR\n\n");


        content.Append("VAR_EXTERNAL\n\tdi : DiConfig;\n\tod : DoConfig;\n\tIm : ImConfig;\nEND_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms)
        {
            content.Append(
                $"fb_{executiveMechanism.Name}(");

            if (executiveMechanism is { StatOnDiscreteInput: not null, StatOnDiscreteInputBit: not null })
            {
                content.Append(
                    $"statOn := di.{executiveMechanism.StatOnDiscreteInput.Name}.bits[{executiveMechanism.StatOnDiscreteInputBit}].{(executiveMechanism.IsStatOnInversed? "_inversed" : "value")},\n");
                content.Append(
                    $"statOn_reliability := di.{executiveMechanism.StatOnDiscreteInput.Name}.bits[{executiveMechanism.StatOnDiscreteInputBit}].reliability,\n");
            }

            if (executiveMechanism is { StatOffDiscreteInput: not null, StatOffDiscreteInputBit: not null })
            {
                content.Append(
                    $"statOff := di.{executiveMechanism.StatOffDiscreteInput.Name}.bits[{executiveMechanism.StatOffDiscreteInputBit}].{(executiveMechanism.IsStatOnInversed? "_inversed" : "value")},\n");
                content.Append(
                    $"statOff_reliability := di.{executiveMechanism.StatOffDiscreteInput.Name}.bits[{executiveMechanism.StatOffDiscreteInputBit}].reliability,\n");
            }

            if (executiveMechanism is { CmdOnDiscreteOutput: not null, CmdOnDiscreteOutputBit: not null })
                content.Append(
                    $"cmdOn := od.{executiveMechanism.CmdOnDiscreteOutput.Name}.bits[{executiveMechanism.CmdOnDiscreteOutputBit}],\n");
            if (executiveMechanism is { CmdOffDiscreteOutput: not null, CmdOffDiscreteOutputBit: not null })
                content.Append(
                    $"cmdOff := od.{executiveMechanism.CmdOffDiscreteOutput.Name}.bits[{executiveMechanism.CmdOffDiscreteOutputBit}],\n");

            switch (executiveMechanism)
            {
                case Kran kran:
                {
                    if (kran is { InDpDiscreteInput: not null, InDpDiscreteInputBit: not null })
                        content.Append(
                            $"inDp := di.{kran.InDpDiscreteInput.Name}.bits[{kran.InDpDiscreteInputBit}],\n");
                    if (kran is { InSoDiscreteInput: not null, InSoDiscreteInputBit: not null })
                        content.Append(
                            $"inSo := di.{kran.InSoDiscreteInput.Name}.bits[{kran.InSoDiscreteInputBit}],\n");
                    if (kran is { InSzDiscreteInput: not null, InSzDiscreteInputBit: not null })
                        content.Append(
                            $"inSz := di.{kran.InSzDiscreteInput.Name}.bits[{kran.InSzDiscreteInputBit}],\n");
                    content.Append($"strKr := Im.{kran.Name});\n\n");
                    break;
                }
                case OilPump oilPump:
                {
                    if (oilPump is { InBreakCmdOn: not null, InBreakCmdOnBit: not null })
                        content.Append(
                            $"inBreakCmdOn := di.{oilPump.InBreakCmdOn.Name}.bits[{oilPump.InBreakCmdOnBit}],\n");
                    if (oilPump is { InBreakCmdOff: not null, InBreakCmdOffBit: not null })
                        content.Append(
                            $"inBreakCmdOff := di.{oilPump.InBreakCmdOff.Name}.bits[{oilPump.InBreakCmdOffBit}],\n");
                    content.Append($"StrSw := Im.{oilPump.Name});\n\n");
                    break;
                }
                case Switch sswitch:
                {
                    if (sswitch is { InBreakCmdOn: not null, InBreakCmdOnBit: not null })
                        content.Append(
                            $"inBreakCmdOn := di.{sswitch.InBreakCmdOn.Name}.bits[{sswitch.InBreakCmdOnBit}],\n");
                    if (sswitch is { InBreakCmdOff: not null, InBreakCmdOffBit: not null })
                        content.Append(
                            $"inBreakCmdOff := di.{sswitch.InBreakCmdOff.Name}.bits[{sswitch.InBreakCmdOffBit}],\n");
                    content.Append($"StrSw := Im.{sswitch.Name});\n\n");
                    break;
                }
                case SectionSwitch sectionSwitch:
                {
                    if (sectionSwitch is { InBreakCmdOn: not null, InBreakCmdOnBit: not null })
                        content.Append(
                            $"inBreakCmdOn := di.{sectionSwitch.InBreakCmdOn.Name}.bits[{sectionSwitch.InBreakCmdOnBit}],\n");
                    if (sectionSwitch is { InBreakCmdOff: not null, InBreakCmdOffBit: not null })
                        content.Append(
                            $"inBreakCmdOff := di.{sectionSwitch.InBreakCmdOff.Name}.bits[{sectionSwitch.InBreakCmdOffBit}],\n");
                    if (sectionSwitch is { BasketInDiscreteInput: not null, BasketInDiscreteInputBit: not null })
                        content.Append(
                            $"basketRolledin := di.{sectionSwitch.BasketInDiscreteInput.Name}.bits[{sectionSwitch.BasketInDiscreteInputBit}],\n");
                    if (sectionSwitch is { BasketOutDiscreteInput: not null, BasketOutDiscreteInputBit: not null })
                        content.Append(
                            $"basketRolledout := di.{sectionSwitch.BasketOutDiscreteInput.Name}.bits[{sectionSwitch.BasketOutDiscreteInputBit}],\n");
                    if (sectionSwitch is { BasketTestDiscreteInput: not null, BasketTestDiscreteInputBit: not null })
                        content.Append(
                            $"basketTest := di.{sectionSwitch.BasketTestDiscreteInput.Name}.bits[{sectionSwitch.BasketTestDiscreteInputBit}],\n");
                    content.Append($"StrSw := Im.{sectionSwitch.Name});\n\n");
                    break;
                }
            }
        }

        foreach (var singleInput in singleInputs.Where(singleInput => singleInput is { DiscreteInput: not null, Address: not null }))
            content.Append(
                $"fb_{singleInput.Name}(signal := di.{singleInput.DiscreteInput?.Name}.bits[{singleInput.Address}], str_SS := Im.SingleSignals.{singleInput.Name});\n\n");

        foreach (var singleOutput in singleOutputs.Where(singleOutput => singleOutput is { DiscreteOutput: not null, Address: not null }))
            content.Append(
                $"fb_{singleOutput.Name}(signal := od.{singleOutput.DiscreteOutput?.Name}.bits[{singleOutput.Address}], str_SO := Im.SingleOutputs.{singleOutput.Name});\n\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Im.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Im', {ex.Message}");
        }
    }

    public async static Task GenerateProcImInitAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms,
        List<SingleInput> singleInputs, List<SingleOutput> singleOutputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Im_Init\n\n");
        content.Append("VAR_INPUT\n\tinit : BOOL;\nEND_VAR\n\n");
        content.Append(
            "VAR\n\tstKr_Ini : fb_Kran_Init;\n\tstSw_Ini : fb_Switch_Init;\n\tstOp_Ini : fb_OilPump_Init;\n" +
            "\tstSSw_Ini : fb_SectionSwitch_Init;\n\tstSs_Ini : fb_singleSignal_Init; \n\tstSo_Ini : fb_singleOutput_Init;\n" +
            "\tinits : UINT;\nEND_VAR\n\n");
        content.Append("VAR_INPUT\n\tinitiales : UINT;\nEND_VAR\n\n");
        content.Append("VAR_EXTERNAL\n\tIm : ImConfig;\nEND_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms.OrderBy(executiveMechanism => executiveMechanism.GetType().ToString()).ToList())
        {
            switch (executiveMechanism)
            {
                case Kran kran:
                    content.Append($"stKr_Ini(str_Kr := Im.{kran.Name},\n");
                    if (kran is { InDpDiscreteInput: not null, InDpDiscreteInputBit: not null })
                        content.Append("ISVALIDREF_inDp := TRUE,\n");
                    if (kran is { InSoDiscreteInput: not null, InSoDiscreteInputBit: not null })
                        content.Append("ISVALIDREF_inSo := TRUE,\n");
                    if (kran is { InSzDiscreteInput: not null, InSzDiscreteInputBit: not null })
                        content.Append("ISVALIDREF_inSz := TRUE,\n");
                    break;
                case OilPump oilPump:
                    content.Append($"stOp_Ini(str_Op := Im.{oilPump.Name},\n");
                    if (oilPump is { InBreakCmdOn: not null, InBreakCmdOnBit: not null })
                        content.Append("ISVALIDREF_inBreakCmdOn := TRUE,\n");
                    if (oilPump is { InBreakCmdOff: not null, InBreakCmdOffBit: not null })
                        content.Append("ISVALIDREF_inBreakCmdOff := TRUE,\n");
                    break;
                case Switch sswitch:
                    content.Append($"stSw_Ini(str_Sw := Im.{sswitch.Name},\n");
                    if (sswitch is { InBreakCmdOn: not null, InBreakCmdOnBit: not null })
                        content.Append("ISVALIDREF_inBreakCmdOn := TRUE,\n");
                    if (sswitch is { InBreakCmdOff: not null, InBreakCmdOffBit: not null })
                        content.Append("ISVALIDREF_inBreakCmdOff := TRUE,\n");
                    break;
                case SectionSwitch sectionSwitch:
                    content.Append($"stSSw_Ini(str_Sw := Im.{sectionSwitch.Name},\n");
                    if (sectionSwitch is { InBreakCmdOn: not null, InBreakCmdOnBit: not null })
                        content.Append("ISVALIDREF_inBreakCmdOn := TRUE,\n");
                    if (sectionSwitch is { InBreakCmdOff: not null, InBreakCmdOffBit: not null })
                        content.Append("ISVALIDREF_inBreakCmdOff := TRUE,\n");
                    if (sectionSwitch is { BasketInDiscreteInput: not null, BasketInDiscreteInputBit: not null })
                        content.Append("ISVALIDREF_basketRolledIn := TRUE,\n");
                    if (sectionSwitch is { BasketOutDiscreteInput: not null, BasketOutDiscreteInputBit: not null })
                        content.Append("ISVALIDREF_basketRolledout := TRUE,\n");
                    if (sectionSwitch is { BasketTestDiscreteInput: not null, BasketTestDiscreteInputBit: not null })
                        content.Append("ISVALIDREF_basketTest := TRUE,\n");
                    break;
            }

            if (executiveMechanism is { StatOnDiscreteInput: not null, StatOnDiscreteInputBit: not null })
                content.Append("ISVALIDREF_statOn := TRUE,\n");
            if (executiveMechanism is { StatOffDiscreteInput: not null, StatOffDiscreteInputBit: not null })
                content.Append("ISVALIDREF_statOff := TRUE,\n");
            if (executiveMechanism is { CmdOnDiscreteOutput: not null, CmdOnDiscreteOutputBit: not null })
                content.Append("ISVALIDREF_cmdOn := TRUE,\n");
            if (executiveMechanism is { CmdOffDiscreteOutput: not null, CmdOffDiscreteOutputBit: not null })
                content.Append("ISVALIDREF_cmdOff := TRUE,\n");

            content.Length -= 2;
            content.Append(");\n");

            switch (executiveMechanism)
            {
                case Kran:
                    content.Append("inits := inits + BOOL_TO_UINT(stKr_Ini.Init);\n\n");
                    break;
                case OilPump:
                    content.Append("inits := inits + BOOL_TO_UINT(stOp_Ini.Init);\n\n");
                    break;
                case Switch:
                    content.Append("inits := inits + BOOL_TO_UINT(stSw_Ini.Init);\n\n");
                    break;
                case SectionSwitch:
                    content.Append("inits := inits + BOOL_TO_UINT(stSSw_Ini.Init);\n\n");
                    break;
            }
        }

        foreach (var singleInput in singleInputs)
        {
            content.Append(
                $"stSs_Ini(data_Ini := TRUE, inverse := {(singleInput.IsInversed? "TRUE" : "FALSE")}, str_SS := Im.SingleSignals.{singleInput.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stSs_Ini.Init);\n\n");
        }

        foreach (var singleOutput in singleOutputs)
        {
            content.Append(
                $"stSo_Ini(data_Ini := TRUE, inOpcCommandsDisabled := FALSE, str_SO := Im.SingleOutputs.{singleOutput.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stSo_Ini.Init);\n\n");
        }

        content.Append("initiales := 0;\nIF init THEN initiales := inits; END_IF;");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Im_Init.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Im_Init', {ex.Message}");
        }
    }

    public async static Task GenerateProcProtectionsAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Protection\n\n");
        content.Append("VAR_EXTERNAL\n\tProtections : ProtectionsConfig;\n\tAi : AiConfig;\n\tIm : ImConfig;\nEND_VAR\n\n");
        content.Append("VAR\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"\tfb_{analogSignalProtection.Name} : fb_AiProtection;\n");

        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"\tfb_{discreteSignalProtection.Name} : fb_DiProtection;\n");
        content.Append("END_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections.Where(analogSignalProtection => analogSignalProtection.AnalogInput != null))
            content.Append(
                $"fb_{analogSignalProtection.Name}(ai := Ai.{analogSignalProtection.AnalogInput?.Name}, StrAIp := Protections.{analogSignalProtection.Name});\n\n");

        foreach (var discreteSignalProtection in discreteSignalProtections.Where(discreteSignalProtection => discreteSignalProtection.SingleInput != null))
            content.Append(
                $"fb_{discreteSignalProtection.Name}(di := Im.SingleSignals.{discreteSignalProtection.SingleInput?.Name}, StrDIp := Protections.{discreteSignalProtection.Name});\n\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Protection.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Protection', {ex.Message}");
        }
    }

    public async static Task GenerateProcProtectionsInitAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_Protections_Init\n\n");
        content.Append("VAR_INPUT\n\tinit : BOOL;\nEND_VAR\n\n");
        content.Append("VAR\n\tstDIp_Ini : fb_DiProtection_Init;\n\tstAIp_Ini : fb_AiProtection_Init;\n\tinits : UINT;\nEND_VAR\n\n");
        content.Append("VAR_INPUT\n\tinitiales : UINT;\nEND_VAR\n\n");
        content.Append("VAR_EXTERNAL\n\tProtections : ProtectionsConfig;\nEND_VAR\n\n");
        content.Append("VAR\n\t_ProtectionTags : TYPE_ProtectionTags;\n\t_StatusAi : TYPE_StatusAi;\nEND_VAR\n\n");
        content.Append("inits := 0;\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
        {
            content.Append(
                $"stAIp_Ini(data_Ini := TRUE, delay := T#{analogSignalProtection.Delay}S, inTag := _ProtectionTags.AOS, inRunOnStart := {analogSignalProtection.IsRunOnStart.ToString().ToUpper()},\n");
            content.Append(
                $"controlLimit := _StatusAi.{(analogSignalProtection.IsUpperLimitProtection? "HA" : "LA")}, str_AIp := Protections.{analogSignalProtection.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stAIp_Ini.Init);\n\n");
        }

        foreach (var discreteSignalProtection in discreteSignalProtections)
        {
            content.Append(
                $"stDIp_Ini(data_Ini := TRUE, delay := T#{discreteSignalProtection.Delay}S, inTag := _ProtectionTags.AOS, inRunOnStart := {discreteSignalProtection.IsRunOnStart.ToString().ToUpper()}, str_DIp := Protections.{discreteSignalProtection.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stDIp_Ini.Init);\n\n");
        }

        content.Append("IF init THEN initiales := inits; END_IF;");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_Protections_Init.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Proc_Protections_Init', {ex.Message}");
        }
    }

    public async static Task GenerateOpcAiGetAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Opc_Ai_get \n\n");
        content.Append("VAR_EXTERNAL\n\tAi : AiConfig;\n");

        foreach (var analogInput in analogInputs)
        {
            if (analogInput.HighWarning != null)
                content.Append($"\tAI_{analogInput.Name}_newHW : LREAL;\n");
            if (analogInput.HighAlarm != null)
                content.Append($"\tAI_{analogInput.Name}_newHA : LREAL;\n");
            if (analogInput.LowAlarm != null)
                content.Append($"\tAI_{analogInput.Name}_newLA : LREAL;\n");
            if (analogInput.LowWarning != null)
                content.Append($"\tAI_{analogInput.Name}_newLW : LREAL;\n");

            content.Append($"\tAI_{analogInput.Name}_newHL : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_newLL : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_command : UINT;\n");
        }
        content.Append("END_VAR\n\n");

        foreach (var analogInput in analogInputs)
        {
            if (analogInput.HighWarning != null)
                content.Append($"Ai.{analogInput.Name}.dHW := AI_{analogInput.Name}_newHW;\n");
            if (analogInput.HighAlarm != null)
                content.Append($"Ai.{analogInput.Name}.dHA := AI_{analogInput.Name}_newHA;\n");
            if (analogInput.LowAlarm != null)
                content.Append($"Ai.{analogInput.Name}.dLA := AI_{analogInput.Name}_newLA;\n");
            if (analogInput.LowWarning != null)
                content.Append($"Ai.{analogInput.Name}.dLW := AI_{analogInput.Name}_newLW;\n");

            content.Append($"Ai.{analogInput.Name}.dHL := AI_{analogInput.Name}_newHL;\n");
            content.Append($"Ai.{analogInput.Name}.dLL := AI_{analogInput.Name}_newLL;\n");
            content.Append($"Ai.{analogInput.Name}.inCommand_ARM := UINT_TO_WORD(AI_{analogInput.Name}_command);\n\n");
        }

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Opc_Ai_get.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Opc_Ai_get', {ex.Message}");
        }
    }

    public async static Task GenerateOpcAiSetAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Opc_Ai_set \n\n");
        content.Append("VAR_EXTERNAL\n\tAi : AiConfig;\n");

        foreach (var analogInput in analogInputs)
        {
            if (analogInput.HighWarning != null)
                content.Append($"\tAI_{analogInput.Name}_HW : LREAL;\n");
            if (analogInput.HighAlarm != null)
                content.Append($"\tAI_{analogInput.Name}_HA : LREAL;\n");
            if (analogInput.LowAlarm != null)
                content.Append($"\tAI_{analogInput.Name}_LA : LREAL;\n");
            if (analogInput.LowWarning != null)
                content.Append($"\tAI_{analogInput.Name}_LW : LREAL;\n");

            content.Append($"\tAI_{analogInput.Name}_HL : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_LL : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_value : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_status : UDINT;\n");
        }
        content.Append("END_VAR\n\n");

        foreach (var analogInput in analogInputs)
        {
            if (analogInput.HighWarning != null)
                content.Append($"AI_{analogInput.Name}_HW := Ai.{analogInput.Name}.HW;\n");
            if (analogInput.HighAlarm != null)
                content.Append($"AI_{analogInput.Name}_HA := Ai.{analogInput.Name}.HA;\n");
            if (analogInput.LowAlarm != null)
                content.Append($"AI_{analogInput.Name}_LA := Ai.{analogInput.Name}.LA;\n");
            if (analogInput.LowWarning != null)
                content.Append($"AI_{analogInput.Name}_LW := Ai.{analogInput.Name}.LW;\n");

            content.Append($"AI_{analogInput.Name}_LL := Ai.{analogInput.Name}.LL;\n");
            content.Append($"AI_{analogInput.Name}_HL := Ai.{analogInput.Name}.HL;\n");
            content.Append($"AI_{analogInput.Name}_value := Ai.{analogInput.Name}.value;\n");
            content.Append($"AI_{analogInput.Name}_status := DWORD_TO_UDINT(Ai.{analogInput.Name}.status);\n\n");
        }

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Opc_Ai_set.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Opc_Ai_set', {ex.Message}");
        }
    }

    public async static Task GenerateOpcAiInitAsync(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Opc_Ai_init \n\n");
        content.Append("VAR_EXTERNAL\n\tAi : AiConfig;\n");

        foreach (var analogInput in analogInputs)
        {
            if (analogInput.HighWarning != null)
            {
                content.Append($"\tAI_{analogInput.Name}_HW : LREAL;\n");
                content.Append($"\tAI_{analogInput.Name}_newHW : LREAL;\n");
            }

            if (analogInput.HighAlarm != null)
            {
                content.Append($"\tAI_{analogInput.Name}_HA : LREAL;\n");
                content.Append($"\tAI_{analogInput.Name}_newHA : LREAL;\n");
            }

            if (analogInput.LowAlarm != null)
            {
                content.Append($"\tAI_{analogInput.Name}_LA : LREAL;\n");
                content.Append($"\tAI_{analogInput.Name}_newLA : LREAL;\n");
            }

            if (analogInput.LowWarning != null)
            {
                content.Append($"\tAI_{analogInput.Name}_LW : LREAL;\n");
                content.Append($"\tAI_{analogInput.Name}_newLW : LREAL;\n");
            }

            content.Append($"\tAI_{analogInput.Name}_HL : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_newHL : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_LL : LREAL;\n");
            content.Append($"\tAI_{analogInput.Name}_newLL : LREAL;\n");
        }
        content.Append("END_VAR\n\n");

        foreach (var analogInput in analogInputs)
        {
            if (analogInput.HighWarning != null)
            {
                content.Append($"AI_{analogInput.Name}_HW := Ai.{analogInput.Name}.HW;\n");
                content.Append($"AI_{analogInput.Name}_newHW := Ai.{analogInput.Name}.dHW;\n");
            }

            if (analogInput.HighAlarm != null)
            {
                content.Append($"AI_{analogInput.Name}_HA := Ai.{analogInput.Name}.HA;\n");
                content.Append($"AI_{analogInput.Name}_newHA := Ai.{analogInput.Name}.dHA;\n");
            }

            if (analogInput.LowAlarm != null)
            {
                content.Append($"AI_{analogInput.Name}_LA := Ai.{analogInput.Name}.LA;\n");
                content.Append($"AI_{analogInput.Name}_newLA := Ai.{analogInput.Name}.dLA;\n");
            }

            if (analogInput.LowWarning != null)
            {
                content.Append($"AI_{analogInput.Name}_LW := Ai.{analogInput.Name}.LW;\n");
                content.Append($"AI_{analogInput.Name}_newLW := Ai.{analogInput.Name}.dLW;\n");
            }

            content.Append($"AI_{analogInput.Name}_LL := Ai.{analogInput.Name}.LL;\n");
            content.Append($"AI_{analogInput.Name}_newLL := Ai.{analogInput.Name}.dLL;\n");
            content.Append($"AI_{analogInput.Name}_HL := Ai.{analogInput.Name}.HL;\n");
            content.Append($"AI_{analogInput.Name}_newHL := Ai.{analogInput.Name}.dHL;\n\n");
        }

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Opc_Ai_init.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Opc_Ai_init', {ex.Message}");
        }
    }

    public async static Task CreateOpcImGetAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Opc_Im_get \n\n");
        content.Append("VAR_EXTERNAL\n\tIm : ImConfig;\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append($"\tIm_{executiveMechanism.Name}_inCommand_ARM : UINT;\n");
        content.Append("END_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append($"Im.{executiveMechanism.Name}.inCommand_ARM := UINT_TO_WORD(Im_{executiveMechanism.Name}_inCommand_ARM);\n\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Opc_Im_get.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Opc_Im_get', {ex.Message}");
        }
    }

    public async static Task CreateOpcImSetAsync(string pathToProjectDirectory, List<ExecutiveMechanism> executiveMechanisms, List<SingleInput> singleInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Opc_Im_set \n\n");
        content.Append("VAR_EXTERNAL\n\tIm : ImConfig;\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append($"\tIm_{executiveMechanism.Name}_status : UDINT;\n");
        foreach (var singleInput in singleInputs)
            content.Append($"\tIm_SingleSignals_{singleInput.Name}_status : UDINT;\n");
        content.Append("END_VAR\n\n");

        foreach (var executiveMechanism in executiveMechanisms)
            content.Append($"Im_{executiveMechanism.Name}_status := DWORD_TO_UDINT(Im.{executiveMechanism.Name}.status);\n\n");
        foreach (var singleInput in singleInputs)
            content.Append($"Im_SingleSignals_{singleInput.Name}_status := DWORD_TO_UDINT(Im.SingleSignals.{singleInput.Name}.status);\n\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Opc_Im_set.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Opc_Im_set', {ex.Message}");
        }
    }

    public async static Task CreateOpcProtectionsGetAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Opc_Protections_get \n\n");
        content.Append("VAR_EXTERNAL\n\tProtections : ProtectionsConfig;\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"\tProtections_{analogSignalProtection.Name}_inCommand_ARM : UINT;\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"\tProtections_{discreteSignalProtection.Name}_inCommand_ARM : UINT;\n");
        content.Append("END_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append(
                $"Protections.{analogSignalProtection.Name}.inCommand_ARM := UINT_TO_WORD(Protections_{analogSignalProtection.Name}_inCommand_ARM);\n\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append(
                $"Protections.{discreteSignalProtection.Name}.inCommand_ARM := UINT_TO_WORD(Protections_{discreteSignalProtection.Name}_inCommand_ARM);\n\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Opc_Protections_get.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Opc_Protections_get', {ex.Message}");
        }
    }

    public async static Task CreateOpcProtectionsSetAsync(string pathToProjectDirectory, List<AnalogSignalProtection> analogSignalProtections,
        List<DiscreteSignalProtection> discreteSignalProtections)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Opc_Protections_set \n\n");
        content.Append("VAR_EXTERNAL\n\tProtections : ProtectionsConfig;\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"\tProtections_{analogSignalProtection.Name}_status : UDINT;\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"\tProtections_{discreteSignalProtection.Name}_status : UDINT;\n");
        content.Append("END_VAR\n\n");

        foreach (var analogSignalProtection in analogSignalProtections)
            content.Append($"Protections_{analogSignalProtection.Name}_status := DWORD_TO_UDINT(Protections.{analogSignalProtection.Name}.status);\n\n");
        foreach (var discreteSignalProtection in discreteSignalProtections)
            content.Append($"Protections_{discreteSignalProtection.Name}_status := DWORD_TO_UDINT(Protections.{discreteSignalProtection.Name}.status);\n\n");

        try
        {
            await FileWork.CreateFileAsync($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Opc_Protections_set.st", content);
        }
        catch (Exception ex)
        {
            throw new Exception($"Exception trying generate 'Opc_Protections_set', {ex.Message}");
        }
    }
}