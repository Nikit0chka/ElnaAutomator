using System.Windows;
using System.Windows.Controls;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class DataTypesMainPage : Page
{
    private readonly AnalogInputsPage _analogInputsPage;
    private readonly DiscreteInputsPage _discreteInputsPage;
    private readonly DiscreteOutputsPage _discreteOutputsPage;
    private readonly ProtectionsPage _protectionsPage;
    private readonly ExecutiveMechanismPage _executiveMechanismPage;
    private readonly SingleSignalsPage _singleSignalsPage;

    public DataTypesMainPage()
    {
        _analogInputsPage = new AnalogInputsPage();
        _discreteInputsPage = new DiscreteInputsPage();
        _discreteOutputsPage = new DiscreteOutputsPage();
        _protectionsPage = new ProtectionsPage();
        _executiveMechanismPage = new ExecutiveMechanismPage();
        _singleSignalsPage = new SingleSignalsPage();

        InitializeComponent();
    }

    private void AnalogSignalsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_analogInputsPage);
    }

    private void DiscreteInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_discreteInputsPage);
    }

    private void DiscreteOutputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_discreteOutputsPage);
    }

    private void SingleInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_executiveMechanismPage);
    }

    private void ProtectionsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_protectionsPage);
    }

    private void SingleSignalsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_singleSignalsPage);
    }
}