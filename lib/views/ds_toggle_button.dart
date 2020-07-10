import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/views/margins.dart';
import 'package:flutter/material.dart';

class DSToggleButton extends StatelessWidget {
  final String text;
  final Widget defaultIcon;
  final Widget selectedIcon;
  final bool isSelected;
  final Function(bool) onSelected;
  final bool tintIcon;

  final double width;
  final double height;
  final double radius;
  final double defaultBorderWidth;
  final Color defaultBorderColor;
  final Color defaultColor;
  final Color selectedColor;
  final TextStyle textStyle;

  DSToggleButton(
      {@required this.text,
      this.defaultIcon,
      this.selectedIcon,
      this.isSelected = false,
      this.onSelected,
      this.width = double.infinity,
      this.tintIcon = true,
      double height,
      double radius,
      double defaultBorderWidth,
      Color defaultBorderColor,
      Color defaultColor,
      Color selectedColor,
      TextStyle textStyle})
      : this.height = height ?? ThemeProvider.theme.dimensions.buttonHeight,
        this.radius = radius ?? ThemeProvider.theme.dimensions.radiusMedium,
        this.defaultBorderWidth =
            defaultBorderWidth ?? ThemeProvider.theme.dimensions.borderSmall,
        this.defaultBorderColor = defaultBorderColor ??
            ThemeProvider.theme.colors.primaryVariant.withOpacity(0.55),
        this.defaultColor =
            defaultColor ?? ThemeProvider.theme.colors.transparent,
        this.selectedColor =
            selectedColor ?? ThemeProvider.theme.colors.primary,
        this.textStyle = textStyle ??
            ThemeProvider.theme.typography.overline.apply(
                color: isSelected
                    ? ThemeProvider.theme.colors.onPrimary
                    : ThemeProvider.theme.colors.onBackground);

  @override
  Widget build(BuildContext context) {
    final icon = isSelected ? selectedIcon : defaultIcon;
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: isSelected
                ? BorderSide.none
                : BorderSide(
                    color: defaultBorderColor, width: defaultBorderWidth)),
        color: isSelected ? selectedColor : defaultColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (icon != null)
              tintIcon
                  ? ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          isSelected
                              ? ThemeProvider.theme.colors.onPrimary
                              : ThemeProvider.theme.colors.onBackground,
                          BlendMode.srcIn),
                      child: icon)
                  : icon,
            if (icon != null) Margins.small,
            Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ],
        ),
        onPressed: onSelected != null ? () => onSelected(!isSelected) : null,
      ),
    );
  }
}
