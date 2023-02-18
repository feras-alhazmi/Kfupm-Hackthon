import 'package:flutter/material.dart';

extension AxeThemeColors on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get primary => Color.alphaBlend(Color.fromARGB(209, 209, 214, 207), Color.fromARGB(0, 67, 34, 80));

  Color get bg1 => Color.fromARGB(255, 23, 5, 44);
  Color get bg2 => Color.fromARGB(255, 117, 106, 140);
  Color get bg3 => Color.fromRGBO(62, 38, 44, 1);

  Color get h1 => Color.fromARGB(255, 251, 251, 251);
  Color get h2 => Color.fromARGB(255, 249, 249, 249);
  Color get h3 => Color.fromARGB(255, 212, 212, 212);

  Color get red => theme.colorScheme.error;
  BoxDecoration get backgroundDecoration => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(0, 0, 0, 1),
        Color.fromRGBO(52, 28, 72, 1),
        Color.fromRGBO(62, 38, 44, 1),
      ], begin: Alignment.topCenter, end: AlignmentDirectional.bottomEnd));

  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ContextNavigator on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  Future<T?> pushPage<T extends Object?>(Widget page) => navigator.push<T>(
        MaterialPageRoute(builder: (_) => page),
      );

  Future<T?> replacePage<T extends Object?, TO extends Object?>(Widget page) => navigator.pushReplacement<T, TO>(
        MaterialPageRoute(builder: (_) => page),
      );
}

extension Routing on BuildContext {
  void axPop<T>({T? result, bool rootNavigator = true, int count = 1}) {
    for (var i = 0; i < count; i++) {
      Navigator.of(this, rootNavigator: rootNavigator).pop<T>(result);
    }
  }
}
