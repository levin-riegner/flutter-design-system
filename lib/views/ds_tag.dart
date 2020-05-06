import 'package:designsystem/theme/theme.dart';
import 'package:designsystem/views/margins.dart';
import 'package:flutter/material.dart';

class DSTag extends StatelessWidget {
  final String text;
  final String iconPath;
  final String iconSelectedPath;
  final bool isSelected;
  final Function(bool) onSelected;
  final double width;

  DSTag({this.text, this.iconPath, this.iconSelectedPath, this.isSelected, this.onSelected, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: ThemeProvider.theme.dimensions.buttonHeight,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeProvider.theme.dimensions.radiusMedium),
            side: isSelected
                ? BorderSide.none
                : BorderSide(
                    color: ThemeProvider.theme.colors.primaryVariant.withOpacity(0.55), width: ThemeProvider.theme.dimensions.borderSmall)),
        color: isSelected ? ThemeProvider.theme.colors.primary : ThemeProvider.theme.colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(isSelected ? iconSelectedPath : iconPath),
            Margins.Small,
            Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: ThemeProvider.theme.typography.overline
                  .apply(color: isSelected ? ThemeProvider.theme.colors.onPrimary : ThemeProvider.theme.colors.onBackground),
            ),
          ],
        ),
        onPressed: () => onSelected(!isSelected),
      ),
    );
  }
}
