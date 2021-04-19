import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';

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
  final bool forceUpperCase;

  DSTextButton({
    @required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.alignment = Alignment.centerLeft,
    this.horizontalMargin = 0.0,
    this.loadingColor,
    this.height,
    this.textStyle,
    this.defaultTextColor,
    this.disabledTextColor,
    this.forceUpperCase = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? Dimens.of(context).buttonHeight,
      child: Align(
        alignment: alignment,
        child: isLoading
            ? DSLoadingIndicator(
                color: loadingColor ?? Theme.of(context).colorScheme.primary)
            : CupertinoButton(
                padding: EdgeInsets.all(horizontalMargin),
                child: Text(
                  forceUpperCase ? text.toUpperCase() : text,
                  style: (textStyle ?? Theme.of(context).textTheme.button)
                      .copyWith(
                          color: enabled
                              ? (defaultTextColor ??
                                  Theme.of(context).colorScheme.primary)
                              : (disabledTextColor ??
                                  Theme.of(context).disabledColor)),
                ),
                onPressed: (enabled && !isLoading) ? onPressed : null,
              ),
      ),
    );
  }
}
