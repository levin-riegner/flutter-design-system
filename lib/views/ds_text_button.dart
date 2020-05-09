import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

import 'ds_loading_indicator.dart';

class DSTextButton extends StatelessWidget {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback onPressed;
  final Alignment alignment;
  final double horizontalMargin;

  final Color loadingColor;
  final double height;
  final TextStyle textStyle;
  final Color defaultTextColor;
  final Color disabledTextColor;

  DSTextButton({
    @required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.alignment = Alignment.centerLeft,
    this.horizontalMargin = 0.0,
    Color loadingColor,
    double height,
    TextStyle textStyle,
    Color defaultTextColor,
    Color disabledTextColor,
  })  : this.loadingColor = loadingColor ?? ThemeProvider.theme.colors.primary,
        this.height = height ?? ThemeProvider.theme.dimensions.buttonHeight,
        this.textStyle = textStyle ?? ThemeProvider.theme.typography.button,
        this.defaultTextColor =
            defaultTextColor ?? ThemeProvider.theme.colors.primary,
        this.disabledTextColor =
            disabledTextColor ?? ThemeProvider.theme.colors.disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Align(
        alignment: alignment,
        child: isLoading
            ? DSLoadingIndicator(color: loadingColor)
            : CupertinoButton(
                padding: EdgeInsets.all(horizontalMargin),
                child: Text(
                  text.toUpperCase(),
                  style: textStyle.copyWith(
                      color: enabled ? defaultTextColor : disabledTextColor),
                ),
                onPressed: (enabled && !isLoading) ? onPressed : () {},
              ),
      ),
    );
  }
}
