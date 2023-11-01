using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.ConfigPages;

public partial class AnalogInputsPage : Page
{
    private readonly App? _currentApp;
    public AnalogInputsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
        AiDataGrid.ItemsSource = _currentApp?.AnalogInputs;
    }

    /// <summary>
    /// Event holder on addAi button click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void AddAi_OnClick(object sender, RoutedEventArgs e)
    {
        var newAnalogInput = new AnalogInput()
        {
            Name = $"Ai{_currentApp?.AnalogInputs.Count}",
            HighLimit = 0,
            LowLimit = 0
        };
        _currentApp?.AnalogInputs.Add(newAnalogInput);
        AiDataGrid.Items.Refresh();
    }

    /// <summary>
    /// Event holder on deleteAi click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
                _currentApp?.AnalogInputs.Remove(analogInput);
        });

        AiDataGrid.Items.Refresh();
    }
}