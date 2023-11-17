using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class AnalogSignalsProtectionsPage
{
    private readonly App _currentApp;
    public AnalogSignalsProtectionsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        AiProtectionsDataGrid.ItemsSource = _currentApp.AnalogSignalProtections;
        AnalogSignalsCmbBx.ItemsSource = _currentApp.AnalogInputs;
    }

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
    private void ComboBox_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
    {
        var comboBox = sender as ComboBox;
        if (comboBox != null)
            comboBox.SelectedIndex = -1;
    }

}