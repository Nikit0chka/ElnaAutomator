using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.ConfigStructs;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class DiscreteInputsPage
{
    private readonly App _currentApp;


    //инициализация
    public DiscreteInputsPage()
    {
        InitializeComponent();
        _currentApp = (App) Application.Current;
        DiDataGrid.ItemsSource = _currentApp.DiscreteInputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddDi_OnClick(object sender, RoutedEventArgs e)
    {
        var discreteInput = new DiscreteInput
        {
            Name = $"Di{_currentApp.DiscreteInputs.Count}",
            ModuleId = 0
        };
        _currentApp.DiscreteInputs.Add(discreteInput);
        DiDataGrid.Items.Refresh();
    }

    private void DeleteDi_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in DiDataGrid.Items)
        {
            var row = (DataGridRow) DiDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || DiDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is DiscreteInput discreteInput)
                _currentApp.DiscreteInputs.Remove(discreteInput);
        });

        DiDataGrid.Items.Refresh();
    }
}