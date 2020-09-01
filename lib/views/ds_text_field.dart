import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/ui/utils/validated_value.dart';
import 'package:lr_design_system/utils/cap_string.dart';

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

  Widget get visiblePasswordIcon => Icon(Icons.visibility);

  Widget get invisiblePasswordIcon => Icon(Icons.visibility_off);

  Widget get errorIcon => Icon(Icons.warning, color: ThemeProvider.theme.colors.error);

  DSTextField({
    this.initialText = "",
    this.validatedValue,
    this.isSensible = false,
    this.hint,
    this.error,
    TextInputType keyboardType,
    TextInputAction textInputAction,
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
        textColor = textColor ?? ThemeProvider.theme.colors.onBackground,
        keyboardType = keyboardType ?? (maxLines > 1 ? TextInputType.multiline : TextInputType.text),
        textInputAction = textInputAction ?? maxLines > 1
            ? TextInputAction.newline
            : ((nextFocusNode != null ? TextInputAction.next : (onSubmitted != null ? TextInputAction.done : TextInputAction.unspecified)));

  @override
  State<StatefulWidget> createState() {
    return _DSTextFieldState();
  }
}

class _DSTextFieldState extends State<DSTextField> {
  final _contentPadding = EdgeInsets.symmetric(
    vertical: ThemeProvider.theme.spacing.m,
    horizontal: ThemeProvider.theme.spacing.m,
  );
  final _errorPadding = EdgeInsets.only(
    left: ThemeProvider.theme.spacing.s,
    top: ThemeProvider.theme.spacing.s,
    right: ThemeProvider.theme.spacing.s,
    bottom: ThemeProvider.theme.spacing.m,
  );
  final _minFieldHeight = ThemeProvider.theme.dimensions.listItemHeight;

  final _controller = TextEditingController();
  bool _isObscure = true;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    // Initial Text
    _controller.text = widget.initialText ?? widget.validatedValue?.value ?? "";
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
    return Column(children: [
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: _minFieldHeight,
        ),
        child: Container(
          alignment: Alignment.topLeft,
          padding: _contentPadding,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.start,
                  enabled: widget.enabled,
                  keyboardType: widget.keyboardType,
                  controller: _controller,
                  style: ThemeProvider.theme.textStyles.body1.copyWith(color: widget.textColor),
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
                    labelText: widget.hint?.titleCase,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    labelStyle: getHintStyle(),
                  ),
                ),
              ),
              if (widget.obscureText)
                IconButton(
                  color: theme.colors.onBackground.withOpacity(0.3),
                  icon: _isObscure ? widget.invisiblePasswordIcon : widget.visiblePasswordIcon,
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
      ),
      if (widget.error != null)
        Padding(
          padding: _errorPadding,
          child: Row(children: <Widget>[
            widget.errorIcon,
            SizedBox(width: ThemeProvider.theme.spacing.s),
            Expanded(
              child: Text(
                widget.error,
                style: ThemeProvider.theme.textStyles.caption.copyWith(color: ThemeProvider.theme.colors.error),
              ),
            ),
          ]),
        )
    ]);
  }

  TextStyle getHintStyle() {
    if (_controller.text.isEmpty && !_hasFocus) {
      // If we change the font the box get resized.
      return ThemeProvider.theme.textStyles.body1.copyWith(
        color: ThemeProvider.theme.colors.onBackground.withOpacity(0.3),
      );
    } else {
      if (_hasFocus) {
        return ThemeProvider.theme.textStyles.body1.copyWith(color: ThemeProvider.theme.colors.primary);
      } else {
        return ThemeProvider.theme.textStyles.body1.copyWith(
          color: ThemeProvider.theme.colors.onBackground.withOpacity(0.3),
        );
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
