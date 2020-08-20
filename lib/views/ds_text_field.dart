import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/ui/utils/validated_value.dart';

class DSTextField extends StatefulWidget {
  final String text;
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
  final ValidatedValue validatedValue;
  final String initialText;
  final String placeholderText;
  final bool obscureText;
  final bool isValid;
  final double borderWidth;
  final void Function(String) onChanged;

  DSTextField({
    this.text,
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
    this.textColor,
    this.enabled = true,
    this.validatedValue,
    this.initialText,
    this.placeholderText,
    this.onChanged,
    this.obscureText = false,
    this.isValid,
    this.borderWidth,
  }) : focusNode = focusNode ?? FocusNode();

  @override
  State<StatefulWidget> createState() {
    return _DSTextFieldState(
      text: text,
      error: error,
    );
  }
}

class _DSTextFieldState extends State<DSTextField> {
  String error;

  final textEditingController = TextEditingController();

  var isTextObscured = true;

  static const _padding = EdgeInsets.only(left: 10.0, right: 3.0);
  static const _contentPadding = EdgeInsets.symmetric(vertical: 7.0);
  final _controller = TextEditingController();
  bool _isObscure = true;

  _DSTextFieldState({@required String text, this.error}) {
    textEditingController.text = text;

    @override
    void initState() {
      super.initState();
      _controller.text = widget.initialText ?? widget.validatedValue?.value;
    }

    @override
    _DSTextFieldState createState() => _DSTextFieldState();
  }

  @override
  void didUpdateWidget(DSTextField oldWidget) {
    // Update Error State
    if (widget.error != oldWidget.error) {
      setState(() {
        error = widget.error;
      });
    }
    // Update Text
    if (widget.text != oldWidget.text &&
        widget.text != textEditingController.text) {
      textEditingController.text = widget.text;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText ?? widget.validatedValue?.value;
  }

  @override
  Widget build(BuildContext context) {
    final style = ThemeProvider.theme;
    return Container(
      padding: _padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              keyboardAppearance: Brightness.light,
              enabled: widget.enabled,
              keyboardType: widget.keyboardType,
              controller: textEditingController,
              style: ThemeProvider.theme.textStyles.body1.copyWith(
                  color: widget.textColor ??
                      ThemeProvider.theme.colors.onBackground),
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              maxLines: widget.maxLines,
              autocorrect: false,
              focusNode: widget.focusNode,
              autofocus: widget.autofocus,
              obscureText: widget.isSensible ? isTextObscured : false,
              cursorColor: ThemeProvider.theme.colors.primary,

              //controller: _controller,
              //obscureText: widget.obscureText && _isObscure,
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
              //cursorColor: style.colors.primary,
              //style: style.textStyles.body1,
              decoration: InputDecoration(
                isDense: true,
                labelText: widget.placeholderText,
                border: InputBorder.none,
                contentPadding: _contentPadding,
                labelStyle: style.textStyles.body1,
              ),

              //TextStyle(color: style.labelTextColor)),
            ),
          ),
          if (widget.obscureText)
            IconButton(
              color: style.colors.primary,
              icon: _isObscure
                  ? style.invisiblePasswordIcon
                  : style.visiblePasswordIcon,
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            )
        ],
      ),
      decoration: BoxDecoration(
        border: widget.borderWidth == 0 ? null : Border.all(
          color: (widget.isValid ?? widget.validatedValue?.isValid) == false
              ? style.colors.error
              : style.colors.error,
          width: (widget.borderWidth != null ) ? widget.borderWidth : style.dimensions.borderSmall,
        ),
        borderRadius: BorderRadius.circular(
          style.dimensions.radiusMedium,
        ),
      ),
    );
  }
}
