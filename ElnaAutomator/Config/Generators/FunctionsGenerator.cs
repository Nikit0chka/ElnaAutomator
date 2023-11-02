using System.Collections.Generic;
using System.IO;
using System.Text;
using ElnaAutomator.Config.ConfigStructs;
using Microsoft.Extensions.Primitives;

namespace ElnaAutomator.Config.Generators;

public class FunctionsGenerator
{
    private const string FunctionsFolderName = "Functions";

    public static void GenerateAnyAnalogPs(string pathToProjectDirectory, List<AnalogInput> analogInputs)
    {
        StringBuilder content = new();

        content.Append("FUNCTION AnyAnalogsPs : BOOL\n\n");
        content.Append("VAR_INPUT\n\tai : AiConfig;\nEND_VAR\n\n");
        content.Append("VAR\n\tstatusAi : TYPE_StatusAi;\nEND_VAR\n\n");

        content.Append("anyAnalogsPs := \n");

        foreach (var analogInput in analogInputs)
        {
            content.Append($"ai.{analogInput.Name}.interval = statusAi.HW OR\n");
            content.Append($"ai.{analogInput.Name}.interval = statusAi.LW OR\n");
        }

        content.Length -= 4;
        content.Append(';');

        CreateFile($@"{pathToProjectDirectory}\{FunctionsFolderName}\AnyAnalogsPs.st", content);
    }


    private static void CreateFile(string path, StringBuilder content)
    {
        File.WriteAllText(path, content.ToString());
    }
}