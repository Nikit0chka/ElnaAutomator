using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class SingleOutputsPage
{
    private readonly App? _currentApp;

    public SingleOutputsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
        SingleOutputsDataGrid.ItemsSource = _currentApp?.SingleOutputs;
        DiscreteOutputsCmbBx.ItemsSource = _currentApp?.DiscreteOutputs;
    }

    private void AddSingleOutput_OnClick(object sender, RoutedEventArgs e)
    {
        var singleOutput = new SingleOutput()
        {
            Name = $"SO{_currentApp?.SingleOutputs.Count}",
        };

        _currentApp?.SingleOutputs.Add(singleOutput);
        SingleOutputsDataGrid.Items.Refresh();
    }

    private void DeleteSingleOutput_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in SingleOutputsDataGrid.Items)
        {
            var row = (DataGridRow)SingleOutputsDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || SingleOutputsDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is SingleOutput singleOutput)
                _currentApp?.SingleOutputs.Remove(singleOutput);
        });

        SingleOutputsDataGrid.Items.Refresh();
    }
}