using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.IO;
using ElnaAutomator.Config.ConfigStructs;
using CsvHelper;

namespace ElnaAutomator.Config;

public static class ExcelWork
{
    public const string ExcelFolderName = "OpcTags";

    public static void CreateOpcImTags(string pathToProject, List<SingleInput> singleInputs, List<ExecutiveMechanism> executiveMechanisms)
    {
        try
        {
            var records = new List<dynamic>();

            foreach (var executiveMechanism in executiveMechanisms)
            {
                records.Add(new
                {
                    Node = "IM", Name = $"IM_{executiveMechanism.Name}_inCommand_ARM", data_type = "UINT", @class = "inout", archiving = "false",
                    strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "IM", Name = $"IM_{executiveMechanism.Name}_status", data_type = "UDINT", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
            }

            for (var i = 0; i < singleInputs.Count; i++)
                records.Add(new
                {
                    Node = "IM", Name = $"IM_SingleSignals_{executiveMechanisms[i].Name}_status", data_type = "UDINT", @class = "inout", archiving = "false",
                    strategy = "VALUESET", initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });

            using var writer = new StreamWriter($@"{pathToProject}\{ExcelFolderName}\Opc_Im_Tags.csv");

            using var csv = new CsvWriter(writer, CultureInfo.InvariantCulture);

            csv.WriteRecords((IEnumerable) records);
        }

        catch (Exception ex)
        {
            throw new Exception($"Exception trying create OpcImTags.csv, {ex}");
        }
    }

    public static void CreateOpcAiTags(string pathToProject, List<AnalogInput> analogInputs)
    {
        try
        {
            var records = new List<dynamic>();

            foreach (var analogInput in analogInputs)
            {
                records.Add(new
                {
                    Node = "AI", Name = $"AI_{analogInput.Name}_status", data_type = "UDINT", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "AI", Name = $"AI_{analogInput.Name}_command", data_type = "UINT", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "AI", Name = $"AI_{analogInput.Name}_value", data_type = "LREAL", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "AI", Name = $"AI_{analogInput.Name}_HL", data_type = "LREAL", @class = "inout", archiving = "false",
                    strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "AI", Name = $"AI_{analogInput.Name}_LL", data_type = "LREAL", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "AI", Name = $"AI_{analogInput.Name}_newHL", data_type = "LREAL", @class = "inout", archiving = "false",
                    strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "AI", Name = $"AI_{analogInput.Name}_newLL", data_type = "LREAL", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });

                if (analogInput.HighAlarm != null)
                {
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_HA", data_type = "LREAL", @class = "inout", archiving = "false",
                        strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_newHA", data_type = "LREAL", @class = "inout", archiving = "false", strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                }

                if (analogInput.HighWarning != null)
                {
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_HW", data_type = "LREAL", @class = "inout", archiving = "false",
                        strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_newHW", data_type = "LREAL", @class = "inout", archiving = "false", strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                }

                if (analogInput.LowAlarm != null)
                {
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_LA", data_type = "LREAL", @class = "inout", archiving = "false",
                        strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_newLA", data_type = "LREAL", @class = "inout", archiving = "false", strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                }

                if (analogInput.LowWarning != null)
                {
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_LW", data_type = "LREAL", @class = "inout", archiving = "false",
                        strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                    records.Add(new
                    {
                        Node = "AI", Name = $"AI_{analogInput.Name}_newLW", data_type = "LREAL", @class = "inout", archiving = "false", strategy = "VALUESET",
                        initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                    });
                }
            }

            using var writer = new StreamWriter($@"{pathToProject}\{ExcelFolderName}\Opc_Ai_Tags.csv");

            using var csv = new CsvWriter(writer, CultureInfo.InvariantCulture);

            csv.WriteRecords((IEnumerable) records);
        }

        catch (Exception ex)
        {
            throw new Exception($"Exception trying create OpcImTags.csv, {ex}");
        }
    }
    
    public static void CreateOpcProtectionsTags(string pathToProject, List<AnalogSignalProtection> analogSignalProtections, List<DiscreteSignalProtection> discreteSignalProtections)
    {
        try
        {
            var records = new List<dynamic>();

            foreach (var discreteSignalProtection in discreteSignalProtections)
            {
                records.Add(new
                {
                    Node = "Protections", Name = $"Protections_{discreteSignalProtection.Name}_inCommand_ARM", data_type = "UINT", @class = "inout", archiving = "false",
                    strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "Protections", Name = $"Protections_{discreteSignalProtection.Name}_status", data_type = "UDINT", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
            }

            foreach (var analogSignalProtection in analogSignalProtections)
            {
                records.Add(new
                {
                    Node = "Protections", Name = $"Protections_{analogSignalProtection.Name}_inCommand_ARM", data_type = "UINT", @class = "inout", archiving = "false",
                    strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
                records.Add(new
                {
                    Node = "Protections", Name = $"Protections_{analogSignalProtection.Name}_status", data_type = "UDINT", @class = "inout", archiving = "false", strategy = "VALUESET",
                    initStore = "1", responseSize = "1", pollInterval = "1", Description = ""
                });
            }

            using var writer = new StreamWriter($@"{pathToProject}\{ExcelFolderName}\Opc_Im_Tags.csv");

            using var csv = new CsvWriter(writer, CultureInfo.InvariantCulture);

            csv.WriteRecords((IEnumerable) records);
        }

        catch (Exception ex)
        {
            throw new Exception($"Exception trying create OpcImTags.csv, {ex}");
        }
    }
}