import 'package:flutter/material.dart';
import 'package:lr_design_system/config/ds_app.dart';
import 'package:lr_design_system/config/ds_config.dart';
import 'package:lr_design_system/utils/dimens.dart';
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
    return DSApp(
      dimens: DimensData.fallback(),
      config: DSConfig.fallback(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            colorScheme: ThemeData.light().colorScheme.copyWith(
                onBackground: Colors.black, background: Colors.white)),
        home: HomeScreen(),
      ),
    );
  }
}
