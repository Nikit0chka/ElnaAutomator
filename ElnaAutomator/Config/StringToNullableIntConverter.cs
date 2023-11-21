using System;
using System.Globalization;
using System.Windows;
using System.Windows.Data;

namespace ElnaAutomator.Config;

//Костыль для сброса значения сигнала в null
public class StringToNullableIntConverter:IValueConverter
{
    public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        return value?.ToString();
    }

    public object? ConvertBack(object? value, Type targetType, object? parameter, CultureInfo culture)
    {
        if (string.IsNullOrEmpty((string) value!))
            return null;

        return !int.TryParse((string) value, out var result)? DependencyProperty.UnsetValue : result;
    }
}