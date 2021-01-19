import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lr_design_system/theme/dimens.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:showcase/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // Set Theme
  // final jsonString = await rootBundle.loadString("assets/theme.json");
  // ThemeProvider.setThemeFromJson(jsonString);

  // Run App
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(colorScheme: ThemeData.light().colorScheme.copyWith(onBackground: Colors.black, background: Colors.white)),
      home: Dimens(
        data: DimensData.fallback(),
        child: HomeScreen(),
      ),
    );
  }
}
