using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Pages;

namespace ElnaAutomator.Config.Pages;

public partial class ConfigMainPage : Page
{
    private readonly AnalogInputsPage _analogInputsPage;
    private readonly DiscreteInputsPage _discreteInputsPage;
    private readonly DiscreteOutputsPage _discreteOutputsPage;
    private readonly ProtectionsPage _protectionsPage;
    private readonly ExecutiveMechanismPage _singleInputsPage;
    
    public ConfigMainPage()
    {
        _analogInputsPage = new AnalogInputsPage();
        _discreteInputsPage = new DiscreteInputsPage();
        _discreteOutputsPage = new DiscreteOutputsPage();
        _protectionsPage = new ProtectionsPage();
        _singleInputsPage = new ExecutiveMechanismPage();
        
        InitializeComponent();
    }

    private void AnalogSignalsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_analogInputsPage);
    }

    private void DiscreteInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Content = _discreteInputsPage;
    }

    private void DiscreteOutputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_discreteOutputsPage);
    }

    private void SingleInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_singleInputsPage);
    }

    private void ProtectionsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_protectionsPage);
    }
}