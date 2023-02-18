import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kfupm_hachthon/components/theme.dart';
import 'package:kfupm_hachthon/landingPage/pre_survey.dart';
import 'package:kfupm_hachthon/landingPage/profilestep.dart';

import '../components/button.dart';
import '../components/spaces.dart';
import '../components/textfield.dart';
import '../home_page/home.dart';
import '../home_page/nav_screen.dart';
import 'ax_step.dart';

class AxOnboardingFlow extends HookWidget {
  const AxOnboardingFlow({super.key});

  // Future<T?> open<T>(BuildContext context) async {
  //   return context.axeSheet<T>(this, enableDrag: false);
  // }

  @override
  Widget build(
    BuildContext context,
  ) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final gradYear = useState(DateTime.now());
    final isNewUser = useState(true);

    return AxSteppedPage(
      title: 'Create Account',
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
        // const AxStep(
        //   content: AxFirstStep(),
        //   nextTitle: "Let's Start!",
        // ),

        /// Email
        AxStep(
          title: 'My email is ...',
          content: AxTextField.email(
            controller: emailController,
          ),
          onNext: () async {
            // final isEmailValid = AuthService().isEmail(emailController.text);
            // if (!isEmailValid) {
            //   AxDialog(
            //     emoji: '🙈',
            //     title: 'Bad email'.t,
            //     message: 'Please enter a valid email address'.t,
            //     buttonTitle: 'Try again'.t,
            //   ).show(context);
            //   return false;
            // }

            // if (AuthService().user?.email == emailController.text) {
            //   return true;
            // }

            // /// demo@axenda.io
            // final result = await context.showLoadingWhileRunning(
            //   function: () => AxKhottaApiService().post('auth/is-email-used', {'email': emailController.text}),
            // );

            // final isRegistered = (result.data?['is_registered'] as bool?) ?? false;
            // isNewUser.value = !isRegistered;

            return true;
          },
        ),
        AxStep(
          title: 'My password is ...',
          content: AxTextField.password(
            controller: passwordController,
            onEditingComplete: (_) {},
          ),
          onNext: () async {
            // if (AuthService().user?.email == emailController.text) {
            //   return true;
            // }

            // String? error;
            // if (isNewUser.value) {
            //   final isPasswordValid = passwordController.text.trim().length > 5;
            //   if (!isPasswordValid) {
            //     AxDialog(
            //       emoji: '🙈',
            //       title: 'Short password',
            //       message: 'Please enter a longer password',
            //       buttonTitle: 'Try again',
            //     ).show(context);
            //     return false;
            //   }

            //   error = await context.showLoadingWhileRunning(
            //     function: () => AuthService().register(emailController.text, passwordController.text),
            //   );
            // } else {
            //   error = await context.showLoadingWhileRunning(
            //     function: () => AuthService().login(emailController.text, passwordController.text),
            //   );
            // }

            // if (error != null) {
            //   // ignore: use_build_context_synchronously
            //   AxDialog.error(message: error).show(context);
            // }

            return true;
          },
        ),

        // AxStep(
        //   title: 'I\'m a...',
        //   content: const AxStatusStep(),
        //   onNext: () async {
        //     return true;
        //   },
        // ),
        // const AxStep(content: AxEducationStep()),

        // AxStep(
        //   title: 'My major is ...',
        //   content: Column(
        //     children: [
        //       AxSelectorBuilder<AxProfile>(
        //         selector: axProfileSingleton.selector(),
        //         builder: (context, profile) {
        //           print('profile.majorId: ${profile.majorId}');
        //           return MajorSelect(
        //             schoolId: profile.schoolId,
        //             selectedId: profile.majorId,
        //             onChange: (nv) => axProfileSingleton.set((p) => p.copyWith(majorId: nv.id)),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        // const AxStep(content: AxDegreeStep()),
        // AxStep(
        //   title: 'I will graduate in...',
        //   content: AxDatetimeSelect(
        //     title: 'Graduation date',
        //     sheetTitle: 'Expected graduation date',
        //     date: gradYear.value,
        //     showShortcuts: false,
        //     onChanged: (nv) {
        //       if (nv == null) return;
        //       gradYear.value = nv;
        //     },
        //   ),
        // ),
        const AxStep(content: AxProfileStep()),
        const AxStep(content: PreSurveyStep()),
        // const AxStep(content: AxSecretHubStep()),
      ],
    );
  }
}
