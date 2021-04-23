import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';

class DSBanner extends StatelessWidget {
  final double? progress; // [0, 1]
  final Widget? leading;
  final VoidCallback? onDismiss;
  final String? title;
  final String? message;
  final bool isWarning;
  final EdgeInsets padding;

  final double? borderRadius;
  final double? contentPadding;
  final Color? warningBackgroundColor;
  final Color? defaultBackgroundColor;
  final Color? activeProgressColor;
  final Color? defaultProgressColor;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;

  const DSBanner({
    this.progress,
    this.leading,
    this.title,
    this.message,
    this.onDismiss,
    this.isWarning = false,
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius,
    this.contentPadding,
    this.warningBackgroundColor,
    this.defaultBackgroundColor,
    this.activeProgressColor,
    this.defaultProgressColor,
    this.titleTextStyle,
    this.messageTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            borderRadius ?? Dimens.of(context).radiusMedium),
        child: Container(
          decoration: BoxDecoration(
              color: isWarning
                  ? (warningBackgroundColor ??
                      Theme.of(context).colorScheme.secondary.withOpacity(0.25))
                  : (defaultBackgroundColor ??
                      Theme.of(context).colorScheme.surface)),
          child: Column(
            children: <Widget>[
              if (progress != null)
                SizedBox(
                  height: 4.0,
                  child: LinearProgressIndicator(
                    backgroundColor: (defaultProgressColor ??
                        Theme.of(context).disabledColor),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        (activeProgressColor ??
                            Theme.of(context).colorScheme.primary)),
                    value: progress,
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(
                    contentPadding ?? Dimens.of(context).marginSmall),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (leading != null)
                      Padding(
                        padding: EdgeInsets.only(
                            right: Dimens.of(context).marginSmall),
                        child: leading,
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (title != null)
                            Text(
                              title!,
                              style: (titleTextStyle ??
                                  Theme.of(context).textTheme.headline4),
                              textAlign: TextAlign.start,
                            ),
                          if (title != null && message != null)
                            SizedBox(height: Dimens.of(context).marginXSmall),
                          if (message != null)
                            Text(
                              message!,
                              style: (messageTextStyle ??
                                  Theme.of(context).textTheme.bodyText2),
                              textAlign: TextAlign.start,
                            ),
                        ],
                      ),
                    ),
                    if (onDismiss != null)
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimens.of(context).marginSmall),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.topRight,
                          icon: Icon(Icons.close),
                          onPressed: onDismiss,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
