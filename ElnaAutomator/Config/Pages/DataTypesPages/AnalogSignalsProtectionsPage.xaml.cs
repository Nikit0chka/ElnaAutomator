using System.Windows;
using System.Windows.Controls;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class AnalogSignalsProtectionsPage
{
    private readonly App? _currentApp;
    public AnalogSignalsProtectionsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
        AiProtectionsDataGrid.ItemsSource = _currentApp?.AnalogInputs;
        var asd = AiProtectionsDataGrid.FindName("AnalogSignalCmbBBx") as ComboBox;
        asd!.ItemsSource = _currentApp?.AnalogInputs;
    }
}