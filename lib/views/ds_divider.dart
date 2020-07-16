import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

class DSDivider extends StatelessWidget {
  final double margin;
  final double height;
  final Color color;

  DSDivider({
    this.margin = 0.0,
    double height,
    Color color,
  }): this.height = height ?? ThemeProvider.theme.dimensions.dividerHeight,
  this.color = color ?? ThemeProvider.theme.colors.onBackground.withOpacity(0.05);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin),
      child: Container(
        height: height,
        color: color,
      ),
    );
  }
}
