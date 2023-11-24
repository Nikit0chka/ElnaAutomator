using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Pages.ConfigsPages;

public partial class SectionSwitchesPage
{
    private readonly App _currentApp;

    //инициализация
    public SectionSwitchesPage()
    {
        _currentApp = (App) Application.Current;
        InitializeComponent();

        SectionSwitchesDataGrid.ItemsSource = _currentApp.SectionSwitches;
        SectionSwitchStatOnDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchStatOffDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchCmdOffDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        SectionSwitchBasketInDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchBasketOutDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchCmdOnDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        SectionSwitchInBreakCmdOn.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchInBreakCmdOff.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchBasketTestDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddSectionsSwitch_OnClick(object sender, RoutedEventArgs e)
    {
        var sectionSwitch = new SectionSwitch()
        {
            Name = $"SectionSwitch{_currentApp.SectionSwitches.Count}"
        };

        _currentApp.SectionSwitches.Add(sectionSwitch);
        SectionSwitchesDataGrid.Items.Refresh();
    }
    private void DeleteSectionSwitch_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in SectionSwitchesDataGrid.Items)
        {
            var row = (DataGridRow) SectionSwitchesDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || SectionSwitchesDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is SectionSwitch sectionSwitch)
                _currentApp.SectionSwitches.Remove(sectionSwitch);
        });

        SectionSwitchesDataGrid.Items.Refresh();
    }
}