using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Pages.ConfigsPages;

public partial class OilPumpsPage
{
    private readonly App _currentApp;

    //инициализация
    public OilPumpsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        OilPumpsDataGrid.ItemsSource = _currentApp.OilPumps;
        OilPumpStatOnDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        OilPumpStatOffDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        OilPumpCmdOffDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        OilPumpCmdOnDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        OilPumpInBreakCmdOn.ItemsSource = _currentApp.DiscreteInputs;
        OilPumpInBreakCmdOff.ItemsSource = _currentApp.DiscreteInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddOilPump_OnClick(object sender, RoutedEventArgs e)
    {
        var newOilPump = new OilPump()
        {
            Name = $"OilPump{_currentApp.OilPumps.Count}"
        };

        _currentApp.OilPumps.Add(newOilPump);
        OilPumpsDataGrid.Items.Refresh();
    }

    private void DeleteOilPump_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in OilPumpsDataGrid.Items)
        {
            var row = (DataGridRow) OilPumpsDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || OilPumpsDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is OilPump oilPump)
                _currentApp.OilPumps.Remove(oilPump);
        });

        OilPumpsDataGrid.Items.Refresh();
    }
}