import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kfupm_hachthon/components/theme.dart';
import 'package:kfupm_hachthon/landingPage/answers.dart';
import 'package:kfupm_hachthon/landingPage/pre_survey.dart';
import 'package:kfupm_hachthon/landingPage/profilestep.dart';

import '../components/button.dart';
import '../components/spaces.dart';
import '../components/textfield.dart';
import '../home_page/home.dart';
import '../home_page/nav_screen.dart';
import 'ax_step.dart';

class Survey extends HookWidget {
  const Survey({super.key});

  // Future<T?> open<T>(BuildContext context) async {
  //   return context.axeSheet<T>(this, enableDrag: false);
  // }

  @override
  Widget build(
    BuildContext context,
  ) {
    return AxSteppedPage(
      title: 'Let us set you up ',
      init: () {
        //appConfigProvider.update((config) => config.copyWith(isDoingOnboarding: true));
      },
      onClose: () {
        ///appConfigProvider.update((config) => config.copyWith(isDoingOnboarding: false));
        context.axPop();
      },
      useProgressIndicatorInsteadOfSteps: true,
      completedBody: Container(
        height: 400,
        width: context.mediaQuery.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kVSpace64,
            kVSpace64,
            kVSpace64,
            const Text('${'You are all set up'}! 🎉',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, height: 1.3, color: Colors.white)),
            kVSpace24,
            AxButton(
              title: 'Click to start',
              color: AxButtonColor.primary,
              onTap: () {
                //context.axPop();
                context.replacePage(const MobileNav()
                    // AxSignUpScreen(logo: widget.logo),
                    );
                //appConfigProvider.update((config) => config.copyWith(isDoingOnboarding: false));
                //context.axPop();
              },
            ),
            kVSpace64,
          ],
        ),
      ),
      steps: [
        AxStep(
          title: 'what  is your favorite Subject ?',
          content: Answers(),
          onNext: () async {
            return true;
          },
        ),
        AxStep(
          title: 'what  is your favorite Subject ?',
          content: Answers(),
          onNext: () async {
            return true;
          },
        ),
      ],
    );
  }
}
