import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';

class DSListHeader extends StatelessWidget {
  final String text;
  final String? actionButtonText;
  final VoidCallback? onActionButtonPressed;
  final double? margin;

  const DSListHeader({
    required this.text,
    this.actionButtonText,
    this.onActionButtonPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final hasActionButton = actionButtonText != null && onActionButtonPressed != null;
    return SizedBox(
      width: double.infinity,
      height: Dimens.of(context).listItemHeightLarge,
      child: Padding(
        padding: EdgeInsets.only(
          left: margin ?? Dimens.of(context).marginLarge,
          right: margin ?? (hasActionButton ? Dimens.of(context).marginSmall : Dimens.of(context).marginLarge),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(text, style: Theme.of(context).textTheme.headline4),
              if (hasActionButton)
                InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(Dimens.of(context).radiusSmall)),
                  onTap: onActionButtonPressed,
                  child: Padding(
                    padding: EdgeInsets.all(Dimens.of(context).marginSmall),
                    child: Text(
                      actionButtonText!,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
