import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  testWidgets('Parses Theme File correctly', (tester) async {
    final jsonString = await rootBundle.loadString("assets/theme.json");
    ThemeProvider.setThemeFromJson(jsonString);
    expect(ThemeProvider.theme != null, true);
    expect(ThemeProvider.theme.colors.primary, Color(0xFF6200EE));
    expect(
        ThemeProvider.theme.typography.h1,
        TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 96,
            letterSpacing: -1.5,
            height: 96 / 96,
            fontStyle: FontStyle.normal,
            fontFamily: "roboto"));
    expect(ThemeProvider.theme.dimensions.listItemHeight, 48.0);
    expect(ThemeProvider.theme.spacing.m, 16);
  });
}
