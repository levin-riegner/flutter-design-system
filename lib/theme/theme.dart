library lr_design_system;

import 'dart:convert';

import 'package:flutter/material.dart';

class ThemeProvider {
  static _Theme _theme;
  static _Theme get theme => _theme;

  static void setThemeFromJson(String jsonString, {String selectedPalette}) {
    _theme = _Theme.fromJson(jsonDecode(jsonString), selectedPalette: selectedPalette);
  }
}

class _Theme {
  final _ColorPalette colors;
  final _TextStyles textStyles;
  final _Spacing spacing;
  final _Dimensions dimensions;

  _Theme({this.colors, this.textStyles, this.spacing, this.dimensions});

  ThemeData toThemeData() {
    return ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: ThemeProvider.theme.toAppBarTheme(),
        iconTheme: ThemeProvider.theme.toIconThemeData(),
        textTheme: ThemeProvider.theme.textStyles.toTextTheme()
    );
  }

  AppBarTheme toAppBarTheme() {
    final base = (colors.isLight ? ThemeData.light() : ThemeData.dark()).appBarTheme;
    return base.copyWith(
      elevation: dimensions.navigationBarElevation,
      color: colors.surface,
      iconTheme: toIconThemeData(),
      actionsIconTheme: toIconThemeData(),
      textTheme: textStyles.toTextTheme().apply(bodyColor: colors.onSurface),
    );
  }

  IconThemeData toIconThemeData() {
    return IconThemeData(color: colors.onSurface, opacity: 1, size: dimensions.iconSize);
  }

  factory _Theme.fromJson(Map<String, dynamic> json, {String selectedPalette}) {
    final theme = json["theme"];
    final colorPalettes = (theme["colorPalettes"] as Iterable).toList();
    return _Theme(
        colors: _ColorPalette.fromJson(selectedPalette != null
            ? colorPalettes.firstWhere((e) => e["name"] == selectedPalette)["colors"]
            : colorPalettes.first["colors"]),
        textStyles: _TextStyles.fromJson(theme['textStyles']),
        spacing: _Spacing.fromJson(theme['spacing']),
        dimensions: _Dimensions.fromJson(theme["dimensions"]));
  }
}

class _ColorPalette {
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
  final Color onDisabled;
  final Color interaction;

  final bool isLight;

  final Color transparent = Color(0x00000000);

  _ColorPalette({
    this.primary,
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
    this.onDisabled,
    this.interaction,
    this.isLight = true,
  });

  factory _ColorPalette.fromJson(Map<String, dynamic> json) {
    return _ColorPalette(
      primary: _hexStringToColor(json['primary']),
      primaryVariant: _hexStringToColor(json['primaryVariant']),
      secondary: _hexStringToColor(json['secondary']),
      secondaryVariant: _hexStringToColor(json['secondaryVariant']),
      background: _hexStringToColor(json['background']),
      surface: _hexStringToColor(json['surface']),
      error: _hexStringToColor(json['error']),
      onPrimary: _hexStringToColor(json['onPrimary']),
      onSecondary: _hexStringToColor(json['onSecondary']),
      onBackground: _hexStringToColor(json['onBackground']),
      onSurface: _hexStringToColor(json['onSurface']),
      onError: _hexStringToColor(json['onError']),
      disabled: _hexStringToColor(json['disabled']),
      onDisabled: _hexStringToColor(json['onDisabled']),
      interaction: _hexStringToColor(json['interaction']),
      isLight: json["isLight"],
    );
  }

  static Color _hexStringToColor(String hexString) {
    if (hexString == null) return Colors.transparent;

    return Color(int.parse("0x$hexString"));
  }
}

class _TextStyles {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle h6;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle button;
  final TextStyle caption;
  final TextStyle overline;

  _TextStyles(
      {this.h1,
      this.h2,
      this.h3,
      this.h4,
      this.h5,
      this.h6,
      this.subtitle1,
      this.subtitle2,
      this.body1,
      this.body2,
      this.button,
      this.caption,
      this.overline});

