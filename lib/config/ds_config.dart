import 'package:flutter/widgets.dart';
import 'package:lr_design_system/config/ds_app.dart';

class DSConfig {
  final bool buttonTextUppercased;
  final AlertType alertType;

  const DSConfig({
    required this.buttonTextUppercased,
    required this.alertType,
  });

  factory DSConfig.fallback() {
    return DSConfig(
      buttonTextUppercased: false,
      alertType: AlertType.SnackBar,
    );
  }

  static DSConfig of(BuildContext context) {
    final DSApp? dsApp = context.dependOnInheritedWidgetOfExactType<DSApp>();
    return dsApp?.config ?? DSConfig.fallback();
  }

  @override
  String toString() {
    return 'DSConfig{buttonTextUppercased: $buttonTextUppercased, alertType: $alertType}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DSConfig &&
          runtimeType == other.runtimeType &&
          buttonTextUppercased == other.buttonTextUppercased &&
          alertType == other.alertType;

  @override
  int get hashCode => buttonTextUppercased.hashCode ^ alertType.hashCode;
}

enum AlertType {
  SnackBar,
  TopBar,
}
