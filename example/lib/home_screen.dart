import 'package:flutter/material.dart';
import 'package:lr_design_system/config/ds_config.dart';
import 'package:lr_design_system/utils/alert_service.dart';
import 'package:lr_design_system/utils/dimens.dart';
import 'package:lr_design_system/views/ds_app_version.dart';
import 'package:lr_design_system/views/ds_banner.dart';
import 'package:lr_design_system/views/ds_button.dart';
import 'package:lr_design_system/views/ds_content_placeholder_views.dart';
import 'package:lr_design_system/views/ds_inapp_webview.dart';
import 'package:lr_design_system/views/ds_inner_list.dart';
import 'package:lr_design_system/views/ds_list_header.dart';
import 'package:lr_design_system/views/ds_list_item_action.dart';
import 'package:lr_design_system/views/ds_segmented_progress_bar.dart';
import 'package:lr_design_system/views/ds_text_field.dart';
import 'package:lr_design_system/views/ds_toggle_button.dart';
import 'package:lr_design_system/views/ds_text_button.dart';
import 'package:lr_design_system/views/ds_dialog.dart';
import 'package:lr_design_system/views/ds_modal_bottom_sheet.dart';
import 'package:lr_design_system/views/ds_app_bar.dart';
import 'package:lr_design_system/views/ds_internet_required.dart';
import 'package:showcase/views/sample_card.dart';
import 'package:showcase/views/showcase_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variables
  bool toggleOn = false;
  final stepsNotifier = ValueNotifier<int>(0);
  bool loading = false;
  bool enabled = true;
  String errorFieldString;

  // Values
  final listItemsCount = 10;

  @override
  void initState() {
    super.initState();
  }

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final errorFocusNode = FocusNode();

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
              ShowCaseModifier(
                  title: "Previous",
                  action: () => (stepsNotifier.value > 0)
                      ? stepsNotifier.value -= 1
                      : null),
              ShowCaseModifier(
                  title: "Next",
                  action: () => (stepsNotifier.value < 5)
                      ? stepsNotifier.value += 1
                      : null),
            ],
          ),
          ShowCaseItem(
            title: "Banner",
            content: DSBanner(
              leading: Icon(Icons.warning),
              isWarning: true,
              title: "This is a banner",
              message:
                  "With some useful description to catch the user's attention.\n- Some progress can be added.\n- Also an icon",
              progress: 0.2,
              defaultProgressColor: Theme.of(context).disabledColor, // Remove
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
              ShowCaseModifier(
                  title: "Loading",
                  action: () => setState(() => loading = !loading)),
              ShowCaseModifier(
                  title: "Enabled",
                  action: () => setState(() => enabled = !enabled)),
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
              ShowCaseModifier(
                  title: "Loading",
                  action: () => setState(() => loading = !loading)),
              ShowCaseModifier(
                  title: "Enabled",
                  action: () => setState(() => enabled = !enabled)),
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
              ShowCaseModifier(
                  title: "Loading",
                  action: () => setState(() => loading = !loading)),
              ShowCaseModifier(
                  title: "Enabled",
                  action: () => setState(() => enabled = !enabled)),
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
                    description:
                        "Some text around here information about the consequences of the action that triggered the dialog.",
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
                title: "Bottom Sheet",
              ),
            ),
          ),
          ShowCaseItem(
            title: "Nested Horizontal List",
            content: DSInnerList(
              height: 136,
              items: List.generate(listItemsCount, (index) => "Item $index"),
              listPadding: EdgeInsets.only(
                left: Dimens.of(context).marginLarge,
                right: Dimens.of(context).marginLarge,
                bottom: Dimens.of(context).marginMedium,
              ),
              itemBuilder: (context, index) {
                return SampleCard(
                  width: MediaQuery.of(context).size.width - 12 - 24 - 24,
                  title: "Title $index",
                  description: "Description $index",
                  onTap: () {},
                );
              },
            ),
          ),
          ShowCaseItem(
            title: "List Header - with Action",
            content: DSListHeader(
              text: "Header",
              actionButtonText: "Action",
              onActionButtonPressed: () {},
            ),
          ),
          ShowCaseItem(
            title: "List Item - with Navigation Action",
            content: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: DSListItemAction(
                text: "List Item",
                type: DSListItemActionType.navigation,
                onPressed: () {},
                useBottomDivider: true,
              ),
            ),
          ),
          ShowCaseItem(
            title: "Text Field",
            content: DSTextField(
                hint: "name",
                focusNode: nameFocusNode,
                nextFocusNode: emailFocusNode,
                keyboardType: TextInputType.number,
                borderWidth: 0.0,
                onChanged: (text) => print(text)),
          ),
          ShowCaseItem(
            title: "Text Field",
            content: DSTextField(
                hint: "email ",
                focusNode: emailFocusNode,
                nextFocusNode: errorFocusNode,
                onChanged: (text) => print(text)),
          ),
          ShowCaseItem(
            title: "Text Field Multiline Error",
            content: DSTextField(
                hint: "error focus node",
                focusNode: errorFocusNode,
                nextFocusNode: nameFocusNode,
                error: errorFieldString,
                maxLines: 5,
                onChanged: (text) => print(text)),
            modifiers: [
              ShowCaseModifier(
                  title: "Error",
                  action: () => setState(() => errorFieldString =
                      "Your email is already registered. Please check you inbox")),
              ShowCaseModifier(
                  title: "No Error",
                  action: () => setState(() => errorFieldString = null)),
            ],
          ),
          ShowCaseItem(
            title: "App Bar",
            content: DSAppBar(
              title: "Screen Title",
              backEnabled: true,
            ),
          ),
          ShowCaseItem(
            title: "Placeholder Screens",
            content: Container(),
            modifiers: [
              ShowCaseModifier(
                title: "Error",
                action: navigateTo(DSErrorView(
                  useScaffold: true,
                  onBack: () => Navigator.of(context).pop(),
                  onRefresh: () => {},
                )),
              ),
              ShowCaseModifier(
                title: "Empty",
                action: navigateTo(DSEmptyView(
                  useScaffold: true,
                  onBack: () => Navigator.of(context).pop(),
                  onRefresh: () => {},
                )),
              ),
              ShowCaseModifier(
                title: "No Internet",
                action: navigateTo(DSNoInternetView(
                  useScaffold: true,
                  onBack: () => Navigator.of(context).pop(),
                  onRefresh: () => {},
                )),
              ),
            ],
          ),
          ShowCaseItem(
            title: "Internet Listener",
            content: DSInternetRequired(
              expanded: false,
              onInternetAvailable: () {},
              child: Text(
                "I have internet now!\n (Re-launch the app without internet and then enable Internet again to see it change)",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ShowCaseItem(
            title: "App Version",
            content: Padding(
              padding: EdgeInsets.all(Dimens.of(context).marginMedium),
              child: DSAppVersion(),
            ),
          ),
          ShowCaseItem(
            title: "Alert",
            content: Container(),
            modifiers: [
              ShowCaseModifier(
                title: "SackBar",
                action: () => AlertService.instance().showAlert(
                  context: context,
                  message: "This is a message",
                  actionText: "Action",
                  onAction: () {},
                  type: AlertType.SnackBar,
                ),
              ),
              ShowCaseModifier(
                title: "Top Bar",
                action: () => AlertService.instance().showAlert(
                  context: context,
                  message: "This is a message",
                  actionText: "Action",
                  onAction: () {},
                  type: AlertType.TopBar,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  VoidCallback navigateTo(Widget view) {
    return () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => view,
          ),
        );
  }
}
