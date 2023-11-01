using System.Windows;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class DataTypesMainPage
{
    private readonly AnalogInputsPage _analogInputsPage;
    private readonly DiscreteInputsPage _discreteInputsPage;
    private readonly DiscreteOutputsPage _discreteOutputsPage;
    private readonly AnalogSignalsProtectionsPage _analogSignalsProtectionsPage;
    private readonly ExecutiveMechanismPage _executiveMechanismPage;
    private readonly SingleInputsPage _singleInputsPage;
    private readonly DiscreteSignalsProtectionsPage _discreteSignalsProtectionsPage;

    public DataTypesMainPage()
    {
        _analogInputsPage = new AnalogInputsPage();
        _discreteInputsPage = new DiscreteInputsPage();
        _discreteOutputsPage = new DiscreteOutputsPage();
        _analogSignalsProtectionsPage = new AnalogSignalsProtectionsPage();
        _executiveMechanismPage = new ExecutiveMechanismPage();
        _singleInputsPage = new SingleInputsPage();
        _discreteSignalsProtectionsPage = new DiscreteSignalsProtectionsPage();

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

    private void AnalogInputsProtectionsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_analogSignalsProtectionsPage);
    }

    private void SingleInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_singleInputsPage);
    }

    private void ExecutiveMechanismsShowButtons_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_executiveMechanismPage);
    }
    private void DiscreteSignalsProtectionsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_discreteSignalsProtectionsPage);
    }
}