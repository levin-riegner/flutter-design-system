import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/config/ds_config.dart';

class AlertService {
  AlertService._();

  static AlertService? _instance;

  static AlertService? instance() {
    if (_instance == null) {
      _instance = AlertService._();
    }
    return _instance;
  }

  static const int _durationSeconds = 3;
  static const int _durationWithActionsSeconds = 6;

  showAlert({
    required BuildContext context,
    required String message,
    String? title,
    int? seconds,
    String? actionText,
    VoidCallback? onAction,
    AlertType? type,
    Color? backgroundColor,
    Color? actionTextColor,
    double? snackBarElevation,
    ShapeBorder? snackBarShape,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    TextAlign? textAlign,
  }) {
    type = type ?? DSConfig.of(context).alertType;
    seconds = seconds ??
        (onAction == null ? _durationSeconds : _durationWithActionsSeconds);
    if (type == AlertType.TopBar) {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle:
            margin != null ? FlushbarStyle.FLOATING : FlushbarStyle.GROUNDED,
        animationDuration: const Duration(milliseconds: 500),
        margin: margin?.resolve(TextDirection.ltr) ?? EdgeInsets.all(0.0),
        padding: padding?.resolve(TextDirection.ltr) ?? EdgeInsets.all(16),
        titleText: title == null
            ? null
            : Text(
                title,
                textAlign: textAlign ?? TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
        messageText: Text(
          message,
          textAlign: textAlign ?? TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        duration: Duration(seconds: seconds),
        onTap: (_) => onAction!(),
        mainButton: (onAction != null && actionText != null)
            ? TextButton(
                child: Text(
                  actionText,
                  style: Theme.of(context).textTheme.button!.apply(
                      color: actionTextColor ??
                          Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.5)),
                ),
                onPressed: onAction,
              )
            : null,
      )..show(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: snackBarElevation,
          shape: snackBarShape,
          margin: margin,
          padding: padding,
          duration: Duration(seconds: seconds),
          backgroundColor: backgroundColor,
          content: Text(
            message,
            textAlign: textAlign,
          ),
          action: (onAction != null && actionText != null)
              ? SnackBarAction(
                  label: actionText,
                  onPressed: onAction,
                  textColor:
                      actionTextColor ?? Theme.of(context).colorScheme.primary,
                )
              : null,
        ),
      );
    }
  }
}
