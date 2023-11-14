﻿using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class SectionSwitchesPage
{
    private readonly App _currentApp;

    public SectionSwitchesPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        SectionSwitchesDataGrid.ItemsSource = _currentApp.SectionSwitches;
        SectionSwitchStatOnDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchStatOffDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchCmdOffDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        SectionSwitchCmdOnDiscreteInput.ItemsSource = _currentApp.DiscreteOutputs;
        SectionSwitchInSoDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
        SectionSwitchInSzDiscreteInput.ItemsSource = _currentApp.DiscreteInputs;
    }
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