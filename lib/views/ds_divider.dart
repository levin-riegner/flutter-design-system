import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';

class DSDivider extends StatelessWidget {
  final double margin;
  final double height;
  final Color color;

  const DSDivider({
    this.margin = 0.0,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      child: Container(
        height: height ?? Dimens.of(context).dividerHeight,
        color: color ?? Theme.of(context).colorScheme.onBackground.withOpacity(0.05),
      ),
    );
  }
}
