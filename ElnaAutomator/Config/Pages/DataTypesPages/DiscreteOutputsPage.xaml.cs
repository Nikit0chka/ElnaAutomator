using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class DiscreteOutputsPage
{
    private readonly App? _currentApp;

    public DiscreteOutputsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
        DoDataGrid.ItemsSource = _currentApp?.DiscreteOutputs;
    }

    private void AddDo_OnClick(object sender, RoutedEventArgs e)
    {
        var discreteOutput = new DiscreteOutput
        {
            Name = $"Do{_currentApp?.DiscreteOutputs.Count}",
        };
        _currentApp?.DiscreteOutputs.Add(discreteOutput);
        DoDataGrid.Items.Refresh();
    }

    private void DeleteDo_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in DoDataGrid.Items)
        {
            var row = (DataGridRow) DoDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || DoDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is DiscreteOutput discreteOutput)
                _currentApp?.DiscreteOutputs.Remove(discreteOutput);
        });

        DoDataGrid.Items.Refresh();
    }
}