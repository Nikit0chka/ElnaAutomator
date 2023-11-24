using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Pages.ConfigsPages;

public partial class AnalogSignalsProtectionsPage
{
    private readonly App _currentApp;

    //инициализация
    public AnalogSignalsProtectionsPage()
    {
        _currentApp = (App) Application.Current;

        InitializeComponent();
        AiProtectionsDataGrid.ItemsSource = _currentApp.AnalogSignalProtections;
        AnalogSignalsCmbBx.ItemsSource = _currentApp.AnalogInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddAiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        var newAnalogSignalProtection = new AnalogSignalProtection()
        {
            Name = $"AiP{_currentApp.AnalogSignalProtections.Count}",
            IsUpperLimitProtection = false,
            Delay = 0,
            IsRunOnStart = false
        };
        _currentApp.AnalogSignalProtections.Add(newAnalogSignalProtection);
        AiProtectionsDataGrid.Items.Refresh();
    }

    private void DeleteAiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in AiProtectionsDataGrid.Items)
        {
            var row = (DataGridRow) AiProtectionsDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || AiProtectionsDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is AnalogSignalProtection analogSignalProtection)
                _currentApp.AnalogSignalProtections.Remove(analogSignalProtection);
        });

        AiProtectionsDataGrid.Items.Refresh();
    }
}