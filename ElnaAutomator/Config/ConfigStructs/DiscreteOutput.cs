using System.Collections.Generic;
using ElnaAutomator.ConfigStructs;

namespace ElnaAutomator.Config.ConfigStructs;

public class DiscreteOutput
{
    public required string Name { get; set; }
    public List<SingleOutput>? SingleOutputs { get; set; } 
}