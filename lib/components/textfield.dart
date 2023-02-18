import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfupm_hachthon/components/spaces.dart';
import 'package:kfupm_hachthon/components/theme.dart';

class AxTextField extends StatelessWidget {
  const AxTextField({
    super.key,
    this.controller,
    this.title,
    this.placeholder,
    this.readOnly = false,
    this.showSuffixButton = false,
    this.backgroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.autofocus = false,
    this.suffixButtonTitle = 'Edit',
    this.suffixButtonColor = Colors.grey,
    this.loading = false,
    this.textAlign = TextAlign.start,
    this.onSubmitted,
    this.inputFormatters,
    this.keyboardType,
    this.style,
    this.onTap,
    this.topLeftBorderRadius = 4,
    this.topRightBorderRadius = 4,
    this.bottomLeftBorderRadius = 4,
    this.bottomRightBorderRadius = 4,
    this.customPrefixChild,
    this.customSuffixChild,
    this.labelStyle,
    this.hintStyle,
    this.maxLines = 1,
    this.alignLabelWithHint,
    this.onEditingComplete,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.floatingLabelBehavior,
    this.hideKeyboardOnComplete = false,
    this.textDirection,
    this.autofillHints,
    this.focusedBorder,
    this.enabledBorder,
    this.cursorColor,
    this.floatingLabelAlignment,
    this.borderColor,
    this.leftBorder = true,
    this.rightBorder = true,
    this.topBorder = true,
    this.bottomBorder = true,
  });

  final String? title;
  final String? placeholder;
  final TextEditingController? controller;
  final bool readOnly;
  final bool showSuffixButton;
  final String suffixButtonTitle;
  final Color suffixButtonColor;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? customPrefixChild;
  final Widget? customSuffixChild;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final bool topBorder;
  final bool leftBorder;
  final bool rightBorder;
  final bool bottomBorder;
  final bool loading;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final GestureTapCallback? onTap;
  final double topLeftBorderRadius;
  final double topRightBorderRadius;
  final double bottomLeftBorderRadius;
  final double bottomRightBorderRadius;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final int? maxLines;
  final bool? alignLabelWithHint;
  final VoidCallback? onEditingComplete;
  final bool obscureText, autocorrect, enableSuggestions, hideKeyboardOnComplete;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final TextDirection? textDirection;
  final Iterable<String>? autofillHints;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? cursorColor;
  final Color? borderColor;

  factory AxTextField.email({
    TextEditingController? controller,
    ValueChanged<String>? onEditingComplete,
  }) {
    return AxTextField(
      controller: controller,
      title: 'Email',
      onSubmitted: onEditingComplete,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      enableSuggestions: true,
      hideKeyboardOnComplete: true,
      textDirection: TextDirection.ltr,
      autofillHints: const [AutofillHints.email],
    );
  }

  factory AxTextField.password({
    TextEditingController? controller,
    ValueChanged<String>? onEditingComplete,
    bool newPassword = true,
  }) {
    return AxTextField(
      controller: controller,
      title: 'Password',
      onSubmitted: onEditingComplete,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      autocorrect: false,
      enableSuggestions: true,
      hideKeyboardOnComplete: true,
      textDirection: TextDirection.ltr,
      autofillHints: newPassword ? const [AutofillHints.newPassword] : const [AutofillHints.password],
    );
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.white,
          //backgroundColor ?? context.bg2,
          // border: Border(
          //   top: topBorder ? BorderSide(color: borderColor ?? context.bg2, width: 1.5) : BorderSide.none,
          //   left: leftBorder ? BorderSide(color: borderColor ?? context.bg2, width: 1.5) : BorderSide.none,
          //   right: rightBorder ? BorderSide(color: borderColor ?? context.bg2, width: 1.5) : BorderSide.none,
          //   bottom: bottomBorder ? BorderSide(color: borderColor ?? context.bg2, width: 1.5) : BorderSide.none,
          // ),
          borderRadius: (topBorder && leftBorder && rightBorder && bottomBorder)
              ? BorderRadius.only(
                  topLeft: Radius.circular(topLeftBorderRadius),
                  topRight: Radius.circular(topRightBorderRadius),
                  bottomLeft: Radius.circular(bottomLeftBorderRadius),
                  bottomRight: Radius.circular(bottomRightBorderRadius),
                )
              : null,
        ),
        child: Row(
          children: [
            if (customPrefixChild != null) kHSpace16,
            if (customPrefixChild != null) customPrefixChild!,
            Expanded(
              child: IgnorePointer(
                ignoring: onTap != null || readOnly || loading,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: title,
                    labelStyle: labelStyle ?? TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w100),
                    hintText: placeholder,
                    hintStyle: hintStyle ?? TextStyle(color: context.h2, fontSize: 14, fontWeight: FontWeight.w100),
                    floatingLabelBehavior: floatingLabelBehavior,
                    floatingLabelAlignment: floatingLabelAlignment,
                    contentPadding: const EdgeInsets.symmetric(vertical: AxeSpace.s8, horizontal: 10),
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    filled: backgroundColor != null,
                    fillColor: backgroundColor,
                    focusedBorder: focusedBorder,
                    enabledBorder: enabledBorder,
                    border: InputBorder.none,
                    alignLabelWithHint: alignLabelWithHint,
                  ),
                  keyboardType: keyboardType,
                  style: style,
                  textAlign: textAlign,
                  textDirection: textDirection,
                  readOnly: readOnly,
                  autofocus: autofocus,
                  obscureText: obscureText,
                  autocorrect: autocorrect,
                  enableSuggestions: enableSuggestions,
                  maxLines: maxLines,
                  onChanged: onChanged,
                  onEditingComplete: () {
                    if (hideKeyboardOnComplete) hideKeyboard();
                    if (onEditingComplete != null) onEditingComplete!();
                    if (onSubmitted != null) onSubmitted!(controller?.text ?? '');
                    if (onEditingComplete == null) node.unfocus();
                  },
                  inputFormatters: inputFormatters,
                  cursorColor: cursorColor,
                  autofillHints: autofillHints,
                ),
              ),
            ),
            if (showSuffixButton || loading) kHSpace16,
            // if (showSuffixButton && !loading && customSuffixChild == null)
            //   AxTinyButton(suffixButtonTitle, color: suffixButtonColor),
            if (!loading && customSuffixChild != null) customSuffixChild!,
            // if (loading) const AxeLoading(size: 20),
            if (showSuffixButton || loading || customSuffixChild != null) kHSpace16,
          ],
        ),
      ),
    );
  }
}

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
