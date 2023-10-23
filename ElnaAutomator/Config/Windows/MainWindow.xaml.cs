using System.Windows;
using ElnaAutomator.Config.Pages;
using ElnaAutomator.Config.Pages.DataTypesPages;

namespace ElnaAutomator.Config.Windows;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow
{
    private readonly DataTypesMainPage _configMainPage;

    public MainWindow()
    {
        _configMainPage = new DataTypesMainPage();
        InitializeComponent();
    }
    
    private void ShowConfigButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_configMainPage);
    }
}