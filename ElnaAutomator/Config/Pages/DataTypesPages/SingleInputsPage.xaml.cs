﻿using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class SingleInputsPage : Page
{
    private readonly App? _currentApp;
    public SingleInputsPage()
    {
        InitializeComponent();
        _currentApp = Application.Current as App;
        SingleInputsDataGrid.ItemsSource = _currentApp?.DiscreteInputs;
    }
    private void AddSingleInput_OnClick(object sender, RoutedEventArgs e)
    {
        throw new System.NotImplementedException();
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
            if (c is DiscreteInput discreteInput)
                _currentApp?.DiscreteInputs.Remove(discreteInput);
        });

        SingleInputsDataGrid.Items.Refresh();
    }
}