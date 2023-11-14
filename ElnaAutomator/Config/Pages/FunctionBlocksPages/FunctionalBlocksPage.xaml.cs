using System.Linq;
using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionBlocksPages;

public partial class FunctionalBlocksPage
{
    private readonly App _currentApp;

    public FunctionalBlocksPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
    }

    private void ProcAiInit_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcAiInit(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());

    private void ProcAi_OnClick(object sender, RoutedEventArgs e) =>
        FunctionBlocksGenerator.GenerateProcAi(_currentApp.PathToProject, _currentApp.AnalogInputs.ToList());
}