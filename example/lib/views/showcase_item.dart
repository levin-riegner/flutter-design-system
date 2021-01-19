import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/dimens.dart';

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
      margin: EdgeInsets.all(Dimens.of(context).marginMedium),
      child: Padding(
        padding: EdgeInsets.all(Dimens.of(context).marginMedium),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Dimens.of(context).boxSmall,
            content,
            if (modifiers != null)
              Padding(
                padding: EdgeInsets.only(top: Dimens.of(context).marginSmall),
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
