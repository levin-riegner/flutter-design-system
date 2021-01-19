import 'package:flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    seconds = seconds ??
        (onAction == null ? _durationSeconds : _durationWithActionsSeconds);
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      animationDuration: const Duration(milliseconds: 500),
      titleText: title == null
          ? null
          : Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      duration: Duration(seconds: seconds),
      onTap: (_) => onAction(),
      mainButton: (onAction != null && actionText != null)
          ? FlatButton(
              child: Text(
                actionText,
                style: Theme.of(context).textTheme.button.apply(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5)),
              ),
              onPressed: onAction,
            )
          : null,
    )..show(context);
  }
}
