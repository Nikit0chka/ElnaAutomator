using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Pages.ConfigsPages;

public partial class DiscreteSignalsProtectionsPage
{
    private readonly App _currentApp;

    //инициализация
    public DiscreteSignalsProtectionsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        DiProtectionsDataGrid.ItemsSource = _currentApp.DiscreteSignalProtections;
        SingleSignalsCmbBx.ItemsSource = _currentApp.SingleInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
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