using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class SingleInputsPage
{
    private readonly App _currentApp;

    public SingleInputsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        SingleInputsDataGrid.ItemsSource = _currentApp.SingleInputs;
        DiscreteInputsCmbBx.ItemsSource = _currentApp.DiscreteInputs;
    }

    private void AddSingleInput_OnClick(object sender, RoutedEventArgs e)
    {
        var singleInput = new SingleInput
        {
            Name = $"SI{_currentApp.SingleInputs.Count}",
            IsInversed = false
        };
        _currentApp.SingleInputs.Add(singleInput);
        SingleInputsDataGrid.Items.Refresh();
    }

    private void DeleteSingleInput_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in SingleInputsDataGrid.Items)
        {
            var row = (DataGridRow) SingleInputsDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || SingleInputsDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is SingleInput singleInput)
                _currentApp.SingleInputs.Remove(singleInput);
        });

        SingleInputsDataGrid.Items.Refresh();
    }
}