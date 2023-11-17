using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class DiscreteSignalsProtectionsPage
{

    private readonly App _currentApp;
    public DiscreteSignalsProtectionsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        DiProtectionsDataGrid.ItemsSource = _currentApp.DiscreteSignalProtections;
        SingleSignalsCmbBx.ItemsSource = _currentApp.SingleInputs;
    }

    private void AddDiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        var newDiscreteSignalProtection = new DiscreteSignalProtection()
        {
            Name = $"DiP{_currentApp.DiscreteSignalProtections.Count}",
            Delay = 0,
            IsRunOnStart = false
        };

        _currentApp.DiscreteSignalProtections.Add(newDiscreteSignalProtection);
        DiProtectionsDataGrid.Items.Refresh();
    }

    private void DeleteDiProtection_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in DiProtectionsDataGrid.Items)
        {
            var row = (DataGridRow) DiProtectionsDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || DiProtectionsDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is DiscreteSignalProtection discreteSignalProtection)
                _currentApp.DiscreteSignalProtections.Remove(discreteSignalProtection);
        });

        DiProtectionsDataGrid.Items.Refresh();
    }
}