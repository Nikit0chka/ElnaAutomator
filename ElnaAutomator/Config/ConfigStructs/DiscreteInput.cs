using System.Collections.Generic;
using ElnaAutomator.ConfigStructs;

namespace ElnaAutomator.Config.ConfigStructs;

public class DiscreteInput
{
    public required string Name { get; set; }
    public List<SingleInput>? SingleInput{ get; set; }
}