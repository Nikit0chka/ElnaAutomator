using System.Collections.Generic;
using ElnaAutomator.Config.ConfigStructs;
using IronXL;

namespace ElnaAutomator.Config;

public static class ExcelWork
{
    public const string ExcelFolderName = "OpcTags";

    public static void CreateOpcIm(string pathToProject, List<SingleInput> singleInputs, List<ExecutiveMechanism> executiveMechanisms)
    {
        var workBook = new WorkBook();
        var worksheet = workBook.DefaultWorkSheet;
        worksheet["A1"].Value = "Node";
        worksheet["B1"].Value = "Name";
        worksheet["C1"].Value = "data_type";
        worksheet["D1"].Value = "class";
        worksheet["E1"].Value = "archiving";
        worksheet["F1"].Value = "strategy";
        worksheet["G1"].Value = "initStore";
        worksheet["H1"].Value = "responseSize";
        worksheet["A1"].Value = "pollInterval";
        worksheet["I1"].Value = "Description";

        for (var sheetIndex = 2; sheetIndex < singleInputs.Count + executiveMechanisms.Count; sheetIndex++)
        {
            worksheet[$"A{sheetIndex}"].Value = "IM";
            worksheet[$"D{sheetIndex}"].Value = "inout";
            worksheet[$"E{sheetIndex}"].Value = "false";
            worksheet[$"F{sheetIndex}"].Value = "VALUESET";
            worksheet[$"G{sheetIndex}"].Value = "1";
            worksheet[$"H{sheetIndex}"].Value = "1";
            worksheet[$"I{sheetIndex}"].Value = "1";
        }

        for (int sheetIndex = 2, i = 0; i < singleInputs.Count; i++, sheetIndex++)
        {
            worksheet[$"B{sheetIndex}"].Value = $"IM_SingleSignals_{singleInputs[i].Name}_status";
            worksheet[$"C{sheetIndex}"].Value = "UDINT";
        }

        for (int sheetIndex = 2, i = 0; i < executiveMechanisms.Count; i++, sheetIndex++)
        {
            worksheet[$"B{sheetIndex}"].Value = $"IM_{executiveMechanisms[i].Name}_status";
            worksheet[$"C{sheetIndex}"].Value = "UDINT";
        }

        for (int sheetIndex = 2, i = 0; i < executiveMechanisms.Count; i++, sheetIndex++)
        {
            worksheet[$"B{sheetIndex}"].Value = $"IM_{executiveMechanisms[i].Name}_inCommand_ARM";
            worksheet[$"C{sheetIndex}"].Value = "UINT";
        }

        workBook.SaveAsCsv($"{pathToProject}\\{ExcelFolderName}\\OpcImTags.csv", ",");
    }
}