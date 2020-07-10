import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

class DSListHeader extends StatelessWidget {
  final String text;
  final String actionButtonText;
  final VoidCallback onActionButtonPressed;
  final double margin;

  DSListHeader({
    @required this.text,
    this.actionButtonText,
    this.onActionButtonPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final hasActionButton = actionButtonText != null && onActionButtonPressed != null;
    return SizedBox(
      width: double.infinity,
      height: ThemeProvider.theme.dimensions.listItemHeight,
      child: Padding(
        padding: EdgeInsets.only(
          left: margin ?? ThemeProvider.theme.spacing.l,
          right: margin ?? (hasActionButton ? ThemeProvider.theme.spacing.s : ThemeProvider.theme.spacing.l),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(text, style: ThemeProvider.theme.textStyles.h4),
              if (hasActionButton)
                InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(ThemeProvider.theme.dimensions.radiusSmall)),
                  onTap: onActionButtonPressed,
                  child: Padding(
                    padding: EdgeInsets.all(ThemeProvider.theme.spacing.s),
                    child: Text(
                      actionButtonText,
                      style: ThemeProvider.theme.textStyles.body2.copyWith(color: ThemeProvider.theme.colors.onBackground),
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
