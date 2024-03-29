import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lr_design_system/views/ds_button.dart';

void main() {
  // testWidgets('Parses Theme File correctly', (tester) async {
  //   final jsonString = await rootBundle.loadString("assets/theme.json");
  //   ThemeProvider.setThemeFromJson(jsonString);
  //   expect(ThemeProvider.theme != null, true);
  //   expect(ThemeProvider.theme.colors.primary, Color(0xFF6200EE));
  //   expect(
  //     ThemeProvider.theme.textStyles.h1,
  //     TextStyle(
  //       fontWeight: FontWeight.w300,
  //       fontSize: 96,
  //       letterSpacing: -1.5,
  //       height: 96 / 96,
  //       fontStyle: FontStyle.normal,
  //       fontFamily: "roboto",
  //       fontFamilyFallback: ["Roboto"],
  //       package: "flutter",
  //     ),
  //   );
  //   expect(ThemeProvider.theme.dimensions.listItemHeight, 48.0);
  //   expect(ThemeProvider.theme.spacing.m, 16);
  // });
  //
  // testWidgets('Updates Theme Colors', (tester) async {
  //   // Setup
  //   final jsonString = await rootBundle.loadString("assets/theme.json");
  //   ThemeProvider.setThemeFromJson(jsonString);
  //   expect(ThemeProvider.theme != null, true);
  //   expect(ThemeProvider.theme.colors.primary, Color(0xFF6200EE));
  //   // Change Colors
  //   final newColorString = "#1c19e1";
  //   final newColor = Color(0xFF1c19e1);
  //   ThemeProvider.updateColors(
  //     primary: newColorString,
  //     primaryVariant: newColorString,
  //     secondary: newColorString,
  //     secondaryVariant: newColorString,
  //   );
  //   expect(ThemeProvider.theme.colors.primary, newColor);
  //   expect(ThemeProvider.theme.colors.primaryVariant, newColor);
  //   expect(ThemeProvider.theme.colors.secondary, newColor);
  //   expect(ThemeProvider.theme.colors.secondaryVariant, newColor);
  // });
  //
  // testWidgets('Primary Button', (WidgetTester tester) async {
  //   await tester.pumpWidget(DSPrimaryButton(
  //     text: "Test",
  //   ));
  // });
}
