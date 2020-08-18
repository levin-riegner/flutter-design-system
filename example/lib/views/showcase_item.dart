import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/views/margins.dart';

class ShowCaseModifier extends StatelessWidget {
  final String title;
  final VoidCallback action;

  const ShowCaseModifier({Key key, @required this.title, @required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(title),
      onPressed: action,
    );
  }
}

class ShowCaseItem extends StatelessWidget {
  final String title;
  final Widget content;
  final List<ShowCaseModifier> modifiers;

  const ShowCaseItem(
      {Key key, @required this.title, @required this.content, this.modifiers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ThemeProvider.theme.spacing.m),
      child: Padding(
        padding: EdgeInsets.all(ThemeProvider.theme.spacing.m),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: ThemeProvider.theme.textStyles.h5,
            ),
            Margins.small,
            content,
            if (modifiers != null)
              Padding(
                padding: EdgeInsets.only(top: ThemeProvider.theme.spacing.s),
                child: Wrap(
                  children: modifiers,
                ),
              )
          ],
        ),
      ),
    );
  }
}
