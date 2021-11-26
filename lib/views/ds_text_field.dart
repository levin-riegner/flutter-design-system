import 'package:flutter/material.dart';
import 'package:lr_design_system/utils/dimens.dart';
import 'package:lr_design_system/utils/validated_value.dart';
import 'package:lr_design_system/utils/cap_string.dart';

class DSTextField extends StatefulWidget {
  final String? initialText;
  final ValidatedValue? validatedValue;
  final bool isSensible;
  final String? hint;
  final String? error;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? onSubmitted;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final Color? textColor;
  final bool enabled;
  final bool obscureText;
  final double? borderWidth;
  final bool autoCorrect;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  Widget get visiblePasswordIcon => Icon(Icons.visibility);

  Widget get invisiblePasswordIcon => Icon(Icons.visibility_off);

  DSTextField({
    this.initialText,
    this.validatedValue,
    this.isSensible = false,
    this.hint,
    this.error,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
    this.nextFocusNode,
    this.onSubmitted,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.textColor,
    this.enabled = true,
    this.obscureText = false,
    this.borderWidth,
    this.autoCorrect = false,
    this.contentPadding,
    this.onChanged,
  })  : focusNode = focusNode ?? FocusNode(),
        keyboardType = keyboardType ?? (maxLines > 1 ? TextInputType.multiline : TextInputType.text),
        textInputAction = textInputAction ??
            (maxLines > 1
                ? TextInputAction.newline
                : ((nextFocusNode != null
                    ? TextInputAction.next
                    : (onSubmitted != null ? TextInputAction.done : TextInputAction.unspecified))));

  @override
  State<StatefulWidget> createState() {
    return _DSTextFieldState();
  }
}

class _DSTextFieldState extends State<DSTextField> {

  final _controller = TextEditingController();
  bool _isObscure = true;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    // Initial Text
    _controller.text = widget.initialText ?? widget.validatedValue?.value ??  "";
    // Listen to Field Selected
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(covariant DSTextField oldWidget) {
    if(oldWidget.initialText != widget.initialText && _controller.text.isNotEmpty != true) {
      _controller.text = widget.initialText ?? widget.validatedValue?.value;
    }
    super.didUpdateWidget(oldWidget);
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
    return Column(children: [
      ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: Dimens.of(context).marginSmall,
        ),
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(
            vertical: Dimens.of(context).marginSmall,
            horizontal: Dimens.of(context).marginSmall,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.start,
                  enabled: widget.enabled,
                  keyboardType: widget.keyboardType,
                  controller: _controller,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(color: widget.textColor ?? Theme.of(context).colorScheme.onBackground),
                  textInputAction: widget.textInputAction,
                  textCapitalization: widget.textCapitalization,
                  maxLines: widget.maxLines,
                  autocorrect: widget.autoCorrect,
                  focusNode: widget.focusNode,
                  autofocus: widget.autofocus,
                  obscureText: widget.isSensible ? _isObscure : false,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  onChanged: widget.onChanged,
                  onSubmitted: (text) {
                    if (widget.nextFocusNode != null) {
                      FocusScope.of(context).requestFocus(widget.nextFocusNode);
                    }
                    if (widget.onSubmitted != null) {
                      FocusScope.of(context).unfocus();
                      widget.onSubmitted!();
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: widget.hint?.titleCase,
                    contentPadding: widget.contentPadding ?? EdgeInsets.zero,
                    border: InputBorder.none,
                    labelStyle: getHintStyle(),
                  ),
                ),
              ),
              if (widget.obscureText)
                IconButton(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
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
                    color: getBorderColor()!,
                    width: widget.borderWidth ?? Dimens.of(context).borderSmall,
                  ),
            borderRadius: BorderRadius.circular(
              Dimens.of(context).radiusMedium,
            ),
          ),
        ),
      ),
      if (widget.error != null)
        Padding(
          padding: EdgeInsets.only(
            left: Dimens.of(context).marginSmall,
            top: Dimens.of(context).marginSmall,
            right: Dimens.of(context).marginSmall,
            bottom: Dimens.of(context).marginSmall,
          ),
          child: Row(children: <Widget>[
            Icon(Icons.warning, color: Theme.of(context).colorScheme.error),
            SizedBox(width: Dimens.of(context).marginSmall),
            Expanded(
              child: Text(
                widget.error!,
                style: Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ]),
        )
    ]);
  }

  TextStyle getHintStyle() {
    if (_controller.text.isEmpty && !_hasFocus) {
      // If we change the font the box get resized.
      return Theme.of(context).textTheme.bodyText2!.copyWith(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
      );
    } else {
      if (_hasFocus) {
        return Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).colorScheme.primary);
      } else {
        return Theme.of(context).textTheme.bodyText2!.copyWith(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
        );
      }
    }
  }

  Color? getBorderColor() {
    if (_hasFocus) {
      return Theme.of(context).colorScheme.primary;
    }
    // No Border
    if (widget.borderWidth == 0) return null;
    // Has Error
    if (widget.validatedValue?.isValid == false) {
      return Theme.of(context).colorScheme.error;
    }
    // Focused or has text
    if (_controller.text.isNotEmpty) {
      return Theme.of(context).colorScheme.onBackground.withOpacity(0.2);
    }
    // Default: Not focused & empty
    return Theme.of(context).colorScheme.onBackground.withOpacity(0.2);
  }
}
