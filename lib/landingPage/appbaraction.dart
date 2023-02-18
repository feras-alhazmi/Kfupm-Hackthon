import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfupm_hachthon/components/theme.dart';

import '../components/spaces.dart';

AppBar axeAppBar(
  BuildContext context, {
  Key? key,

  /// Title
  Widget? title,
  String? textTitle,
  VoidCallback? onTitleTap,

  /// Actions
  Widget? action,
  List<Widget>? actions,

  /// Styles
  double vPadding = AxeSpace.s12,
  double hPadding = kScreenHSpace,
  PreferredSizeWidget? bottom,
}) {
  /// Title
  final TextStyle? titleTextStyle = context.theme.textTheme.displayLarge;
  Widget? titleWidget;
  if (onTitleTap == null) {
    titleWidget = textTitle != null ? Text(textTitle) : title;

    /// textTitle + onTitleTap
  } else if (textTitle != null) {
    titleWidget = GestureDetector(
      onTap: onTitleTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              textTitle,
              style: titleTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          kHSpace2,
          Icon(
            CupertinoIcons.chevron_down,
            size: 16,
            color: titleTextStyle?.color,
          ),
        ],
      ),
    );
  } else if (title != null) {
    titleWidget = GestureDetector(
      onTap: onTitleTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: title,
          ),
          kHSpace2,
          Icon(
            CupertinoIcons.chevron_down,
            size: 16,
            color: titleTextStyle?.color,
          ),
        ],
      ),
    );
  }

  /// Actions
  final List<Widget>? actionsList = action != null ? [action] : actions;

  return AppBar(
    key: key,

    /// Title
    title: titleWidget,
    centerTitle: false,
    titleTextStyle: titleTextStyle,
    titleSpacing: hPadding,

    /// Actions
    actions: actionsList,

    /// Styles
    elevation: 0,
    backgroundColor: Colors.transparent,
    bottom: bottom,
  );
}

class AxAppBarAction extends StatelessWidget {
  const AxAppBarAction({
    super.key,
    required this.iconData,
    this.onTap,
    this.trailingOne = false,
    this.color,
  });

  final IconData iconData;
  final GestureTapCallback? onTap;
  final bool trailingOne;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.only(
          start: 12,
          end: trailingOne ? (24) : 12,
        ),
        // color: Colors.red,
        child: Icon(
          iconData,
          size: 20,
          color: color ?? context.h1,
        ),
      ),
    );
  }
}
