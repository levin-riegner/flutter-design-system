import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/ui/utils/validated_value.dart';
import 'package:lr_design_system/utils/CapString.dart';

class DSTextField extends StatefulWidget {
  final String initialText;
  final ValidatedValue validatedValue;
  final bool isSensible;
  final String hint;
  final String error;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final VoidCallback onSubmitted;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final Color textColor;
  final bool enabled;
  final bool obscureText;
  final double borderWidth;
  final bool autoCorrect;
  final Function(String) onChanged;

  DSTextField({
    this.initialText = "",
    this.validatedValue,
    this.isSensible = false,
    this.hint,
    this.error,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.unspecified,
    FocusNode focusNode,
    this.nextFocusNode,
    this.onSubmitted,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    Color textColor,
    this.enabled = true,
    this.obscureText = false,
    this.borderWidth,
    this.autoCorrect = false,
    this.onChanged,
  })  : focusNode = focusNode ?? FocusNode(),
        textColor = textColor ?? ThemeProvider.theme.colors.onBackground;

  @override
  State<StatefulWidget> createState() {
    return _DSTextFieldState();
  }
}

class _DSTextFieldState extends State<DSTextField> {
  static var _padding = EdgeInsets.only(
      left: ThemeProvider.theme.spacing.s,
      right: ThemeProvider.theme.spacing.s);
  static var _contentPadding = EdgeInsets.symmetric(
      vertical: ThemeProvider.theme.spacing.m,
      horizontal: ThemeProvider.theme.spacing.s);

  final _controller = TextEditingController();
  bool _isObscure = true;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    // Initial Text
    _controller.text = widget.initialText ?? widget.validatedValue?.value;
    // Listen to Field Selected
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = widget.focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.theme;
    return Wrap(spacing: 0, runSpacing: 0, children: [
      Container(
        padding: _padding,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                enabled: widget.enabled,
                keyboardType: widget.keyboardType,
                controller: _controller,
                style: ThemeProvider.theme.textStyles.body1
                    .copyWith(color: widget.textColor),
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
                maxLines: widget.maxLines,
                autocorrect: widget.autoCorrect,
                focusNode: widget.focusNode,
                autofocus: widget.autofocus,
                obscureText: widget.isSensible ? _isObscure : false,
                cursorColor: ThemeProvider.theme.colors.primary,
                onChanged: widget.onChanged,
                onSubmitted: (text) {
                  if (widget.nextFocusNode != null) {
                    FocusScope.of(context).requestFocus(widget.nextFocusNode);
                  }
                  if (widget.onSubmitted != null) {
                    FocusScope.of(context).unfocus();
                    widget.onSubmitted();
                  }
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: widget.hint.titleCase,
                  border: InputBorder.none,
                  contentPadding: _contentPadding,
                  labelStyle: getHintStyle(),
                ),
                //TextStyle(color: style.labelTextColor)),
              ),
            ),
            if (widget.obscureText)
              IconButton(
                color: theme.colors.onBackground.withOpacity(0.3),
                icon: _isObscure
                    ? theme.invisiblePasswordIcon
                    : theme.visiblePasswordIcon,
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
          ],
        ),
        decoration: BoxDecoration(
          border: widget.borderWidth == 0
              ? null
              : Border.all(
                  color: getBorderColor(),
                  width: widget.borderWidth ?? theme.dimensions.borderSmall,
                ),
          borderRadius: BorderRadius.circular(
            theme.dimensions.radiusMedium,
          ),
        ),
      ),
      Container(
          child: Row(children: <Widget>[
        if (widget.error != null)
          IconButton(
            color: theme.colors.onBackground.withOpacity(0.3),
            icon: new IconTheme(
              data: new IconThemeData(
                  size: ThemeProvider.theme.dimensions.iconSize,
                  color: ThemeProvider.theme.colors.error),
              child: new Icon(Icons.warning),
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        if (widget.error != null)
          Expanded(
            child: Text(
              widget.error,
              style: ThemeProvider.theme.textStyles.caption
                  .copyWith(color: ThemeProvider.theme.colors.error),
            ),
            //TextStyle(color: style.labelTextColor)),
          ),
      ]))
    ]);
  }

  TextStyle getHintStyle() {
    if (_controller.text.isEmpty && !_hasFocus) {
      // If we change the font the box get resized.
      return ThemeProvider.theme.textStyles.body1.copyWith(
          color: ThemeProvider.theme.colors.onBackground.withOpacity(0.3));
    } else {
      if (_hasFocus) {
        return ThemeProvider.theme.textStyles.body1
            .copyWith(color: ThemeProvider.theme.colors.primary);
      } else {
        return ThemeProvider.theme.textStyles.body1.copyWith(
            color: ThemeProvider.theme.colors.onBackground.withOpacity(0.3));
      }
    }
  }

  Color getBorderColor() {
    if (_hasFocus) {
      return ThemeProvider.theme.colors.primary;
    }
    // No Border
    if (widget.borderWidth == 0) return null;
    // Has Error
    if (widget.validatedValue?.isValid == false) {
      return ThemeProvider.theme.colors.error;
    }
    // Focused or has text
    if (_controller.text.isNotEmpty) {
      return ThemeProvider.theme.colors.onBackground.withOpacity(0.2);
    }
    // Default: Not focused & empty
    return ThemeProvider.theme.colors.onBackground.withOpacity(0.2);
  }
}
