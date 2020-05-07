import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/views/margins.dart';
import 'package:flutter/material.dart';

class DSTag extends StatelessWidget {
  final String text;
  final String iconPath;
  final String iconSelectedPath;
  final bool isSelected;
  final Function(bool) onSelected;

  final double width;
  final double height;
  final double radius;
  final double selectedBorderWidth;
  final Color selectedBorderColor;
  final Color defaultBackgroundColor;
  final Color selectedBackgroundColor;
  final TextStyle textStyle;

  DSTag(
      {@required this.text,
      this.iconPath,
      this.iconSelectedPath,
      this.isSelected,
      this.onSelected,
      this.width = double.infinity,
      double height,
      double radius,
      double selectedBorderWidth,
      Color selectedBorderColor,
      Color defaultBackgroundColor,
      Color selectedBackgroundColor,
      TextStyle textStyle})
      : this.height = height ?? ThemeProvider.theme.dimensions.buttonHeight,
        this.radius = radius ?? ThemeProvider.theme.dimensions.radiusMedium,
        this.selectedBorderWidth =
            selectedBorderWidth ?? ThemeProvider.theme.dimensions.borderSmall,
        this.selectedBorderColor = selectedBorderColor ??
            ThemeProvider.theme.colors.primaryVariant.withOpacity(0.55),
        this.defaultBackgroundColor =
            defaultBackgroundColor ?? ThemeProvider.theme.colors.transparent,
        this.selectedBackgroundColor =
            selectedBackgroundColor ?? ThemeProvider.theme.colors.primary,
        this.textStyle = textStyle ??
            ThemeProvider.theme.typography.overline.apply(
                color: isSelected
                    ? ThemeProvider.theme.colors.onPrimary
                    : ThemeProvider.theme.colors.onBackground);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: isSelected
                ? BorderSide.none
                : BorderSide(
                    color: selectedBorderColor, width: selectedBorderWidth)),
        color: isSelected ? selectedBackgroundColor : defaultBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if ((isSelected && iconSelectedPath != null) ||
                (!isSelected && iconPath != null))
              Image.asset(isSelected ? iconSelectedPath : iconPath),
            Margins.small,
            Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ],
        ),
        onPressed: () => onSelected(!isSelected),
      ),
    );
  }
}
