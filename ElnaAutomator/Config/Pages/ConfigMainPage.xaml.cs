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
    private readonly SingleInputsPage _singleInputsPage;
    private readonly SingleOutputsPage _singleOutputsPage;
    
    public ConfigMainPage()
    {
        _analogInputsPage = new AnalogInputsPage();
        _discreteInputsPage = new DiscreteInputsPage();
        _discreteOutputsPage = new DiscreteOutputsPage();
        _protectionsPage = new ProtectionsPage();
        _singleInputsPage = new SingleInputsPage();
        _singleOutputsPage = new SingleOutputsPage();
        
        InitializeComponent();
    }

    private void AnalogSignalsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_analogInputsPage);
    }

    private void DiscreteInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_discreteInputsPage);
    }

    private void DiscreteOutputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_discreteOutputsPage);
    }

    private void SingleInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_singleInputsPage);
    }

    private void SingleOutputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_singleOutputsPage);
    }

    private void ProtectionsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_protectionsPage);
    }
}