  TextTheme toTextTheme() {
    return TextTheme(
        headline1: h1,
        headline2: h2,
        headline3: h3,
        headline4: h4,
        headline5: h5,
        headline6: h6,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: body1,
        bodyText2: body2,
        button: button,
        caption: caption,
        overline: overline);
  }

  factory _TextStyles.fromJson(Map<String, dynamic> json) {
    return _TextStyles(
        h1: _jsonToTextStyle(json['h1']),
        h2: _jsonToTextStyle(json['h2']),
        h3: _jsonToTextStyle(json['h3']),
        h4: _jsonToTextStyle(json['h4']),
        h5: _jsonToTextStyle(json['h5']),
        h6: _jsonToTextStyle(json['h6']),
        subtitle1: _jsonToTextStyle(json['subtitle1']),
        subtitle2: _jsonToTextStyle(json['subtitle2']),
        body1: _jsonToTextStyle(json['body1']),
        body2: _jsonToTextStyle(json['body2']),
        button: _jsonToTextStyle(json['button']),
        caption: _jsonToTextStyle(json['caption']),
        overline: _jsonToTextStyle(json['overline']));
  }

  static TextStyle _jsonToTextStyle(Map<String, dynamic> json) {
    if (json == null) return null;
    final fontSize = json["fontSize"].toDouble();
    final height = json["height"].toDouble();
    return TextStyle(
        fontWeight: _intToFontWeight(json["fontWeight"]),
        fontSize: fontSize,
        letterSpacing: json["letterSpacing"].toDouble(),
        height: height != null ? height / fontSize : 1,
        fontStyle: _stringToFontStyle(json["fontStyle"]),
        fontFamily: json["fontFamily"]);
  }

  static FontStyle _stringToFontStyle(String fontStyle) {
    switch (fontStyle) {
      case "normal":
        return FontStyle.normal;
      case "italic":
        return FontStyle.italic;
      default:
        return FontStyle.normal;
    }
  }

  static FontWeight _intToFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }
}

class _Spacing {
  final double xxxs;
  final double xxs;
  final double xs;
  final double s;
  final double m;
  final double l;
  final double xl;
  final double xxl;
  final double xxxl;

  _Spacing({this.xxxs = 2, this.xxs = 4, this.xs = 8, this.s = 12, this.m = 16, this.l = 24, this.xl = 32, this.xxl = 48, this.xxxl = 64});

  factory _Spacing.fromJson(Map<String, dynamic> json) {
    return _Spacing(
      xxxs: json['xxxs'].toDouble(),
      xxs: json['xxs'].toDouble(),
      xs: json['xs'].toDouble(),
      s: json['s'].toDouble(),
      m: json['m'].toDouble(),
      l: json['l'].toDouble(),
      xl: json['xl'].toDouble(),
      xxl: json['xxl'].toDouble(),
      xxxl: json['xxxl'].toDouble(),
    );
  }
}

class _Dimensions {
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

  final double navigationBarElevation;

  _Dimensions({
    this.radiusSmall = 4,
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
    this.horizontalProgressHeight = 2,
    this.navigationBarElevation = 4.0,
  });

  factory _Dimensions.fromJson(Map<String, dynamic> json) {
    return _Dimensions(
      radiusSmall: json['radiusSmall'],
      radiusMedium: json['radiusMedium'],
      radiusLarge: json['radiusLarge'],
      borderSmall: json['borderSmall'],
      listItemHeight: json['listItemHeight'],
      listItemHeightLarge: json['listItemHeightLarge'],
      listItemHeightXLarge: json['listItemHeightXLarge'],
      dividerHeight: json['dividerHeight'],
      buttonHeight: json['buttonHeight'],
      buttonMinWidth: json['buttonMinWidth'],
      iconSize: json['iconSize'],
      horizontalProgressHeight: json['horizontalProgressHeight'],
      navigationBarElevation: json['navigationBarElevation'],
    );
  }
}
