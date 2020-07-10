import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/views/ds_button.dart';
import 'package:lr_design_system/views/ds_text_button.dart';
import 'package:lr_design_system/views/margins.dart';

class DSDialog extends StatelessWidget {
  final String title;
  final String description;
  final String positiveButtonText;
  final String negativeButtonText;
  final VoidCallback positiveCallback;
  final VoidCallback negativeCallback;

  final Color backgroundColor;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;

  DSDialog({
    this.title,
    this.description,
    this.positiveButtonText,
    this.negativeButtonText,
    this.positiveCallback,
    this.negativeCallback,
    Color backgroundColor,
    TextStyle titleTextStyle,
    TextStyle descriptionTextStyle,
  })  : this.backgroundColor = backgroundColor ?? ThemeProvider.theme.colors.surface,
        this.titleTextStyle = titleTextStyle ?? ThemeProvider.theme.textStyles.h6,
        this.descriptionTextStyle = descriptionTextStyle ?? ThemeProvider.theme.textStyles.body1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeProvider.theme.dimensions.radiusMedium),
          color: backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: ThemeProvider.theme.spacing.l,
            right: ThemeProvider.theme.spacing.l,
            top: ThemeProvider.theme.spacing.xl,
            bottom: ThemeProvider.theme.spacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: titleTextStyle.copyWith(color: ThemeProvider.theme.colors.onSurface.withOpacity(0.87)),
              ),
              Margins.medium,
              Text(
                description,
                style: descriptionTextStyle.copyWith(color: ThemeProvider.theme.colors.onSurface.withOpacity(0.6)),
              ),
              Margins.xLarge,
              DSPrimaryButton(
                text: positiveButtonText,
                onPressed: positiveCallback,
              ),
              Margins.small,
              DSTextButton(
                text: negativeButtonText,
                onPressed: negativeCallback,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
