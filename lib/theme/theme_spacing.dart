import 'package:flutter/widgets.dart';
import 'package:lr_design_system/theme/theme.dart';

class ThemeSpacing {
  ThemeSpacing._();

  static SizedBox get XXXSmall => SizedBox(height: ThemeProvider.theme.spacing.xxxs, width: ThemeProvider.theme.spacing.xxxs);
  static SizedBox get XXSmall => SizedBox(height: ThemeProvider.theme.spacing.xxs, width: ThemeProvider.theme.spacing.xxs);
  static SizedBox get XSmall => SizedBox(height: ThemeProvider.theme.spacing.xs, width: ThemeProvider.theme.spacing.xs);
  static SizedBox get Small => SizedBox(height: ThemeProvider.theme.spacing.s, width: ThemeProvider.theme.spacing.s);
  static SizedBox get Medium => SizedBox(height: ThemeProvider.theme.spacing.m, width: ThemeProvider.theme.spacing.m);
  static SizedBox get Large => SizedBox(height: ThemeProvider.theme.spacing.l, width: ThemeProvider.theme.spacing.l);
  static SizedBox get XLarge => SizedBox(height: ThemeProvider.theme.spacing.xl, width: ThemeProvider.theme.spacing.xl);
  static SizedBox get XXLarge => SizedBox(height: ThemeProvider.theme.spacing.xxl, width: ThemeProvider.theme.spacing.xxl);
  static SizedBox get XXXLarge => SizedBox(height: ThemeProvider.theme.spacing.xxxl, width: ThemeProvider.theme.spacing.xxxl);
}