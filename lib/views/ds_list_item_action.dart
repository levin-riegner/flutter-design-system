import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

class DSListItemAction extends StatelessWidget {
  final String text;
  final DSListItemActionType type;
  final bool useBottomDivider;
  final Widget leading;
  final VoidCallback onPressed;

  DSListItemAction({
    @required this.text,
    @required this.type,
    @required this.onPressed,
    this.leading,
    this.useBottomDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          color: ThemeProvider.theme.colors.background,
          child: InkWell(
            onTap: onPressed,
            child: SizedBox(
              width: double.infinity,
              height: ThemeProvider.theme.dimensions.listItemHeightLarge,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ThemeProvider.theme.spacing.l),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (leading != null)
                      Padding(
                        padding: EdgeInsets.only(right: ThemeProvider.theme.spacing.s),
                        child: leading,
                      ),
                    Expanded(
                      child: Text(
                        text,
                        style: ThemeProvider.theme.textStyles.body1.copyWith(
                          color: type == DSListItemActionType.destructive
                              ? ThemeProvider.theme.colors.primary
                              : ThemeProvider.theme.colors.onBackground,
                        ),
                      ),
                    ),
                    if (type == DSListItemActionType.navigation)
                      Icon(
                        Icons.chevron_right,
                        color: ThemeProvider.theme.colors.primary,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (useBottomDivider)
          Divider(
            height: ThemeProvider.theme.dimensions.dividerHeight,
            color: ThemeProvider.theme.colors.interaction,
          ),
      ],
    );
  }
}

enum DSListItemActionType { navigation, destructive }
