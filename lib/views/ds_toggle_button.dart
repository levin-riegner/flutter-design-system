import 'package:lr_design_system/utils/dimens.dart';
import 'package:flutter/material.dart';

class DSToggleButton extends StatelessWidget {
  final String text;
  final Widget? defaultIcon;
  final Widget? selectedIcon;
  final bool isSelected;
  final Function(bool)? onSelected;
  final bool tintIcon;

  final double width;
  final double? height;
  final double? radius;
  final double? defaultBorderWidth;
  final Color? defaultBorderColor;
  final Color defaultColor;
  final Color? selectedColor;
  final TextStyle? textStyle;

  const DSToggleButton({
    required this.text,
    this.defaultIcon,
    this.selectedIcon,
    this.isSelected = false,
    this.onSelected,
    this.width = double.infinity,
    this.tintIcon = true,
    this.height,
    this.radius,
    this.defaultBorderWidth,
    this.defaultBorderColor,
    this.defaultColor = const Color.fromARGB(0, 0, 0, 0),
    this.selectedColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final icon = isSelected ? selectedIcon : defaultIcon;
    return SizedBox(
      width: width,
      height: height ?? Dimens.of(context).buttonHeight,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    radius ?? Dimens.of(context).radiusMedium),
                side: isSelected
                    ? BorderSide.none
                    : BorderSide(
                        color: defaultBorderColor ??
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.55),
                        width: defaultBorderWidth ??
                            Dimens.of(context).borderSmall)),
          ),
          backgroundColor: MaterialStatePropertyAll(
            isSelected
                ? (selectedColor ?? Theme.of(context).colorScheme.primary)
                : defaultColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (icon != null)
              tintIcon
                  ? ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onBackground,
                          BlendMode.srcIn),
                      child: icon)
                  : icon,
            if (icon != null) SizedBox(height: Dimens.of(context).marginSmall),
            Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.overline!.apply(
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
        onPressed: onSelected != null ? () => onSelected!(!isSelected) : null,
      ),
    );
  }
}
