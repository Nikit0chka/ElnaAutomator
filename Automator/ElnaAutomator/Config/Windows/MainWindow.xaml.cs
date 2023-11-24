using System.Linq;
using System.Windows;
using ElnaAutomator.Config.FileOperations;
using ElnaAutomator.Config.Pages.ConfigsPages;
using ElnaAutomator.Config.Pages.DataTypesPages;
using ElnaAutomator.Config.Pages.FunctionBlocksPages;
using ElnaAutomator.Config.Pages.FunctionsPage;

namespace ElnaAutomator.Config.Windows;

public partial class MainWindow
{
    //страницы для отоброжения во фрейме
    private readonly ConfigMainPage _configMainPage;
    private readonly DataTypesPage _dataTypesPage;
    private readonly FunctionalBlocksPage _functionalBlocksPage;
    private readonly FunctionsPage _functionsPage;
    private readonly App _currentApp;

    public MainWindow()
    {
        _configMainPage = new ConfigMainPage();
        _dataTypesPage = new DataTypesPage();
        _functionalBlocksPage = new FunctionalBlocksPage();
        _functionsPage = new FunctionsPage();
        _currentApp = (App) Application.Current;
        InitializeComponent();
        MainFrame.Navigate(_configMainPage);

        Closing += MainWindow_Closing;
    }

    //логика обработки ответа пользователя на предложение сохарнения конфига
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
                e.Cancel = true;
                break;
        }
    }

    //навигация по нажатию кнопок
    private void ShowConfigButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_configMainPage);

    private void ShowDataTypesButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_dataTypesPage);

    private void ShowFunctionsButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_functionsPage);

    private void ShowFunctionBlocksButton_OnClick(object sender, RoutedEventArgs e) =>
        MainFrame.Navigate(_functionalBlocksPage);

    private void ShowGeneratorChooseWindow_OnClick(object sender, RoutedEventArgs e)
    {
        var generatorChooseWindow = _currentApp.Windows.OfType<GeneratorChooseWindow>().FirstOrDefault() ?? new GeneratorChooseWindow();
        generatorChooseWindow.Owner = this;
        generatorChooseWindow.WindowState = WindowState.Normal;
        generatorChooseWindow.Activate();
        generatorChooseWindow.Show();
    }
}