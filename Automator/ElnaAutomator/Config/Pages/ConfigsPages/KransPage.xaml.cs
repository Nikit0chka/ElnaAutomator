using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Pages.ConfigsPages;

public partial class KransPage
{
    private readonly App _currentApp;

    //инициализация
    public KransPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        KransDataGrid.ItemsSource = _currentApp.Krans;
        KranStatOnDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        KranStatOffDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        KranCmdOffDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        KranCmdOnDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        KranInSoDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        KranInSzDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        KranInDpDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddKran_OnClick(object sender, RoutedEventArgs e)
    {
        var newKran = new Kran()
        {
            Name = $"Kran{_currentApp.Krans.Count}"
        };

        _currentApp.Krans.Add(newKran);
        KransDataGrid.Items.Refresh();
    }

    private void DeleteKran_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in KransDataGrid.Items)
        {
            var row = (DataGridRow) KransDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || KransDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is Kran kran)
                _currentApp.Krans.Remove(kran);
        });

        KransDataGrid.Items.Refresh();
    }
}