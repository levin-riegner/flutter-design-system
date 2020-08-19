import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/theme/theme_spacing.dart';
import 'package:lr_design_system/views/ds_app_bar.dart';
import 'package:lr_design_system/views/ds_button.dart';
import 'package:lr_design_system/views/ds_text_button.dart';

class DSErrorView extends StatelessWidget {
  final bool useScaffold;
  final String scaffoldTitle;
  final Widget iconView;
  final VoidCallback onRefresh;
  final VoidCallback onBack;

  const DSErrorView({
    Key key,
    @required this.useScaffold,
    this.scaffoldTitle,
    this.iconView,
    this.onRefresh,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Localise
    return _ContentPlaceholderScreen(
      useScaffold: useScaffold,
      scaffoldTitle: scaffoldTitle ?? 'Error',
      icon: Icons.warning,
      title: 'It seems something has broken!',
      description: 'Let\'s help get you back',
      onRefresh: onRefresh,
      onBack: onBack,
    );
  }
}

class DSEmptyView extends StatelessWidget {
  final bool useScaffold;
  final String scaffoldTitle;
  final Widget iconView;
  final VoidCallback onRefresh;
  final VoidCallback onBack;

  const DSEmptyView({
    Key key,
    @required this.useScaffold,
    this.scaffoldTitle,
    this.iconView,
    this.onRefresh,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Localise
    return _ContentPlaceholderScreen(
      useScaffold: useScaffold,
      scaffoldTitle: scaffoldTitle ?? '',
      icon: Icons.insert_drive_file,
      title: 'Nothing to see here',
      description: 'It seems this page has no content...',
      onRefresh: onRefresh,
      onBack: onBack,
    );
  }
}

class _ContentPlaceholderScreen extends StatelessWidget {
  final bool useScaffold;
  final String scaffoldTitle;

  final Widget iconView;
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onRefresh;
  final VoidCallback onBack;

  const _ContentPlaceholderScreen({
    Key key,
    @required this.useScaffold,
    @required this.scaffoldTitle,
    this.iconView,
    this.icon,
    @required this.title,
    @required this.description,
    @required this.onRefresh,
    @required this.onBack,
  })  : assert(icon != null || iconView != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = _ContentPlaceholderBody(
      icon: icon,
      title: title,
      description: description,
      onRefresh: onRefresh,
      onBack: onBack,
    );
    return useScaffold
        ? Scaffold(
            appBar: DSAppBar(
              title: scaffoldTitle,
              backEnabled: onBack != null,
              onBack: onBack,
            ),
            body: body,
          )
        : body;
  }
}

class _ContentPlaceholderBody extends StatelessWidget {
  static const kIconHeight = 115.0;

  final Widget iconView;
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onRefresh;
  final VoidCallback onBack;

  const _ContentPlaceholderBody({
    Key key,
    this.iconView,
    this.icon,
    @required this.title,
    @required this.description,
    @required this.onRefresh,
    @required this.onBack,
  })  : assert(icon != null || iconView != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(ThemeProvider.theme.spacing.l),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconView ??
                      Icon(
                        icon,
                        size: kIconHeight,
                        color: ThemeProvider.theme.colors.primary,
                      ),
                  ThemeSpacing.XLarge,
                  Text(
                    title,
                    style: ThemeProvider.theme.textStyles.h4,
                    textAlign: TextAlign.center,
                  ),
                  ThemeSpacing.Medium,
                  Text(
                    description,
                    style: ThemeProvider.theme.textStyles.body1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            if (onRefresh != null)
              DSPrimaryButton(
                text: 'Refresh',
                onPressed: onRefresh,
              ),
            if (onBack != null)
              Padding(
                padding: EdgeInsets.only(top: ThemeProvider.theme.spacing.m),
                child: DSTextButton(
                  text: 'Go back',
                  onPressed: onBack,
                  alignment: Alignment.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
