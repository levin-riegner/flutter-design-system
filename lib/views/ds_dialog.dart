import 'package:flutter/material.dart';
import 'package:lr_design_system/config/ds_config.dart';
import 'package:lr_design_system/utils/dimens.dart';
import 'package:lr_design_system/views/ds_button.dart';
import 'package:lr_design_system/views/ds_text_button.dart';

class DSDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback? positiveCallback;
  final VoidCallback? negativeCallback;

  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final bool? forceUpperCaseButtons;

  const DSDialog({
    this.title,
    this.description,
    this.positiveButtonText,
    this.negativeButtonText,
    this.positiveCallback,
    this.negativeCallback,
    this.backgroundColor,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.forceUpperCaseButtons,
  })  : assert(title != null || description != null),
        assert((positiveButtonText != null && positiveCallback != null) ||
            (negativeButtonText != null && negativeCallback != null));

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.of(context).radiusMedium),
          color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: EdgeInsets.all(Dimens.of(context).marginLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (title != null) ...[
                Text(
                  title!,
                  style:
                      (titleTextStyle ?? Theme.of(context).textTheme.headline4)!
                          .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.87)),
                ),
                SizedBox(height: Dimens.of(context).marginMedium),
              ],
              if (description != null)
                Text(
                  description!,
                  style: (descriptionTextStyle ??
                          Theme.of(context).textTheme.bodyText2)!
                      .copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6)),
                ),
              SizedBox(height: Dimens.of(context).marginLarge),
              if (positiveButtonText != null && positiveCallback != null) ...[
                DSPrimaryButton(
                  text: positiveButtonText!,
                  onPressed: positiveCallback,
                  forceUpperCase: forceUpperCaseButtons,
                ),
              ],
              if (negativeButtonText != null && negativeCallback != null) ...[
                SizedBox(height: Dimens.of(context).marginSmall),
                DSTextButton(
                  text: negativeButtonText!,
                  onPressed: negativeCallback,
                  alignment: Alignment.center,
                  forceUpperCase: forceUpperCaseButtons,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
