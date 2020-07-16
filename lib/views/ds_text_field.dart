import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';

class DSTextField extends StatefulWidget {
  final String text;
  final bool isSensible;
  final String hint;
  final String error;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final VoidCallback onSubmitted;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final DSTextFieldType type;
  final int maxLines;
  final Color textColor;
  final bool enabled;

  DSTextField({
    this.text,
    this.isSensible = false,
    this.hint,
    this.error,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.unspecified,
    FocusNode focusNode,
    this.nextFocusNode,
    this.onSubmitted,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.type = DSTextFieldType.form,
    this.maxLines = 1,
    this.textColor,
    this.enabled = true,
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

  _DSTextFieldState({@required String text, this.error}) {
    textEditingController.text = text;
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
    if (widget.text != oldWidget.text && widget.text != textEditingController.text) {
      textEditingController.text = widget.text;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: ThemeProvider.theme.colors.error, width: ThemeProvider.theme.dimensions.borderSmall),
      borderRadius: BorderRadius.circular(ThemeProvider.theme.dimensions.radiusMedium),
    );
    return SizedBox(
      child: TextFormField(
        keyboardAppearance: Brightness.light,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        controller: textEditingController,
        style: ThemeProvider.theme.textStyles.body1.copyWith(color: widget.textColor ?? ThemeProvider.theme.colors.onBackground),
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        maxLines: widget.maxLines,
        autocorrect: false,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        obscureText: widget.isSensible ? isTextObscured : false,
        cursorColor: ThemeProvider.theme.colors.primary,
        decoration: widget.type == DSTextFieldType.form
            ? InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeProvider.theme.colors.interaction, width: ThemeProvider.theme.dimensions.borderSmall),
                  borderRadius: BorderRadius.circular(ThemeProvider.theme.dimensions.radiusMedium),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeProvider.theme.colors.primary, width: ThemeProvider.theme.dimensions.borderSmall),
                  borderRadius: BorderRadius.circular(ThemeProvider.theme.dimensions.radiusMedium),
                ),
                errorMaxLines: 3,
                contentPadding: EdgeInsets.all(ThemeProvider.theme.spacing.m),
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
                suffixIcon: widget.isSensible
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: ThemeProvider.theme.spacing.xs),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(ThemeProvider.theme.dimensions.radiusMedium),
                          // TODO: Review
                          child: Image.asset(
                            isTextObscured ? "assets/images/icons/icVisibilityOff.png" : "assets/images/icons/icVisibility.png",
                          ),
                          onTap: () {
                            setState(() {
                              this.isTextObscured = !this.isTextObscured;
                            });
                          },
                        ),
                      )
                    : null,
                border: const OutlineInputBorder(),
                labelStyle: ThemeProvider.theme.textStyles.body2.copyWith(color: ThemeProvider.theme.colors.onBackground.withOpacity(0.30)),
                labelText: widget.hint,
                errorText: error,
                errorStyle: ThemeProvider.theme.textStyles.body2.copyWith(color: ThemeProvider.theme.colors.error.withOpacity(0.30)),
              )
            : InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0.0),
                hintText: widget.hint,
              ),
        onChanged: widget.onChanged,
        onFieldSubmitted: (text) {
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
          if (widget.onSubmitted != null) {
            FocusScope.of(context).unfocus();
            widget.onSubmitted();
          }
        },
      ),
    );
  }
}

enum DSTextFieldType { form, plain }
