import 'package:lr_design_system/theme/theme.dart';
import 'package:flutter/material.dart';

import 'margins.dart';

class DSBanner extends StatelessWidget {
  final double progress; // [0, 1]
  final Widget leading;
  final VoidCallback onDismiss;
  final String title;
  final String message;
  final bool isWarning;
  final EdgeInsets padding;

  final double borderRadius;
  final double contentPadding;
  final Color warningBackgroundColor;
  final Color defaultBackgroundColor;
  final Color activeProgressColor;
  final Color defaultProgressColor;
  final TextStyle titleTextStyle;
  final TextStyle messageTextStyle;

  DSBanner({
    this.progress,
    this.leading,
    this.title,
    this.message,
    this.onDismiss,
    this.isWarning = false,
    this.padding = const EdgeInsets.all(0.0),
    double borderRadius,
    double contentPadding,
    Color warningBackgroundColor,
    Color defaultBackgroundColor,
    Color activeProgressColor,
    Color defaultProgressColor,
    TextStyle titleTextStyle,
    TextStyle messageTextStyle,
  })  : this.borderRadius = borderRadius ?? ThemeProvider.theme.dimensions.radiusMedium,
        this.contentPadding = contentPadding ?? ThemeProvider.theme.spacing.m,
        this.warningBackgroundColor = warningBackgroundColor ?? ThemeProvider.theme.colors.secondary.withOpacity(0.25),
        this.defaultBackgroundColor = defaultBackgroundColor ?? ThemeProvider.theme.colors.surface,
        this.activeProgressColor = activeProgressColor ?? ThemeProvider.theme.colors.primary,
        this.defaultProgressColor = defaultProgressColor ?? ThemeProvider.theme.colors.disabled,
        this.titleTextStyle = titleTextStyle ?? ThemeProvider.theme.typography.h4,
        this.messageTextStyle = messageTextStyle ?? ThemeProvider.theme.typography.body1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(color: isWarning ? warningBackgroundColor : defaultBackgroundColor),
          child: Column(
            children: <Widget>[
              if (progress != null)
                SizedBox(
                  height: 4.0,
                  child: LinearProgressIndicator(
                    backgroundColor: defaultProgressColor,
                    valueColor: AlwaysStoppedAnimation<Color>(activeProgressColor),
                    value: progress,
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (leading != null)
                      Padding(
                        padding: EdgeInsets.only(right: ThemeProvider.theme.spacing.s),
                        child: leading,
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (title != null)
                            Text(
                              title,
                              style: titleTextStyle,
                              textAlign: TextAlign.start,
                            ),
                          if (title != null && message != null) Margins.xSmall,
                          if (message != null)
                            Text(
                              message,
                              style: messageTextStyle,
                              textAlign: TextAlign.start,
                            ),
                        ],
                      ),
                    ),
                    if (onDismiss != null)
                      Padding(
                        padding: EdgeInsets.only(left: ThemeProvider.theme.spacing.s),
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
