using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Generators;

public static class FunctionBlocksGenerator
{
    private const string FunctionBlocksFolderName = "FunctionBlocks";

    public static void GenerateProcAiInit(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_AI_Init\n\n");
        content.Append("VAR_INPUT\n\tinit : BOOL;\nEND_VAR\n\n");
        content.Append("VAR\n\tstAI_Ini : fb_AI_Init;\n\tinits : UINT;\nEND_VAR\n\n");
        content.Append("VAR_INPUT\n\tinitiales : UINT;\nEND_VAR\n\n");
        content.Append("VAR_EXTERNAL\n\tAi : AiConfig;\nEND_VAR\n\n");

        content.Append("inits := 0;\n\n");

        foreach (var analogInput in analogInputs)
        {
            content.Append($"stAI_Ini(data_Ini := TRUE, dLL := {analogInput.LowAlarm}, dHL := {analogInput.HighAlarm},\n");
            if (analogInput.LowWarning != null)
                content.Append($"ISVALIDREF_LW := TRUE, dLW := {analogInput.LowWarning},\n");
            if (analogInput.HighWarning != null)
                content.Append($"ISVALIDREF_HW := TRUE, dHW := {analogInput.HighWarning},\n");
            if (analogInput.LowAlarm != null)
                content.Append($"ISVALIDREF_LA := TRUE, dLA := {analogInput.LowAlarm},\n");
            if (analogInput.HighAlarm != null)
                content.Append($"ISVALIDREF_HA := TRUE, dHA := {analogInput.HighAlarm},\n");

            content.Append($"strAI := Ai.{analogInput.Name});\n");
            content.Append("inits := inits + BOOL_TO_UINT(stAI_Ini.Init);\n\n");
        }

        content.Append("\ninitiales := 0;\nIF init THEN initiales := inits; END_IF;");

        CreateFile($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_AI_Init.st", content);
    }

    public static void GenerateProcAi(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION_BLOCK Proc_AI\n\n");
        content.Append("VAR\n");

        foreach (var analogInput in analogInputs)
            content.Append($"\tfb_{analogInput.Name} : fb_AiSourceMlp;\n");

        content.Append("END_VAR\n\n");
        content.Append("VAR_EXTERNAL\n");
        content.Append("Ai : AiConfig");

        for (var i = 0; i < analogInputs.Count; i++)
            content.Append($"\tarAIN_{i} : TItemAIN;\n");
        for (var i = 0; i < analogInputs.Count; i++)
            content.Append($"\tAI_{i}_dblValue : LREAL;\n");

        var modules = analogInputs.Select(c => c.ModuleAddress).ToList();

        foreach (var t in modules)
            content.Append($"\tarERR_{t};\n");

        //ne ponual kak sdelat A1_10_err_mode
        content.Append("END_VAR\n");

        for (var i = 0; i < analogInputs.Count; i++)
        {
            content.Append(
                $"fb_{analogInputs[i].Name}(arAIN := arAIN_{i}, strAI := ai.{analogInputs[i].Name}, err_mod := arERR_{analogInputs[i].ModuleAddress};\n");
            content.Append(
                $"AI_{i}_dblValue := arAIN{i}.dblValue;\n");
        }

        CreateFile($@"{pathToProjectDirectory}\{FunctionBlocksFolderName}\Proc_AI.st", content);
    }

    private static void CreateFile(string path, StringBuilder content)
    {
        try
        {
            File.WriteAllText(path, content.ToString());
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }
    }
}