using System.Windows;
using ElnaAutomator.Config.Generators;

namespace ElnaAutomator.Config.Pages.FunctionsPage;

public partial class FunctionsPage
{
    private readonly App? _currentApp;

    public FunctionsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
    }

    private void AnyAnalogPsFunc_OnClick(object sender, RoutedEventArgs e)
    {
        if (_currentApp != null)
            FunctionsGenerator.GenerateAnyAnalogPs(_currentApp.PathToProject, _currentApp.AnalogInputs);
    }
}