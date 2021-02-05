import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SnackBarService {
  SnackBarService._();

  static SnackBarService _instance;

  static SnackBarService instance() {
    if (_instance == null) {
      _instance = SnackBarService._();
    }
    return _instance;
  }

  static const int _durationSeconds = 3;
  static const int _durationWithActionsSeconds = 6;

  showSnackBar({
    @required BuildContext context,
    @required String title,
    @required VoidCallback onAction,
    @required String actionText,
    TextStyle titleStyle,
    Color backgroundColor,
    int seconds,
    Color actionTextColor,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    double elevation,
    ShapeBorder shape,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating,
  }) {
    seconds = seconds ??
        (onAction == null ? _durationSeconds : _durationWithActionsSeconds);

    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds),
        backgroundColor: backgroundColor,
        behavior: snackBarBehavior,
        margin: margin,
        padding: padding,
        elevation: elevation,
        shape: shape,
        content: Text(
          title,
          style: titleStyle,
        ),
        action: SnackBarAction(
          label: actionText,
          onPressed: onAction,
          textColor: actionTextColor,
        ),
      ),
    );
  }
}
