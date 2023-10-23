// using System;
// using System.Collections.Generic;
// using System.Linq;
// using ElnaAutomator.Config.ConfigStructs;
// using IronXL;
//
// namespace ElnaAutomator.Config;
//
// public static class ExcelReader
// {
//     public static void ReadExel(string pathToFile)
//     {
//         WorkBook workbook = WorkBook.Load(pathToFile);
//         WorkSheet sheet = workbook.WorkSheets[0];
//
//         for (int row = 1; !string.IsNullOrEmpty(sheet[$"A{row}"].StringValue); row++)
//         {
//         }
//     }
//
//     public static List<AnalogInput> ReadAiFromFile(string pathToFile)
//     {
//         WorkBook workbook = WorkBook.Load(pathToFile);
//         WorkSheet sheet = workbook.WorkSheets[0];
//         var analogInputs = new List<AnalogInput>();
//
//         for (int row = 1; !string.IsNullOrEmpty(sheet[$"A{row}"].StringValue); row++)
//         {
//             AnalogInput analogInput = new()
//             {
//                 Name = sheet[$"A{row}"].StringValue,
//                 LowLimit = Convert.ToInt32(sheet[$"B{row}"].StringValue),
//                 LowAlarm = sheet[$"C{row}"].StringValue != "#" ? Convert.ToInt32(sheet[$"C{row}"].StringValue) : null,
//                 LowWarning = sheet[$"D{row}"].StringValue != "#" ? Convert.ToInt32(sheet[$"D{row}"].StringValue) : null,
//                 HighWarning =
//                     sheet[$"E{row}"].StringValue != "#" ? Convert.ToInt32(sheet[$"E{row}"].StringValue) : null,
//                 HighAlarm = sheet[$"F{row}"].StringValue != "#" ? Convert.ToInt32(sheet[$"F{row}"].StringValue) : null,
//                 HighLimit = Convert.ToInt32(sheet[$"G{row}"].StringValue)
//             };
//
//             analogInputs.Add(analogInput);
//         }
//
//         return analogInputs;
//     }
//
//     public static List<DiscreteInput> ReadDiFromFile(string pathToFile)
//     {
//         WorkBook workbook = WorkBook.Load(pathToFile);
//         WorkSheet sheet = workbook.WorkSheets[0];
//         var discreteInputs = new List<DiscreteInput>();
//
//         for (int row = 1;
//              sheet[$"A{row}"].StringValue.Contains("DI") && !string.IsNullOrEmpty(sheet[$"A{row}"].StringValue);
//              row++)
//         {
//             DiscreteInput discreteInput = new(name: $"DI{row}");
//
//             discreteInputs.Add(discreteInput);
//         }
//
//         return discreteInputs;
//     }
//
//     public static List<DiscreteOutput> ReadDoFromFile(string pathToFile)
//     {
//         WorkBook workbook = WorkBook.Load(pathToFile);
//         WorkSheet sheet = workbook.WorkSheets[0];
//         var discreteOutputs = new List<DiscreteOutput>();
//
//         for (int row = 1;
//              sheet[$"A{row}"].StringValue.Contains("DOz") && !string.IsNullOrEmpty(sheet[$"A{row}"].StringValue);
//              row++)
//         {
//             DiscreteOutput discreteOutput = new(name: $"DI{row}");
//
//             discreteOutputs.Add(discreteOutput); 
//         }
//
//         return discreteOutputs;
//     }
// }