import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';
import 'package:lr_design_system/utils/strings.dart';
import 'package:lr_design_system/views/ds_app_bar.dart';
import 'package:lr_design_system/views/ds_button.dart';
import 'package:lr_design_system/views/ds_text_button.dart';

class DSErrorView extends StatelessWidget {
  final bool useScaffold;
  final String scaffoldTitle;
  final bool expanded;
  final Widget iconView;
  final VoidCallback onRefresh;
  final VoidCallback onBack;
  final String title;
  final String description;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;

  const DSErrorView({
    Key key,
    this.useScaffold = false,
    this.scaffoldTitle,
    this.expanded = true,
    this.iconView,
    @required this.onRefresh,
    this.onBack,
    this.title,
    this.description,
    this.titleTextStyle,
    this.descriptionTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Localise
    return _ContentPlaceholderScreen(
      useScaffold: useScaffold,
      scaffoldTitle: scaffoldTitle ?? 'Error',
      expanded: expanded,
      iconView: iconView,
      fallbackIcon: Icons.warning,
      title: title ?? 'It seems something has broken!',
      description: description ?? 'Let\'s help get you back',
      onRefresh: onRefresh,
      onBack: onBack,
      titleTextStyle: titleTextStyle,
      descriptionTextStyle: descriptionTextStyle,
    );
  }
}

class DSEmptyView extends StatelessWidget {
  final bool useScaffold;
  final String scaffoldTitle;
  final bool expanded;
  final Widget iconView;
  final VoidCallback onRefresh;
  final VoidCallback onBack;
  final String title;
  final String description;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;

  const DSEmptyView({
    Key key,
    this.useScaffold = false,
    this.scaffoldTitle,
    this.expanded = true,
    this.iconView,
    this.onRefresh,
    this.onBack,
    this.title,
    this.description,
    this.titleTextStyle,
    this.descriptionTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ContentPlaceholderScreen(
      useScaffold: useScaffold,
      scaffoldTitle: scaffoldTitle ?? '',
      expanded: expanded,
      iconView: iconView,
      fallbackIcon: Icons.insert_drive_file,
      title: title ?? 'Nothing to see here',
      description: description ?? 'It seems this page has no content...',
      onRefresh: onRefresh,
      onBack: onBack,
      titleTextStyle: titleTextStyle,
      descriptionTextStyle: descriptionTextStyle,
    );
  }
}

class DSNoInternetView extends StatelessWidget {
  final bool useScaffold;
  final String scaffoldTitle;
  final bool expanded;
  final Widget iconView;
  final VoidCallback onRefresh;
  final VoidCallback onBack;
  final String title;
  final String description;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;

  const DSNoInternetView({
    Key key,
    this.useScaffold = false,
    this.scaffoldTitle,
    this.expanded = true,
    this.iconView,
    this.onRefresh,
    this.onBack,
    this.title,
    this.description,
    this.titleTextStyle,
    this.descriptionTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ContentPlaceholderScreen(
      useScaffold: useScaffold,
      scaffoldTitle: scaffoldTitle ?? '',
      expanded: expanded,
      iconView: iconView,
      fallbackIcon: Icons.cloud_off,
      title: title ?? Strings.noInternetViewTitle,
      description: description ?? Strings.noInternetViewDescription,
      onRefresh: onRefresh,
      onBack: onBack,
      titleTextStyle: titleTextStyle,
      descriptionTextStyle: descriptionTextStyle,
    );
  }
}

class _ContentPlaceholderScreen extends StatelessWidget {
  final bool useScaffold;
  final String scaffoldTitle;

  final Widget iconView;
  final IconData fallbackIcon;
  final bool expanded;
  final String title;
  final String description;
  final VoidCallback onRefresh;
  final VoidCallback onBack;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;

  const _ContentPlaceholderScreen({
    Key key,
    @required this.useScaffold,
    @required this.scaffoldTitle,
    this.iconView,
    this.fallbackIcon,
    @required this.expanded,
    @required this.title,
    @required this.description,
    @required this.onRefresh,
    @required this.onBack,
    this.titleTextStyle,
    this.descriptionTextStyle,
  })  : assert(fallbackIcon != null || iconView != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = _ContentPlaceholderBody(
      iconView: iconView,
      icon: fallbackIcon,
      title: title,
      expanded: expanded,
      description: description,
      onRefresh: onRefresh,
      onBack: onBack,
      titleTextStyle: titleTextStyle,
      descriptionTextStyle: descriptionTextStyle,
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
  final bool expanded;
  final String title;
  final String description;
  final VoidCallback onRefresh;
  final VoidCallback onBack;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;

  const _ContentPlaceholderBody({
    Key key,
    this.iconView,
    this.icon,
    @required this.expanded,
    @required this.title,
    @required this.description,
    @required this.onRefresh,
    @required this.onBack,
    @required this.titleTextStyle,
    @required this.descriptionTextStyle,
  })  : assert(icon != null || iconView != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        iconView ??
            Icon(
              icon,
              size: kIconHeight,
              color: Theme.of(context).colorScheme.primary,
            ),
        SizedBox(height: Dimens.of(context).marginMedium),
        Text(
          title,
          style: titleTextStyle ?? Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: Dimens.of(context).marginMedium),
        Text(
          description,
          style: descriptionTextStyle ?? Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: Dimens.of(context).marginMedium),
      ],
    );

    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimens.of(context).marginLarge),
        child: Column(
          children: [
            expanded ? Expanded(child: content) : content,
            if (onRefresh != null)
              DSPrimaryButton(
                text: 'Refresh',
                onPressed: onRefresh,
                forceUpperCase: false,
              ),
            if (onBack != null)
              Padding(
                padding: EdgeInsets.only(top: Dimens.of(context).marginMedium),
                child: DSTextButton(
                  text: 'Go back',
                  forceUpperCase: false,
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
