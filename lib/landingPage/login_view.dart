import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:kfupm_hachthon/components/theme.dart';
import 'package:kfupm_hachthon/home_page/home.dart';
import 'package:kfupm_hachthon/home_page/nav_screen.dart';

import '../components/button.dart';
import '../components/spaces.dart';
import '../components/textfield.dart';

class AxLoginPage extends HookWidget {
  const AxLoginPage({
    super.key,
    this.title,
    this.subtitle,
    this.signInTitle,
    this.createAccountTitle,
    this.signInOnTap,
    this.signUpOnTap,
    this.forgotText,
    this.resetText,
    this.logo,
  });

  final String? title;
  final String? subtitle;
  final String? signInTitle;
  final String? createAccountTitle;
  final GestureTapCallback? signInOnTap;
  final GestureTapCallback? signUpOnTap;
  final String? forgotText;
  final String? resetText;
  final Widget? logo;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return AxAuthPage(
      title: 'Login to Dilny',
      subtitle: subtitle ?? 'Welcome back!',
      firstButtonFunction: () {
        // authController.login(context, app: app);
        context.replacePage(const MobileNav());
        signInOnTap;
      },
      firstButtonTitle: signInTitle ?? 'Login',
      logo: logo ?? const Text('Logo'),
      child: AutofillGroup(
        child: Column(children: [
          AxTextField.email(
              //controller: authController.emailController,
              ),
          kVSpace16,
          AxTextField.password(
            // controller: authController.passwordController,
            onEditingComplete: (_) => node.unfocus(),
            newPassword: false,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(forgotText ?? ' Forgot password?', style: TextStyle(color: context.h1)),
            TextButton(
              onPressed: () {},
              child: Text(
                resetText ?? ' Click to reset',
                style: TextStyle(color: context.primary, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}

class AxAuthPage extends StatelessWidget {
  const AxAuthPage({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.firstButtonFunction,
    this.firstButtonTitle,
    this.titleFontSize = 28,
    this.subtitleFontSize = 22,
    required this.logo,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final String? firstButtonTitle;
  final GestureTapCallback? firstButtonFunction;
  final Widget logo;
  final double titleFontSize;
  final double subtitleFontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: context.backgroundDecoration,
          child: SafeArea(
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    child: Container(
                      height: 390,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          logo,
                          kVSpace24,
                          Text(
                            title,
                            style: TextStyle(color: context.h1, fontSize: titleFontSize, fontWeight: FontWeight.bold),
                          ),
                          kVSpace16,
                          if (subtitle != null) ...[
                            Text(
                              subtitle ?? '',
                              style:
                                  TextStyle(color: context.h2, fontSize: subtitleFontSize, fontWeight: FontWeight.w100),
                            ),
                            kVSpace32,
                          ],
                          child,
                          kVSpace12,
                          AxButton(
                            title: firstButtonTitle ?? '',
                            color: AxButtonColor.primary,
                            onTap: firstButtonFunction,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverFillRemaining(hasScrollBody: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
