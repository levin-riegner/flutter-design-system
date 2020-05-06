library designsystem;

import 'package:flutter/material.dart';

class ThemeProvider {
  static Theme theme;
}

class Theme {
  final ColorPalette colors;
  final Typography typography;
  final Spacing spacing;
  final Dimensions dimensions;

  Theme(this.colors, this.typography, this.spacing, this.dimensions);
}

class ColorPalette {
  final Color primary;
  final Color primaryVariant;
  final Color secondary;
  final Color secondaryVariant;
  final Color background;
  final Color surface;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onBackground;
  final Color onSurface;
  final Color onError;
  final Color disabled;
  final Color interaction;

  final Color transparent = Color(0x00000000);

  ColorPalette(
      {this.primary,
      this.primaryVariant,
      this.secondary,
      this.secondaryVariant,
      this.background,
      this.surface,
      this.error,
      this.onPrimary,
      this.onSecondary,
      this.onBackground,
      this.onSurface,
      this.onError,
      this.disabled,
      this.interaction});
}

class Typography {
  final TextStyle h1;
  final TextStyle overline;

  Typography(this.h1, this.overline);
}

class Spacing {
  final double xxxs;
  final double xxs;
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;
  final double xxl;
  final double xxxl;

  Spacing({this.xxxs = 2, this.xxs = 4, this.xs = 8, this.s = 12, this.m = 16, this.l = 24, this.xl = 32, this.xxl = 48, this.xxxl = 64});
}

class Dimensions {
  final double radiusSmall;
  final double radiusMedium;
  final double radiusLarge;

  final double borderSmall;

  final double listItemHeight;
  final double listItemHeightLarge;
  final double listItemHeightXLarge;

  final double dividerHeight;

  final double buttonHeight;
  final double buttonMinWidth;

  final double iconSize;

  final double horizontalProgressHeight;

  Dimensions(
      {this.radiusSmall = 4,
      this.radiusMedium = 8,
      this.radiusLarge = 16,
      this.borderSmall = 1.5,
      this.listItemHeight = 48,
      this.listItemHeightLarge = 72,
      this.listItemHeightXLarge = 96,
      this.dividerHeight = 2,
      this.buttonHeight = 48,
      this.buttonMinWidth = 88,
      this.iconSize = 24,
      this.horizontalProgressHeight = 2});
}
