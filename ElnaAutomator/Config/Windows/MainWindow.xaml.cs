using System.Windows;
using ElnaAutomator.Config.Pages.ConfigPages;
using ElnaAutomator.Config.Pages.DataTypesPages;
using ElnaAutomator.Config.Pages.FunctionBlocksPages;
using ElnaAutomator.Config.Pages.FunctionsPage;

namespace ElnaAutomator.Config.Windows;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow
{
    private readonly ConfigMainPage _configMainPage;
    private readonly DataTypesPage _dataTypesPage;
    private readonly FunctionalBlocksPage _functionalBlocksPage;
    private readonly FunctionsPage _functionsPage;

    public MainWindow()
    {
        _configMainPage = new ConfigMainPage();
        _dataTypesPage = new DataTypesPage();
        _functionalBlocksPage = new FunctionalBlocksPage();
        _functionsPage = new FunctionsPage();

        InitializeComponent();
    }

    private void ShowConfigButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_configMainPage);
    }

    private void ShowDataTypesButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_dataTypesPage);
    }

    private void ShowFunctionsButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_functionsPage);
    }

    private void ShowFunctionBlocksButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_functionalBlocksPage);
    }
}