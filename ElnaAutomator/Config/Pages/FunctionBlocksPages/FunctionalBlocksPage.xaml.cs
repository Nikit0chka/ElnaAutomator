using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionBlocksPages;

public partial class FunctionalBlocksPage
{
    private readonly App? _currentApp;

    public FunctionalBlocksPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
    }

    private void ProcAiInit_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionBlocksGenerator.GenerateProcAiInit(_currentApp.PathToProject, _currentApp.AnalogInputs);
    }
}