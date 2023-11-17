using System;
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
    private readonly DataTypesMainPage _configMainPage;
    private readonly ConfigsPage _dataTypesPage;
    private readonly FunctionalBlocksPage _functionalBlocksPage;
    private readonly FunctionsPage _functionsPage;
    private readonly App _currentApp;

    public MainWindow()
    {
        _configMainPage = new DataTypesMainPage();
        _dataTypesPage = new ConfigsPage();
        _functionalBlocksPage = new FunctionalBlocksPage();
        _functionsPage = new FunctionsPage();
        _currentApp = (App) Application.Current;
        InitializeComponent();

        Closing += MainWindow_Closing;
    }

    private void MainWindow_Closing(object? sender, System.ComponentModel.CancelEventArgs e)
    {
        var result = MessageBox.Show("Save config?", "", MessageBoxButton.YesNoCancel);

        switch (result)
        {
            case MessageBoxResult.No:
                break;
            case MessageBoxResult.Yes:
                FileWork.WriteConfigToTxt(_currentApp.PathToProject);
                break;
            case MessageBoxResult.None:
                e.Cancel = true;
                break;
            case MessageBoxResult.OK:
                e.Cancel = true;
                break;
            case MessageBoxResult.Cancel:
                e.Cancel = true;
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
    }

    private void ShowConfigButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_configMainPage);

    private void ShowDataTypesButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_dataTypesPage);

    private void ShowFunctionsButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_functionsPage);

    private void ShowFunctionBlocksButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_functionalBlocksPage);
}