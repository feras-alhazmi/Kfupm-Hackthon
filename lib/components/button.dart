import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kfupm_hachthon/components/spaces.dart';
import 'package:kfupm_hachthon/components/theme.dart';

enum AxButtonStyle { filled, outlined }

enum AxButtonColor { primary, normal, delete, landing, h2 }

class AxButton extends StatelessWidget {
  const AxButton({
    required this.title,
    this.style = AxButtonStyle.filled,
    this.color = AxButtonColor.normal,
    this.onTap,
    this.dynamicHeight = false,
    this.icon,
    this.expanded = false,
    super.key,
    this.iconSize,
    this.iconPadding,
    this.isLoading = false,
  });

  final bool expanded;
  final bool dynamicHeight;
  final String title;
  final AxButtonStyle style;
  final AxButtonColor color;
  final IconData? icon;
  final Function()? onTap;
  final double? iconSize;
  final bool isLoading;
  final EdgeInsets? iconPadding;

  static Color getBackgroundColor(BuildContext context, AxButtonColor colorStyle) {
    if (colorStyle == AxButtonColor.normal) {
      return context.bg2;
    } else if (colorStyle == AxButtonColor.h2) {
      return context.h3.withOpacity(0.2);
    } else if (colorStyle == AxButtonColor.primary) {
      return context.primary.withOpacity(0.2);
    } else if (colorStyle == AxButtonColor.delete) {
      return context.red.withOpacity(0.2);
    } else if (colorStyle == AxButtonColor.landing) {
      return context.primary;
    }
    return Colors.red;
  }

  static Color getTextColor(BuildContext context, AxButtonColor colorStyle) {
    if (colorStyle == AxButtonColor.normal) {
      return context.h1;
    } else if (colorStyle == AxButtonColor.h2) {
      return context.h1.withOpacity(0.7);
    } else if (colorStyle == AxButtonColor.primary) {
      return context.primary;
    } else if (colorStyle == AxButtonColor.delete) {
      return context.theme.colorScheme.onError;
    } else if (colorStyle == AxButtonColor.landing) {
      return context.bg1;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //expanded: expanded,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: dynamicHeight ? null : 40,
          decoration: BoxDecoration(
            color: style == AxButtonStyle.filled ? getBackgroundColor(context, color) : null,
            border: Border.all(
              color: style == AxButtonStyle.outlined ? getBackgroundColor(context, color) : Colors.transparent,
              width: 2,
            ),
            borderRadius: kBorderRadius,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AxeSpace.s8, horizontal: AxeSpace.s16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Padding(
                      padding: iconPadding ?? const EdgeInsets.all(0),
                      child: !isLoading
                          ? Icon(
                              icon,
                              color: AxButton.getTextColor(context, color),
                              size: iconSize ?? 16,
                            )
                          : SpinKitRing(
                              color: context.primary,
                              size: 15.0,
                              lineWidth: 2,
                            ),
                    ),
                    kHSpace6,
                  ],
                  Text(
                    title,
                    style: TextStyle(
                      color: getTextColor(context, color),
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
