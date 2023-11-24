using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Pages.ConfigsPages;

public partial class AnalogInputsPage
{
    private readonly App _currentApp;

    //инициализация
    public AnalogInputsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        AiDataGrid.ItemsSource = _currentApp.AnalogInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddAi_OnClick(object sender, RoutedEventArgs e)
    {
        var newAnalogInput = new AnalogInput
        {
            Name = $"Ai{_currentApp.AnalogInputs.Count}",
            HighLimit = 0,
            LowLimit = 0,
            ModuleId = 0
        };
        _currentApp.AnalogInputs.Add(newAnalogInput);
        AiDataGrid.Items.Refresh();
    }

    private void DeleteAi_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in AiDataGrid.Items)
        {
            var row = (DataGridRow) AiDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || AiDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is AnalogInput analogInput)
                _currentApp.AnalogInputs.Remove(analogInput);
        });

        AiDataGrid.Items.Refresh();
    }
}