import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/views/ds_banner.dart';
import 'package:lr_design_system/views/ds_button.dart';
import 'package:lr_design_system/views/ds_inapp_webview.dart';
import 'package:lr_design_system/views/ds_segmented_progress_bar.dart';
import 'package:lr_design_system/views/ds_toggle_button.dart';
import 'package:lr_design_system/views/ds_text_button.dart';
import 'package:lr_design_system/views/ds_dialog.dart';
import 'package:lr_design_system/views/ds_modal_bottom_sheet.dart';
import 'package:showcase/views/showcase_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toggleOn = false;
  final stepsNotifier = ValueNotifier<int>(0);
  bool loading = false;
  bool enabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Design System"),
      ),
      body: ListView(
        children: <Widget>[
          ShowCaseItem(
            title: "Toggle Button",
            content: DSToggleButton(
                width: 150,
                isSelected: toggleOn,
                defaultIcon: Icon(Icons.signal_wifi_off),
                selectedIcon: Icon(Icons.wifi),
                text: toggleOn ? "On" : "Off",
                onSelected: (isSelected) {
                  setState(() {
                    toggleOn = isSelected;
                  });
                }),
          ),
          ShowCaseItem(
            title: "Segmented Progress Bar",
            content: DSSegmentedProgressBar(
              itemCount: 5,
              currentPageNotifier: stepsNotifier,
            ),
            modifiers: [
              ShowCaseModifier(title: "Previous", action: () => (stepsNotifier.value > 0) ? stepsNotifier.value -= 1 : null),
              ShowCaseModifier(title: "Next", action: () => (stepsNotifier.value < 5) ? stepsNotifier.value += 1 : null),
            ],
          ),
          ShowCaseItem(
            title: "Banner",
            content: DSBanner(
              leading: Icon(Icons.warning),
              isWarning: true,
              title: "This is a banner",
              message: "With some useful description to catch the user's attention.\n- Some progress can be added.\n- Also an icon",
              progress: 0.2,
              defaultProgressColor: ThemeProvider.theme.colors.disabled, // Remove
            ),
          ),
          ShowCaseItem(
            title: "Primary Button",
            content: Column(
              children: <Widget>[
                DSPrimaryButton(
                  text: "Primary",
                  isLoading: loading,
                  enabled: enabled,
                  onPressed: () {},
                ),
              ],
            ),
            modifiers: [
              ShowCaseModifier(title: "Loading", action: () => setState(() => loading = !loading)),
              ShowCaseModifier(title: "Enabled", action: () => setState(() => enabled = !enabled)),
            ],
          ),
          ShowCaseItem(
            title: "Outline Button",
            content: Column(
              children: <Widget>[
                DSOutlineButton(
                  text: "Secondary",
                  isLoading: loading,
                  enabled: enabled,
                  onPressed: () {},
                ),
              ],
            ),
            modifiers: [
              ShowCaseModifier(title: "Loading", action: () => setState(() => loading = !loading)),
              ShowCaseModifier(title: "Enabled", action: () => setState(() => enabled = !enabled)),
            ],
          ),
          ShowCaseItem(
            title: "Text Button",
            content: Column(
              children: <Widget>[
                DSTextButton(
                  text: "Text Button",
                  isLoading: loading,
                  enabled: enabled,
                  onPressed: () {},
                ),
              ],
            ),
            modifiers: [
              ShowCaseModifier(title: "Loading", action: () => setState(() => loading = !loading)),
              ShowCaseModifier(title: "Enabled", action: () => setState(() => enabled = !enabled)),
            ],
          ),
          ShowCaseItem(
            title: "Dialog",
            content: ShowCaseModifier(
              title: "Show",
              action: () {
                showDialog(
                  context: context,
                  builder: (context) => DSDialog(
                    title: "Are you sure?",
                    description: "Some text around here information about the consequences of the action that triggered the dialog.",
                    positiveButtonText: "Confirm",
                    negativeButtonText: "Cancel",
                    negativeCallback: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    positiveCallback: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                  ),
                );
              },
            ),
          ),
          ShowCaseItem(
            title: "Divider",
            content: Divider(
              height: 1.5,
            ),
          ),
          ShowCaseItem(
            title: "In-App WebView",
            content: ShowCaseModifier(
              title: "Open",
              action: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InAppWebView(
                    urlNotifier: ValueNotifier("https://levinriegner.com/home"),
                    useScaffold: true,
                  ),
                ),
              ),
            ),
          ),
          ShowCaseItem(
            title: "Modal Bottom Sheet",
            content: ShowCaseModifier(
              title: "Open",
              action: () => showDSModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        color: Colors.red,
                      ),
                  title: "Bottom Sheet"),
            ),
          ),
        ],
      ),
    );
  }
}
