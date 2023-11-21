using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class SwitchesPage
{
    private readonly App _currentApp;

    //инитиализация
    public SwitchesPage()
    {
        _currentApp = (App) Application.Current;

        InitializeComponent();
        SwitchesDataGrid.ItemsSource = _currentApp.Switches;
        SwitchStatOnDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SwitchStatOffDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SwitchCmdOffDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        SwitchCmdOnDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        SwitchInBreakCmdOff.ItemsSource = _currentApp.DiscreteInputs;
        SwitchInBreakCmdOn.ItemsSource = _currentApp.DiscreteInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddSwitch_OnClick(object sender, RoutedEventArgs e)
    {
        var newSwitch = new Switch()
        {
            Name = $"Switch{_currentApp.Switches.Count}"
        };

        _currentApp.Switches.Add(newSwitch);
        SwitchesDataGrid.Items.Refresh();
    }

    private void DeleteSwitch_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in SwitchesDataGrid.Items)
        {
            var row = (DataGridRow) SwitchesDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || SwitchesDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is Switch @switch)
                _currentApp.Switches.Remove(@switch);
        });

        SwitchesDataGrid.Items.Refresh();
    }
}