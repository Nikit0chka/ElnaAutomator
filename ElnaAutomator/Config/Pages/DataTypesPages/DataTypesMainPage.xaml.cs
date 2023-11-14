﻿using System.Windows;

namespace ElnaAutomator.Config.Pages.DataTypesPages;

public partial class DataTypesMainPage
{
    private readonly AnalogInputsPage _analogInputsPage;
    private readonly DiscreteInputsPage _discreteInputsPage;
    private readonly DiscreteOutputsPage _discreteOutputsPage;
    private readonly SingleInputsPage _singleInputsPage;
    private readonly SingleOutputsPage _singleOutputsPage;
    private readonly KransPage _kransPage;
    private readonly SwitchesPage _switchesPage;
    private readonly OilPumpsPage _oilPumpsPage;
    private readonly AnalogSignalsProtectionsPage _analogSignalsProtectionsPage;
    private readonly DiscreteSignalsProtectionsPage _discreteSignalsProtectionsPage;

    public DataTypesMainPage()
    {
        _analogInputsPage = new AnalogInputsPage();
        _discreteInputsPage = new DiscreteInputsPage();
        _discreteOutputsPage = new DiscreteOutputsPage();
        _singleInputsPage = new SingleInputsPage();
        _singleOutputsPage = new SingleOutputsPage();
        _kransPage = new KransPage();
        _switchesPage = new SwitchesPage();
        _oilPumpsPage = new OilPumpsPage();
        _analogSignalsProtectionsPage = new AnalogSignalsProtectionsPage();
        _discreteSignalsProtectionsPage = new DiscreteSignalsProtectionsPage();

        InitializeComponent();
    }

    private void AnalogSignalsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_analogInputsPage);
    }

    private void DiscreteInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_discreteInputsPage);
    }

    private void DiscreteOutputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_discreteOutputsPage);
    }

    private void AnalogInputsProtectionsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_analogSignalsProtectionsPage);
    }

    private void SingleInputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_singleInputsPage);
    }

    private void DiscreteSignalsProtectionsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_discreteSignalsProtectionsPage);
    }

    private void SingleOutputsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_singleOutputsPage);
    }

    private void KransShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_kransPage);
    }

    private void OilPumpsShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_oilPumpsPage);
    }

    private void SwitchesShowButton_OnClick(object sender, RoutedEventArgs e)
    {
        ThisFrame.Navigate(_switchesPage);
    }
}