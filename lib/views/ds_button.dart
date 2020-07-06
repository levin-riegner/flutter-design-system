import 'package:lr_design_system/theme/theme.dart';
import 'package:flutter/material.dart';

import 'ds_loading_indicator.dart';

class DSPrimaryButton extends _BaseButton {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback onPressed;

  DSPrimaryButton({
    @required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      enabled: enabled,
      width: width,
      borderSide: BorderSide.none,
      defaultColor: ThemeProvider.theme.colors.primary,
      disabledColor: ThemeProvider.theme.colors.disabled,
      defaultTextColor: ThemeProvider.theme.colors.onPrimary,
      disabledTextColor: ThemeProvider.theme.colors.onDisabled,
      loadingColor: ThemeProvider.theme.colors.onPrimary,
    );
  }
}

class DSOutlineButton extends _BaseButton {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback onPressed;

  DSOutlineButton({
    @required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      enabled: enabled,
      width: width,
      borderSide: BorderSide(
        color: (enabled || isLoading) ? ThemeProvider.theme.colors.primary : ThemeProvider.theme.colors.disabled,
        width: ThemeProvider.theme.dimensions.borderSmall,
      ),
      defaultColor: ThemeProvider.theme.colors.transparent,
      disabledColor: ThemeProvider.theme.colors.transparent,
      defaultTextColor: ThemeProvider.theme.colors.primary,
      disabledTextColor: ThemeProvider.theme.colors.disabled,
      loadingColor: ThemeProvider.theme.colors.primary,
    );
  }
}

class _BaseButton extends StatelessWidget {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback onPressed;

  final Color loadingColor;
  final double height;
  final double borderRadius;
  final Color defaultColor;
  final Color disabledColor;
  final TextStyle textStyle;
  final BorderSide borderSide;
  final Color defaultTextColor;
  final Color disabledTextColor;

  _BaseButton(
      {@required this.text,
      @required this.isLoading,
      @required this.enabled,
      @required this.width,
      @required this.borderSide,
      this.onPressed,
      @required Color loadingColor,
      double height,
      double borderRadius,
      @required Color defaultColor,
      @required Color disabledColor,
      TextStyle textStyle,
      @required Color defaultTextColor,
      @required Color disabledTextColor})
      : this.loadingColor = loadingColor ?? ThemeProvider.theme.colors.onPrimary,
        this.height = height ?? ThemeProvider.theme.dimensions.buttonHeight,
        this.borderRadius = borderRadius ?? ThemeProvider.theme.dimensions.radiusMedium,
        this.defaultColor = defaultColor ?? ThemeProvider.theme.colors.primary,
        this.disabledColor = disabledColor ?? ThemeProvider.theme.colors.disabled,
        this.textStyle = textStyle ?? ThemeProvider.theme.typography.button,
        this.defaultTextColor = defaultTextColor ?? ThemeProvider.theme.colors.onPrimary,
        this.disabledTextColor = disabledTextColor ?? ThemeProvider.theme.colors.onDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderSide,
        ),
        color: defaultColor,
        textColor: defaultTextColor,
        child: isLoading
            ? DSLoadingIndicator(color: loadingColor)
            : Text(
                text.toUpperCase(),
                style: textStyle,
              ),
        disabledColor: isLoading ? defaultColor : disabledColor,
        disabledTextColor: disabledTextColor,
        onPressed: (enabled && !isLoading) ? onPressed : null,
        highlightColor: (!enabled || isLoading) ? ThemeProvider.theme.colors.transparent : null,
        splashColor: (!enabled || isLoading) ? ThemeProvider.theme.colors.transparent : null, // null == default
      ),
    );
  }
}
