import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lr_design_system/utils/dimens.dart';
import 'package:lr_design_system/views/ds_divider.dart';

class DSListItemAction extends StatelessWidget {
  final String text;
  final DSListItemActionType type;
  final bool useBottomDivider;
  final Widget? leading;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? dividerColor;
  final Color? actionColor;
  final EdgeInsetsGeometry? dividerPadding;
  final Widget? trailing;
  final DSListItemActionTapBehavior tapBehavior;

  const DSListItemAction({
    required this.text,
    required this.type,
    required this.onPressed,
    this.leading,
    this.useBottomDivider = false,
    this.textColor,
    this.dividerColor,
    this.actionColor,
    this.dividerPadding,
    this.trailing,
    this.tapBehavior = DSListItemActionTapBehavior.android,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _AdaptiveTapAction(
          tapBehavior: tapBehavior,
          onPressed: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: Dimens.of(context).listItemHeightLarge,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.of(context).marginLarge),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (leading != null)
                    Padding(
                      padding: EdgeInsets.only(
                          right: Dimens.of(context).marginSmall),
                      child: leading,
                    ),
                  Expanded(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: textColor ??
                                (type == DSListItemActionType.destructive
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                    ),
                  ),
                  if (type == DSListItemActionType.navigation)
                    trailing != null
                        ? trailing!
                        : Icon(
                            Icons.chevron_right,
                            color: actionColor ??
                                Theme.of(context).colorScheme.primary,
                          ),
                ],
              ),
            ),
          ),
        ),
        if (useBottomDivider)
          Padding(
            padding: dividerPadding ?? EdgeInsets.zero,
            child: DSDivider(
              color: dividerColor,
            ),
          ),
      ],
    );
  }
}

class _AdaptiveTapAction extends StatelessWidget {
  final DSListItemActionTapBehavior tapBehavior;
  final VoidCallback onPressed;
  final Widget child;

  const _AdaptiveTapAction({
    Key? key,
    required this.tapBehavior,
    required this.onPressed,
    required this.child,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    if (tapBehavior == DSListItemActionTapBehavior.android) {
      return Material(
        color: Theme.of(context).colorScheme.background,
        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      );
    } else {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child,
      );
    }
  }
}

enum DSListItemActionType { navigation, destructive, simple }

enum DSListItemActionTapBehavior { android, ios }
