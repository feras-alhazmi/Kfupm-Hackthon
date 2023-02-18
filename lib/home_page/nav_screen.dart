import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:kfupm_hachthon/components/theme.dart';
import 'package:kfupm_hachthon/landingPage/landing_page.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'home.dart';

class MobileNav extends StatefulWidget {
  const MobileNav({super.key});

  @override
  State<MobileNav> createState() => _MobileNavState();
}

class _MobileNavState extends State<MobileNav> {
  late final PersistentTabController _controller;

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.map_outlined),
        title: 'Roadmap',
        activeColorPrimary: context.h1,
        inactiveColorPrimary: context.h2,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: 'Settings',
        activeColorPrimary: context.h1,
        inactiveColorPrimary: context.h2,
      ),
    ];
  }

  initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,

      controller: _controller,
      screens: [HomePage(), LandingPage()],
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: context.bg3,
      // Default is true.
      handleAndroidBackButtonPress: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      hideNavigationBarWhenKeyboardShows: false,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(8.0),
        // colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),

      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: false,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      // Choose the nav bar style with this property.
      navBarStyle: NavBarStyle.style4,
    );
  }
}
