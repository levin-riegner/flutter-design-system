import 'package:flutter/material.dart';

class DSAppBar extends StatelessWidget implements PreferredSizeWidget {

  static const _kAppBarHeight = 56.0;

  final String title;
  final bool backEnabled;
  final VoidCallback onBack;

  const DSAppBar({
    @required this.title,
    @required this.backEnabled,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      leading: backEnabled
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed:  onBack != null ? onBack : () => Navigator.of(context).pop(),
            )
          : null,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_kAppBarHeight);
}
