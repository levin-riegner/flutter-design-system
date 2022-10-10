import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/config/ds_config.dart';
import 'package:lr_design_system/utils/dimens.dart';

import 'ds_loading_indicator.dart';

class DSPrimaryButton extends StatelessWidget {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;
  final bool? forceUpperCase;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  const DSPrimaryButton({
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
    this.forceUpperCase,
    this.borderRadius,
    this.contentPadding,
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
      defaultColor: Theme.of(context).colorScheme.primary,
      disabledColor: Theme.of(context).colorScheme.primary.withOpacity(0.25),
      defaultTextColor: Theme.of(context).colorScheme.onPrimary,
      disabledTextColor:
          Theme.of(context).colorScheme.onSurface.withOpacity(0.30),
      loadingColor: Theme.of(context).colorScheme.onPrimary,
      forceUpperCase:
          forceUpperCase ?? DSConfig.of(context).buttonTextUppercased,
      borderRadius: borderRadius,
      contentPadding: contentPadding,
    );
  }
}

class DSButton extends StatelessWidget {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;
  final bool? forceUpperCase;
  final Color backgroundColor;
  final Color textColor;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final Color? loadingColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  const DSButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
    this.forceUpperCase,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.borderRadius,
    this.loadingColor,
    this.contentPadding,
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
      defaultColor: backgroundColor,
      disabledColor: disabledBackgroundColor ??
          Theme.of(context).colorScheme.primary.withOpacity(0.25),
      defaultTextColor: textColor,
      disabledTextColor: disabledTextColor ??
          Theme.of(context).colorScheme.onSurface.withOpacity(0.30),
      loadingColor: loadingColor ?? Theme.of(context).colorScheme.onPrimary,
      forceUpperCase:
          forceUpperCase ?? DSConfig.of(context).buttonTextUppercased,
      borderRadius: borderRadius,
      contentPadding: contentPadding,
    );
  }
}

class DSOutlineButton extends StatelessWidget {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;
  final bool? forceUpperCase;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  const DSOutlineButton({
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
    this.forceUpperCase,
    this.borderRadius,
    this.contentPadding,
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
        color: (enabled || isLoading)
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).disabledColor,
        width: Dimens.of(context).borderSmall,
      ),
      defaultColor: const Color.fromARGB(0, 0, 0, 0),
      disabledColor: const Color.fromARGB(0, 0, 0, 0),
      defaultTextColor: Theme.of(context).colorScheme.primary,
      disabledTextColor: Theme.of(context).disabledColor,
      loadingColor: Theme.of(context).colorScheme.primary,
      forceUpperCase:
          forceUpperCase ?? DSConfig.of(context).buttonTextUppercased,
      borderRadius: borderRadius,
      contentPadding: contentPadding,
    );
  }
}

class _BaseButton extends StatelessWidget {
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;

  final Color? loadingColor;
  final double? height;
  final double? borderRadius;
  final Color defaultColor;
  final Color disabledColor;
  final TextStyle? textStyle;
  final BorderSide borderSide;
  final Color defaultTextColor;
  final Color? disabledTextColor;
  final bool forceUpperCase;
  final EdgeInsetsGeometry? contentPadding;

  const _BaseButton({
    required this.text,
    required this.isLoading,
    required this.enabled,
    required this.width,
    required this.borderSide,
    this.onPressed,
    required this.loadingColor,
    this.height,
    this.borderRadius,
    required this.defaultColor,
    required this.disabledColor,
    this.textStyle,
    required this.defaultTextColor,
    required this.disabledTextColor,
    required this.forceUpperCase,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? Dimens.of(context).buttonHeight,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? Dimens.of(context).radiusMedium,
              ),
              side: borderSide,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledTextColor ??
                    Theme.of(context).colorScheme.onSurface.withOpacity(.30);
              } else {
                return disabledTextColor;
              }
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return isLoading ? (defaultColor) : (disabledColor);
              } else {
                return defaultColor;
              }
            },
          ),
          overlayColor: MaterialStatePropertyAll(
            (!enabled || isLoading) ? const Color.fromARGB(0, 0, 0, 0) : null,
          ),
        ),
        onPressed: (enabled && !isLoading) ? onPressed : null,
        child: Center(
          child: isLoading
              ? DSLoadingIndicator(
                  color:
                      loadingColor ?? Theme.of(context).colorScheme.onPrimary)
              : Padding(
                  padding: contentPadding ?? EdgeInsets.zero,
                  child: Text(
                    forceUpperCase ? text.toUpperCase() : text,
                    style: textStyle,
                  ),
                ),
        ), // null == default
      ),
    );
  }
}
