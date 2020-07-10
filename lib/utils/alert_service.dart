import 'package:flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

class AlertService {
  AlertService._();

  static AlertService _instance;

  static AlertService instance() {
    if (_instance == null) {
      _instance = AlertService._();
    }
    return _instance;
  }

  static const int _durationSeconds = 3;
  static const int _durationWithActionsSeconds = 6;
  showAlert({
    @required BuildContext context,
    @required String message,
    String title,
    int seconds,
    String actionText,
    VoidCallback onAction,
  }) {
    seconds = seconds ?? (onAction == null ? _durationSeconds : _durationWithActionsSeconds);
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      animationDuration: const Duration(milliseconds: 500),
      titleText: title == null
          ? null
          : Text(
              title,
              textAlign: TextAlign.center,
              style: ThemeProvider.theme.textStyles.h4.copyWith(color: ThemeProvider.theme.colors.onPrimary),
            ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: ThemeProvider.theme.textStyles.body1.copyWith(color: ThemeProvider.theme.colors.onPrimary),
      ),
      backgroundColor: ThemeProvider.theme.colors.primary,
      duration: Duration(seconds: seconds),
      onTap: (_) => onAction(),
      mainButton: (onAction != null && actionText != null)
          ? FlatButton(
              child: Text(
                actionText,
                style: ThemeProvider.theme.textStyles.button.apply(color: ThemeProvider.theme.colors.onPrimary.withOpacity(0.5)),
              ),
              onPressed: onAction,
            )
          : null,
    )..show(context);
  }
}
