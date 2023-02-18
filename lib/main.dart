import 'package:flutter/material.dart';
import 'package:kfupm_hachthon/components/theme.dart';

import 'home_page/nav_screen.dart';
import 'landingPage/landing_page.dart';
import 'landingPage/onboarding_flow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData k = ThemeData(
        primaryColor: Color.lerp(Colors.black, Colors.blue, 40), appBarTheme: AppBarTheme(color: context.primary));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dilny',
      home: LandingPage(),
      theme: k,
    );
  }
}
