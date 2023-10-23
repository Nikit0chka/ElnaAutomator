using System.Windows;
using ElnaAutomator.Config.Pages;
using ElnaAutomator.Pages;

namespace ElnaAutomator.Config.Windows;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow
{
    private readonly ConfigMainPage _configMainPage;

    public MainWindow()
    {
        _configMainPage = new ConfigMainPage();
        InitializeComponent();
    }
    
    private void ShowConfigButton_OnClick(object sender, RoutedEventArgs e)
    {
        MainFrame.Navigate(_configMainPage);
    }
}