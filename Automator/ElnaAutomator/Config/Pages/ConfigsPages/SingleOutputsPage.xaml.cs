using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using ElnaAutomator.Config.Signals;

namespace ElnaAutomator.Config.Pages.ConfigsPages;

public partial class SingleOutputsPage
{
    private readonly App _currentApp;

    //инициализация
    public SingleOutputsPage()
    {
        _currentApp = (App) Application.Current;

        InitializeComponent();
        SingleOutputsDataGrid.ItemsSource = _currentApp.SingleOutputs;
        DiscreteOutputsCmbBx.ItemsSource = _currentApp.DiscreteOutputs;
    }

    //обработка добавления/удаления сигнала по нажатию кнопки
    private void AddSingleOutput_OnClick(object sender, RoutedEventArgs e)
    {
        var singleOutput = new SingleOutput()
        {
            Name = $"So{_currentApp.SingleOutputs.Count}"
        };

        _currentApp.SingleOutputs.Add(singleOutput);
        SingleOutputsDataGrid.Items.Refresh();
    }

    private void DeleteSingleOutput_OnClick(object sender, RoutedEventArgs e)
    {
        List<object> selectedItems = new();

        foreach (var item in SingleOutputsDataGrid.Items)
        {
            var row = (DataGridRow) SingleOutputsDataGrid.ItemContainerGenerator.ContainerFromItem(item);
            if (row == null || SingleOutputsDataGrid.Columns[0] is not DataGridCheckBoxColumn checkBox)
                continue;

            var element = checkBox.GetCellContent(row);
            if (element is CheckBox { IsChecked: true })
                selectedItems.Add(item);
        }

        selectedItems.ForEach(c =>
        {
            if (c is SingleOutput singleOutput)
                _currentApp.SingleOutputs.Remove(singleOutput);
        });

        SingleOutputsDataGrid.Items.Refresh();
    }
}