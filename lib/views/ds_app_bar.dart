import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backEnabled;

  const DSAppBar({this.title, this.backEnabled});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: ThemeProvider.theme.textStyles.h4.copyWith(color: ThemeProvider.theme.colors.onPrimary),
      ),
      leading: backEnabled
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: ThemeProvider.theme.colors.onPrimary,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      backgroundColor: ThemeProvider.theme.colors.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ThemeProvider.theme.dimensions.navigationBarHeight);
}
