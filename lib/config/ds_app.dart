import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lr_design_system/config/ds_config.dart';
import 'package:lr_design_system/utils/dimens.dart';

class DSApp extends InheritedWidget {
  final DimensData dimens;
  final DSConfig config;

  const DSApp({
    Key? key,
    required this.dimens,
    required this.config,
    required MaterialApp child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant DSApp oldWidget) {
    return oldWidget.dimens != dimens || oldWidget.config != config;
  }
}
