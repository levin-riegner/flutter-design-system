import 'package:lr_design_system/theme/theme.dart';
import 'package:flutter/widgets.dart';

class Margins {
  static SizedBox get xXXSmall => SizedBox(
      height: ThemeProvider.theme.spacing.xxxs,
      width: ThemeProvider.theme.spacing.xxxs);
  static SizedBox get xXSmall => SizedBox(
      height: ThemeProvider.theme.spacing.xxs,
      width: ThemeProvider.theme.spacing.xxs);
  static SizedBox get xSmall => SizedBox(
      height: ThemeProvider.theme.spacing.xs,
      width: ThemeProvider.theme.spacing.xs);
  static SizedBox get small => SizedBox(
      height: ThemeProvider.theme.spacing.s,
      width: ThemeProvider.theme.spacing.s);
  static SizedBox get medium => SizedBox(
      height: ThemeProvider.theme.spacing.m,
      width: ThemeProvider.theme.spacing.m);
  static SizedBox get large => SizedBox(
      height: ThemeProvider.theme.spacing.l,
      width: ThemeProvider.theme.spacing.l);
  static SizedBox get xLarge => SizedBox(
      height: ThemeProvider.theme.spacing.xl,
      width: ThemeProvider.theme.spacing.xl);
  static SizedBox get xXLarge => SizedBox(
      height: ThemeProvider.theme.spacing.xxl,
      width: ThemeProvider.theme.spacing.xxl);
  static SizedBox get xXXLarge => SizedBox(
      height: ThemeProvider.theme.spacing.xxxl,
      width: ThemeProvider.theme.spacing.xxxl);
}
